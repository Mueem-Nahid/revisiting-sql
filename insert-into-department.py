import psycopg2
import random
import string
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# Function to generate random strings
def generate_random_string(length):
    letters = string.ascii_letters
    return ''.join(random.choice(letters) for _ in range(length))

# Function to insert department data
def insert_departments():
    conn = psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )
    cursor = conn.cursor()

    for i in range(1, 101):  # Department IDs from 1 to 100
        department_name = generate_random_string(10)
        query = f"INSERT INTO Department (department_id, department_name) VALUES ({i}, '{department_name}')"
        cursor.execute(query)
        
    conn.commit()
    print('Data inserted into department.')
    conn.close()

# Run the function to insert department data
insert_departments()
