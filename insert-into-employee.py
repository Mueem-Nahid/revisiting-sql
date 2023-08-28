import psycopg2
import random
import string
import time
import threading
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# Function to generate random strings
def generate_random_string(length):
    letters = string.ascii_letters
    return ''.join(random.choice(letters) for _ in range(length))

# Function to insert employee data in bulk
def insert_employees_bulk(start, end):
    conn = psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )
    cursor = conn.cursor()

    employee_values = []
    for _ in range(start, end):
        employee_name = generate_random_string(10)
        department_id = random.randint(1, 100)  # Department IDs from 1 to 100
        salary = random.randint(10000, 999999)
        employee_values.append((employee_name, department_id, salary))

        if len(employee_values) >= 1000:  # Bulk insert in chunks of 1000
            cursor.executemany("INSERT INTO Employee (employee_name, department_id, salary) VALUES (%s, %s, %s)", employee_values)
            employee_values = []
            conn.commit()
            print('Data inserted', len(employee_values))

    if employee_values:  # Insert remaining data
        cursor.executemany("INSERT INTO Employee (employee_name, department_id, salary) VALUES (%s, %s, %s)", employee_values)
        conn.commit()

    conn.close()

# Number of threads and total employee rows
num_threads = 4
total_employee_rows = 5000000

# Divide the work among threads
employee_rows_per_thread = total_employee_rows // num_threads

# Create and start threads for Employee insertion
employee_threads = []
start_time = time.time()

for i in range(num_threads):
    start = i * employee_rows_per_thread
    end = (i + 1) * employee_rows_per_thread if i != num_threads - 1 else total_employee_rows
    thread = threading.Thread(target=insert_employees_bulk, args=(start, end))
    employee_threads.append(thread)
    thread.start()

# Wait for employee threads to finish
for thread in employee_threads:
    thread.join()

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Insertion of 10 million employees took {elapsed_time:.2f} seconds.")
