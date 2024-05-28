/* Dropping existing tables if they exist */
DROP TABLE IF EXISTS ORDER_CONTAINS;
DROP TABLE IF EXISTS CUSTOMER_ORDER;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS VEHICLE;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEALERSHIP;

/* Creating the DEALERSHIP table */
CREATE TABLE DEALERSHIP (
    DealershipID INTEGER, 
    DealershipName VARCHAR(50), 
    StreetAddress VARCHAR(30), 
    City VARCHAR(20), 
    ZipCode INTEGER, 
    State VARCHAR(15), 
    PhoneNumber VARCHAR(14), 
    Email VARCHAR(50), 
    NumberOfChargers INTEGER, 
    SqrFootage INTEGER,
    CONSTRAINT Dealership_PK PRIMARY KEY (DealershipID)
);

/* Creating the VEHICLE table */
CREATE TABLE VEHICLE (
    VIN VARCHAR(25),
    VehicleModel VARCHAR(15),
    VehicleYear INTEGER,
    VehicleColor VARCHAR(15), 
    VehicleMileage INTEGER, 
    VehiclePrice INTEGER, 
    BatteryType VARCHAR(15), 
    NumberOfDoors INTEGER, 
    DateReceived VARCHAR(20),
    CONSTRAINT Vehicle_PK PRIMARY KEY (VIN)
);

/* Creating the EMPLOYEE table */
CREATE TABLE EMPLOYEE (
    EmployeeID INTEGER,
    DealershipID INTEGER,
    FirstName VARCHAR(15),
    LastName VARCHAR(20),
    DateOfBirth VARCHAR(15),
    StreetAddress VARCHAR(50),
    City VARCHAR(50),
    ZipCode INTEGER,
    PhoneNumber VARCHAR(14),
    Salary DECIMAL(8,2),
    Commission INTEGER,
    CONSTRAINT Employee_PK PRIMARY KEY (EmployeeID),
    CONSTRAINT Employee_Dealership_FK FOREIGN KEY (DealershipID) REFERENCES DEALERSHIP (DealershipID)
);

/* Creating the CUSTOMER table */
CREATE TABLE CUSTOMER (
    CustomerID INTEGER,
    EmployeeID INTEGER,
    FirstName VARCHAR(15),
    LastName VARCHAR(15),
    StreetAddress VARCHAR(30),
    City VARCHAR(20),
    ZipCode INTEGER,
    State VARCHAR(15),
    PhoneNumber VARCHAR(14),
    Email VARCHAR(50), 
    CONSTRAINT Customer_PK PRIMARY KEY (CustomerID),
    CONSTRAINT CUSTOMER_FK FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID)
);

/* Creating the CUSTOMER_ORDER table */
CREATE TABLE CUSTOMER_ORDER (
    CustomerOrderID INTEGER,
    DealershipID INTEGER,
    CustomerID INTEGER,
    OrderType VARCHAR(15),
    CustomerOrderDate VARCHAR(15),
    CustomerOrderDue VARCHAR(15),
    CustomerOrderBilling VARCHAR(30),
    CONSTRAINT CustomerOrder_PK PRIMARY KEY (CustomerOrderID),
    CONSTRAINT CustomerOrder_Dealership_FK FOREIGN KEY (DealershipID) REFERENCES DEALERSHIP (DealershipID),
    CONSTRAINT CustomerOrder_Customer_FK FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID)
);

/* Creating the ORDER_CONTAINS table */
CREATE TABLE ORDER_CONTAINS (
    CustomerOrderID INTEGER,
    VIN VARCHAR(17),
    CONSTRAINT ORDER_CONTAINS_PK PRIMARY KEY (CustomerOrderID, VIN),
    CONSTRAINT ORDER_CONTAINS_VIN_ForeignKey FOREIGN KEY (VIN) REFERENCES VEHICLE (VIN),
    CONSTRAINT ORDER_CONTAINS_OrderID_FK FOREIGN KEY (CustomerOrderID) REFERENCES CUSTOMER_ORDER (CustomerOrderID)
);

