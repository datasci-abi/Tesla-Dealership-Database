Tesla Dealership Database
Overview
This project is a SQL-based system for managing a Tesla dealership database, including information about dealerships, vehicles, employees, customers, and orders. The system allows for the tracking of vehicle sales, customer orders, and employee commissions across multiple Tesla dealerships.

Database Structure
The database consists of six main tables:

DEALERSHIP: Stores information about different Tesla dealerships, including their location, contact details, and available facilities.

VEHICLE: Contains details about the available Tesla vehicles, including VIN, model, year, color, price, and battery type.

EMPLOYEE: Holds data about employees working at different dealerships, including their salaries and commission rates.

CUSTOMER: Contains customer information, such as contact details and the employee who assisted them.

CUSTOMER_ORDER: Tracks orders placed by customers, including the dealership, order type, and due date.

ORDER_CONTAINS: Relates customer orders to the specific vehicles purchased, tracking which vehicles are part of an order.

Table Relationships
Dealership → Employee: A dealership can have multiple employees.
Employee → Customer: Each customer is linked to an employee who assisted them.
Customer → Customer Order: Each customer can have multiple orders.
Customer Order → Vehicle: Each order contains one or more vehicles.
Key SQL Commands
Dropping Tables
The existing tables are dropped at the start to ensure the database can be rebuilt cleanly without errors:

sql
Copy code
DROP TABLE IF EXISTS ORDER_CONTAINS, CUSTOMER_ORDER, CUSTOMER, VEHICLE, EMPLOYEE, DEALERSHIP;
Creating Tables
Tables are created for each entity in the system. Primary keys and foreign keys are set to define the relationships between the tables.

Example: Creating the DEALERSHIP table.

sql
Copy code
CREATE TABLE DEALERSHIP (
    DealershipID INTEGER PRIMARY KEY,
    DealershipName VARCHAR(50),
    StreetAddress VARCHAR(30),
    City VARCHAR(20),
    ZipCode INTEGER,
    State VARCHAR(15),
    PhoneNumber VARCHAR(14),
    Email VARCHAR(50),
    NumberOfChargers INTEGER,
    SqrFootage INTEGER
);
Inserting Data
Data is inserted into each table, including details for dealerships, vehicles, employees, and customers.

Example: Inserting data into the DEALERSHIP table.

sql
Copy code
INSERT INTO DEALERSHIP VALUES
(101, 'Serramonte Tesla', '1500 Collins Ave', 'Colma', 94014, 'California', '6504882984', 'colma_ordersupport@tesla.com', 4, 21034),
(102, 'Burlingame Tesla', '50 Edwards Court', 'Burlingame', 94010, 'California', '6503421176', 'burlingame_ordersupport@tesla.com', 12, 26132),
(103, 'Los Angeles Tesla', '1200 Dog Street', 'Los Angeles', 93012, 'California', '6614021020', 'LosAngelas_ordersupport@tesla.com', 8, 40123);
Queries
Once the tables are created and populated with data, SQL queries can be used to extract useful information, such as retrieving all vehicles, viewing employee data, or tracking customer orders.

Example: Retrieving all vehicles.

sql
Copy code
SELECT * FROM VEHICLE;
How to Run
Setup: To run this project, copy the SQL code and execute it in a database management system that supports SQL (such as MySQL, PostgreSQL, or SQLite).

Database Initialization: The script first drops any existing tables, then creates the necessary tables, and finally inserts sample data into them.

Executing Queries: After setup, you can run queries to retrieve and manipulate the data stored in the database.

Requirements
A SQL-compatible database management system (MySQL, PostgreSQL, SQLite, etc.)
Basic understanding of SQL to run and modify queries.
Future Improvements
Add more advanced queries to handle reporting, such as total sales by dealership or employee performance tracking.
Implement triggers and stored procedures for automating updates and validations.
Add more tables for services, maintenance records, and warranty management.
Conclusion
This database system provides a solid foundation for managing Tesla dealership data, from vehicles and employees to customer orders. It can be extended further to handle more complex operations and integrate with applications for real-time data access. Feel free to explore and expand the project for additional features!
