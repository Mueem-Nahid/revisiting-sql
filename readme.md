# Revisiting SQL

Welcome to the "Revisiting SQL" repository! This repository contains SQL queries, indexing techniques, stored procedures, functions, triggers, and Python scripts to insert large amounts of data into a database using bulk insert and multithreading.

## Table of Contents

- [Revisiting SQL](#revisiting-sql)
  - [Table of Contents](#table-of-contents)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [SQL](#sql)
    - [Basic to Advanced Queries](#basic-to-advanced-queries)
    - [Indexing](#indexing)
    - [Stored Procedures and Functions](#stored-procedures-and-functions)
    - [Triggers](#triggers)
    - [Useful resources](#useful-resources)
  - [Python Scripts](#python-scripts)
    - [Bulk Data Insertion](#bulk-data-insertion)
    - [Multithreading](#multithreading)

# Getting Started

### Prerequisites

Before using the scripts and SQL queries in this repository, make sure you have the following prerequisites:

- [PostgreSQL](https://www.postgresql.org/) (or another compatible relational database system)
- Python 3.7
- [Virtual environment](https://www.geeksforgeeks.org/creating-python-virtual-environment-windows-linux/)

## Setup

- Clone the repository
- Enter the directory and create virtual env and activate
- Run `pip install -r requirements.txt`
- Setup the `.env` file
  Now you can run the pyhton scripts.

## SQL

### Basic to Advanced Queries

This section contains a collection of SQL queries ranging from basic to advanced. You can find examples of various SQL operations and techniques.

### Indexing

Learn about indexing in SQL, how it works, and its importance for optimizing query performance.

### Stored Procedures and Functions

Explore the use of stored procedures and functions in SQL to encapsulate and reuse code for common tasks.

### Triggers

Discover how triggers can be used in SQL to automatically respond to database events.

### Useful resources

- https://tableplus.com/blog/2018/04/postgresql-how-to-grant-access-to-users.html
- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-data-types/
- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-insert-multiple-rows/
- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-primary-key/
- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-unique-constraint/
- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-alter-table/
- https://www.databasestar.com

## Python Scripts

### Bulk Data Insertion

Use Python scripts to insert a large amount of data into your database using bulk insert techniques. This can be helpful for efficient data migration or testing.

### Multithreading

Learn how to use multithreading in Python to insert data concurrently and improve data insertion performance.