/* Inserting data into DEALERSHIP table */
INSERT INTO DEALERSHIP VALUES 
(101, 'Serramonte Tesla', '1500 Collins Ave', 'Colma', 94014, 'California', '6504882984', 'colma_ordersupport@tesla.com', 4, 21034),
(102, 'Burlingame Tesla', '50 Edwards Court', 'Burlingame', 94010, 'California', '6503421176', 'burlingame_ordersupport@tesla.com', 12, 26132),
(103, 'Los Angeles Tesla', '1200 Dog Street', 'Los Angeles', 93012, 'California', '6614021020', 'LosAngelas_ordersupport@tesla.com', 8, 40123);

SELECT * FROM DEALERSHIP;

/* Inserting data into VEHICLE table */
INSERT INTO VEHICLE VALUES 
('WBAFF02010LJ14669', 'Model S', 2022, 'White', 375, 93740, 'Dual Motor', 4, '2022-01-05'),
('1B7HF13Y2WJ198530', 'Model Y', 2022, 'Blue', 330, 62990, 'Dual Motor', 4, '2022-03-07'),
('JKBVNKD167A013982', 'Model X', 2022, 'Black', 333, 138990, 'Tri Motor', 4, '2022-04-15'),
('WP0AC29945S692185', 'Model S Plaid', 2021, 'Blue', 396, 135990, 'Tri Motor', 4, '2021-07-23'),
('1GNDS13S132266223', 'Model X', 2022, 'White', 351, 138990, 'Tri Motor', 4, '2022-02-17'),
('1FAFP66L0WK258659', 'Model 3', 2020, 'Silver', 370, 452353, 'Dual Motor', 4, '2021-06-22'),
('SCBBR53W36C034889', 'Model S', 2022, 'White', 450, 234723, 'Tri Motor', 4, '2021-05-14'),
('JH4NA1261PT000302', 'Model Y', 2021, 'Black', 369, 451945, 'Dual Motor', 4, '2020-03-11'),
('2HGES15252H603204', 'Model X', 2022, 'Red', 237, 139012, 'Tri Motor', 4, '2022-02-22'),
('JH4KA3270LC001300', 'Model 3', 2022, 'White', 451, 134091, 'Dual Motor', 4, '2021-03-22'),
('JM1BF2325G0V37585', 'Model S', 2021, 'Silver', 821, 519378, 'Dual Motor', 4 ,'2021-06-21'),
('WDBAB23ADCB324720', 'Model Y', 2020, 'Blue', 412, 834978, 'Dual Motor', 4, '2021-06-21'),
('JH4DB7540RS001911', 'Model X', 2022, 'Black', 318, 935234, 'Tri Motor', 4, '2022-05-26'),
('WD5WD641525381291', 'Model 3', 2021, 'Red', 624, 708375, 'Tri Motor', 4, '2020-09-30'),
('WT1WX124029301231', 'Model S', 2020, 'White', 353, 709175, 'Dual Motor', 4 ,'2022-04-12'),
('JTHBP5C21B5009664', 'Model 3', 2021, 'Black', 415, 315234, 'Tri Motor', 4, '2021-05-23'),
('1GNEK13T7YJ204464', 'Model X', 2021, 'Blue', 310, 932334, 'Tri Motor', 4, '2022-09-21'),
('JH4KA7680RC011845', 'Model S', 2022, 'White', 211, 138232, 'Dual Motor', 4, '2021-03-13'),
('1J4GZ58S7VC697710', 'Model 3', 2020, 'Black', 398, 912234, 'Tri Motor', 4, '2022-02-01'),
('1G8ZH528X2Z310309', 'Model X', 2021, 'Blue', 210, 451334, 'Tri Motor', 4, '2021-04-14');

SELECT * FROM VEHICLE;

/* Inserting data into EMPLOYEE table */
INSERT INTO EMPLOYEE VALUES 
(201, 101, 'Mickey', 'Mouse', '01/01/1990', '1234 Sesame Street', 'San Francisco', 94017, '6505555555', 100000, 5000),
(202, 102, 'John', 'Smith', '05/07/1984', '552 Dream Street', 'Burlingame', 94010, '4157824343', 65000, 2500),
(203, 103, 'Jane', 'Doe', '04/17/1975', '12 B street', 'Los Angeles', 90001, '9255671234', 72500, 3250),
(204, 102, 'May', 'Lee', '06/16/1979', '14 Bay Drive', 'San Carlos', 94070, '6508881245', 81000, 4700),
(205, 101, 'Jordan', 'Michael', '02/23/1998', '112 Green Drive', 'Daly City', 94014, '4158782356', 72300, 3170),
(206, 103, 'Dory', 'Fisher', '11/09