-- MySQL Database Setup
-- Demonstrates relational database design using primary and foreign keys.

CREATE DATABASE QuantigrationUpdates;

USE QuantigrationUpdates;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Telephone VARCHAR(20)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    SKU VARCHAR(25),
    Description VARCHAR(75),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE RMA (
    RMAID INT PRIMARY KEY,
    OrderID INT,
    Step VARCHAR(50),
    Status VARCHAR(15),
    Reason VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Verify table structures
DESCRIBE Customers;
DESCRIBE Orders;
DESCRIBE RMA;
