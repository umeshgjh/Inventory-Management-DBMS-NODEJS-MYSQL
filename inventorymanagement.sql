CREATE database if not exists project;
use project;
-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Description TEXT,
    Category VARCHAR(100),
    SupplierID INT,
    Price DECIMAL(10, 2),
    QuantityInStock INT
);

-- Create Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255),
    ContactInformation VARCHAR(100),
    Address VARCHAR(255),
    ContactPerson VARCHAR(255)
);

-- Create Inventory Transactions Table
CREATE TABLE InventoryTransactions (
    TransactionID INT PRIMARY KEY,
    TransactionType VARCHAR(50),
    ProductID INT,
    Quantity INT,
    TransactionDate DATE,
    UnitPrice DECIMAL(10, 2),
    TotalCost DECIMAL(10, 2),
    CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    QuantitySold INT,
    SaleDate DATE,
    TotalRevenue DECIMAL(10, 2),
    CONSTRAINT FK_ProductID_Sales FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(255), -- hashed for security
    Role ENUM('cashier', 'manager', 'administrator')
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierID INT,
    OrderDate DATE,
    ExpectedDeliveryDate DATE,
    Status ENUM('pending', 'delivered', 'canceled'),
    CONSTRAINT FK_SupplierID FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Sample data for Products Table
INSERT INTO Products (ProductID, ProductName, Description, Category, SupplierID, Price, QuantityInStock) VALUES
(1, 'Apple', 'Fresh red apples', 'Fruits', 1, 2.99, 100),
(2, 'Milk', 'Whole milk', 'Dairy', 2, 1.99, 50),
(3, 'Bread', 'Whole wheat bread', 'Bakery', 3, 3.49, 75),
(4, 'Chicken', 'Boneless chicken breast', 'Meat', 4, 5.99, 30),
(5, 'Cereal', 'Corn flakes cereal', 'Breakfast', 5, 4.79, 40);

INSERT INTO Products (ProductID, ProductName, Description, Category, SupplierID, Price, QuantityInStock) VALUES
(31, 'Apple', 'Fresh red apples', 'Fruits', 1, 2.99, 100);
-- Sample data for Suppliers Table
INSERT INTO Suppliers (SupplierID, SupplierName, ContactInformation, Address, ContactPerson) VALUES
(1, 'Fresh Produce Inc.', '123-456-7890', '123 Main St, City, Country', 'John Smith'),
(2, 'Dairy Farms Co.', '987-654-3210', '456 Oak St, City, Country', 'Emily Johnson'),
(3, 'Bakery Delights Ltd.', '555-123-4567', '789 Elm St, City, Country', 'Michael Brown'),
(4, 'Meat Producers Corp.', '222-333-4444', '321 Pine St, City, Country', 'Sarah Davis'),
(5, 'Cereal Brands Ltd.', '999-888-7777', '654 Maple St, City, Country', 'David Wilson');

-- Sample data for Inventory Transactions Table
INSERT INTO InventoryTransactions (TransactionID, TransactionType, ProductID, Quantity, TransactionDate, UnitPrice, TotalCost) VALUES
(1, 'Purchase', 1, 200, '2024-02-10', 2.50, 500.00),
(2, 'Sale', 1, 50, '2024-02-11', 2.99, 149.50),
(3, 'Purchase', 2, 100, '2024-02-08', 1.50, 150.00),
(4, 'Sale', 2, 20, '2024-02-12', 1.99, 39.80),
(5, 'Adjustment', 3, -5, '2024-02-09', NULL, NULL);

-- Sample data for Sales Table
INSERT INTO Sales (SaleID, ProductID, QuantitySold, SaleDate, TotalRevenue) VALUES
(1, 1, 50, '2024-02-11', 149.50),
(2, 2, 20, '2024-02-12', 39.80);

-- Sample data for Users Table
INSERT INTO Users (UserID, Username, Password, Role) VALUES
(1, 'cashier1', 'hashedpassword1', 'cashier'),
(2, 'manager1', 'hashedpassword2', 'manager'),
(3, 'admin1', 'hashedpassword3', 'administrator');

-- Sample data for Orders Table
INSERT INTO Orders (SupplierID, OrderDate, ExpectedDeliveryDate, Status) VALUES
(1, '2024-02-10', '2024-02-15', 'pending'),
(2, '2024-02-08', '2024-02-12', 'delivered'),
(3, '2024-02-09', '2024-02-14', 'canceled'),
(4, '2024-02-11', '2024-02-16', 'pending'),
(5, '2024-02-12', '2024-02-17', 'delivered');

-- Sample data for Products Table (25 records)
INSERT INTO Products (ProductID, ProductName, Description, Category, SupplierID, Price, QuantityInStock) VALUES
(6, 'Orange', 'Fresh oranges', 'Fruits', 1, 1.99, 80),
(7, 'Yogurt', 'Plain yogurt', 'Dairy', 2, 3.49, 45),
(8, 'Baguette', 'French baguette', 'Bakery', 3, 2.99, 60),
(9, 'Beef', 'Ground beef', 'Meat', 4, 7.99, 25),
(10, 'Eggs', 'Large eggs', 'Dairy', 2, 2.29, 70),
(11, 'Banana', 'Ripe bananas', 'Fruits', 1, 0.99, 120),
(12, 'Cheese', 'Cheddar cheese', 'Dairy', 2, 4.99, 35),
(13, 'Croissant', 'Butter croissant', 'Bakery', 3, 1.79, 55),
(14, 'Pork', 'Pork chops', 'Meat', 4, 6.49, 40),
(15, 'Oatmeal', 'Instant oatmeal', 'Breakfast', 5, 3.99, 60),
(16, 'Grapes', 'Seedless grapes', 'Fruits', 1, 3.49, 90),
(17, 'Butter', 'Salted butter', 'Dairy', 2, 2.99, 40),
(18, 'Bagel', 'Plain bagel', 'Bakery', 3, 1.49, 75),
(19, 'Salmon', 'Fresh salmon fillet', 'Seafood', 6, 9.99, 20),
(20, 'Pancake Mix', 'Buttermilk pancake mix', 'Breakfast', 5, 2.49, 50),
(21, 'Pineapple', 'Fresh pineapple', 'Fruits', 1, 4.99, 60),
(22, 'Sour Cream', 'Sour cream', 'Dairy', 2, 1.79, 30),
(23, 'Baguette', 'Whole grain baguette', 'Bakery', 3, 3.29, 45),
(24, 'Shrimp', 'Large shrimp', 'Seafood', 6, 12.99, 15),
(25, 'Maple Syrup', 'Pure maple syrup', 'Breakfast', 5, 6.99, 25),
-- Add 5 more records
(26, 'Watermelon', 'Sweet watermelon', 'Fruits', 1, 3.99, 40),
(27, 'Whipped Cream', 'Whipped cream', 'Dairy', 2, 2.49, 25),
(28, 'French Baguette', 'French baguette', 'Bakery', 3, 2.79, 55),
(29, 'Cod', 'Atlantic cod fillet', 'Seafood', 6, 8.99, 30),
(30, 'Granola', 'Mixed nuts granola', 'Breakfast', 5, 5.49, 35);

-- Sample data for Suppliers Table (25 records)
INSERT INTO Suppliers (SupplierID, SupplierName, ContactInformation, Address, ContactPerson) VALUES
(6, 'Green Grocers Co.', '111-222-3333', '789 Pine St, City, Country', 'Laura Adams'),
(7, 'Dairy Delights Inc.', '444-555-6666', '890 Oak St, City, Country', 'Daniel Brown'),
(8, 'Bakery Treats Ltd.', '777-888-9999', '456 Maple St, City, Country', 'Emma White'),
(9, 'Meat Masters Inc.', '333-444-5555', '321 Elm St, City, Country', 'Mark Johnson'),
(10, 'Seafood Suppliers Ltd.', '666-777-8888', '987 Cedar St, City, Country', 'Olivia Jones'),
(11, 'Organic Harvest Co.', '333-222-1111', '654 Birch St, City, Country', 'Ethan Roberts'),
(12, 'Dairy Heaven Ltd.', '111-222-3333', '789 Maple St, City, Country', 'Sophia Garcia'),
(13, 'Fresh Meat Inc.', '555-666-7777', '321 Oak St, City, Country', 'Nathan Martinez'),
(14, 'Bakery Delights II', '888-999-0000', '456 Elm St, City, Country', 'Olivia Anderson'),
(15, 'Fruit Farm Suppliers', '444-333-2222', '987 Walnut St, City, Country', 'Liam Wilson'),
(16, 'Organic Dairy Co.', '777-888-9999', '123 Pine St, City, Country', 'Ava Johnson'),
(17, 'Meat Kingdom Ltd.', '111-222-3333', '789 Oak St, City, Country', 'Noah Hernandez'),
(18, 'Bakery Treats III', '555-666-7777', '456 Birch St, City, Country', 'Isabella Taylor'),
(19, 'Seafood Delights', '888-999-0000', '321 Cedar St, City, Country', 'Mia Garcia'),
(20, 'Fresh Produce II', '444-333-2222', '987 Maple St, City, Country', 'Elijah Martinez'),
-- Add 5 more records
(21, 'Dairy Delights III', '777-888-9999', '123 Elm St, City, Country', 'Amelia Robinson'),
(22, 'Meat Masters II', '111-222-3333', '789 Pine St, City, Country', 'James Brown'),
(23, 'Bakery Elegance', '555-666-7777', '456 Oak St, City, Country', 'Sophia Thompson'),
(24, 'Fresh Fish Inc.', '888-999-0000', '321 Elm St, City, Country', 'Lucas Lewis'),
(25, 'Produce Paradise', '444-333-2222', '987 Maple St, City, Country', 'Avery Lee');

-- Sample data for Inventory Transactions Table (25 records)
INSERT INTO InventoryTransactions (TransactionID, TransactionType, ProductID, Quantity, TransactionDate, UnitPrice, TotalCost) VALUES
(6, 'Sale', 3, 20, '2024-02-12', 3.49, 69.80),
(7, 'Purchase', 4, 50, '2024-02-10', 4.50, 225.00),
(8, 'Sale', 4, 10, '2024-02-13', 5.99, 59.90),
(9, 'Adjustment', 4, -5, '2024-02-14', NULL, NULL),
(10, 'Purchase', 5, 60, '2024-02-11', 4.00, 240.00),
(11, 'Sale', 5, 30, '2024-02-12', 4.79, 143.70),
(12, 'Purchase', 6, 100, '2024-02-09', 1.00, 100.00),
(13, 'Sale', 6, 50, '2024-02-14', 1.99, 99.50),
(14, 'Purchase', 7, 80, '2024-02-08', 2.00, 160.00),
(15, 'Sale', 7, 40, '2024-02-15', 3.49, 139.60),
(16, 'Purchase', 8, 60, '2024-02-10', 1.25, 75.00),
(17, 'Sale', 8, 30, '2024-02-13', 2.99, 89.70),
(18, 'Purchase', 9, 25, '2024-02-11', 6.50, 162.50),
(19, 'Sale', 9, 15, '2024-02-14', 7.99, 119.85),
(20, 'Purchase', 10, 70, '2024-02-12', 2.00, 140.00),
(21, 'Sale', 10, 40, '2024-02-15', 2.29, 91.60),
(22, 'Purchase', 11, 120, '2024-02-09', 0.80, 96.00),
(23, 'Sale', 11, 80, '2024-02-14', 0.99, 79.20),
(24, 'Purchase', 12, 35, '2024-02-10', 4.00, 140.00),
(25, 'Sale', 12, 15, '2024-02-16', 4.99, 74.85),
-- Add 10 more records
(26, 'Purchase', 13, 50, '2024-02-11', 2.50, 125.00),
(27, 'Sale', 13, 20, '2024-02-16', 3.99, 79.80),
(28, 'Purchase', 14, 75, '2024-02-09', 3.00, 225.00),
(29, 'Sale', 14, 30, '2024-02-17', 4.49, 134.70),
(30, 'Purchase', 15, 90, '2024-02-08', 3.50, 315.00),
(31, 'Sale', 15, 50, '2024-02-18', 4.99, 249.50),
(32, 'Purchase', 16, 60, '2024-02-10', 2.00, 120.00),
(33, 'Sale', 16, 25, '2024-02-19', 2.99, 74.75),
(34, 'Purchase', 17, 40, '2024-02-11', 1.50, 60.00),
(35, 'Sale', 17, 15, '2024-02-20', 1.99, 29.85),
-- Add 15 more records
(36, 'Purchase', 18, 100, '2024-02-12', 3.00, 300.00),
(37, 'Sale', 18, 60, '2024-02-21', 4.49, 269.40),
(38, 'Purchase', 19, 30, '2024-02-13', 8.00, 240.00),
(39, 'Sale', 19, 20, '2024-02-22', 9.99, 199.80),
(40, 'Purchase', 20, 80, '2024-02-14', 2.50, 200.00),
(41, 'Sale', 20, 40, '2024-02-23', 3.79, 151.60),
(42, 'Purchase', 21, 120, '2024-02-15', 1.00, 120.00),
(43, 'Sale', 21, 70, '2024-02-24', 1.49, 104.30),
(44, 'Purchase', 22, 50, '2024-02-16', 4.00, 200.00),
(45, 'Sale', 22, 25, '2024-02-25', 4.99, 124.75),
-- Add 10 more records
(46, 'Purchase', 23, 70, '2024-02-17', 3.00, 210.00),
(47, 'Sale', 23, 50, '2024-02-26', 3.49, 174.50),
(48, 'Purchase', 24, 40, '2024-02-18', 11.00, 440.00),
(49, 'Sale', 24, 20, '2024-02-27', 12.99, 259.80),
(50, 'Purchase', 25, 25, '2024-02-19', 6.50, 162.50),
(51, 'Sale', 25, 15, '2024-02-28', 7.99, 119.85),
(52, 'Purchase', 26, 50, '2024-02-20', 1.50, 75.00),
(53, 'Sale', 26, 30, '2024-02-29', 2.29, 68.70),
(54, 'Purchase', 27, 80, '2024-02-21', 2.00, 160.00),
(55, 'Sale', 27, 50, '2024-03-01', 2.99, 149.50);

-- Sample data for Sales Table (25 records)
INSERT INTO Sales (SaleID, ProductID, QuantitySold, SaleDate, TotalRevenue) VALUES
(3, 3, 20, '2024-02-12', 69.80),
(4, 4, 10, '2024-02-13', 59.90),
(5, 5, 30, '2024-02-12', 143.70),
(6, 6, 50, '2024-02-14', 99.50),
(7, 7, 40, '2024-02-15', 139.60),
(8, 8, 30, '2024-02-13', 89.70),
(9, 9, 15, '2024-02-14', 119.85),
(10, 10, 40, '2024-02-15', 91.60),
(11, 11, 80, '2024-02-14', 79.20),
(12, 12, 15, '2024-02-16', 74.85),
-- Add 5 more records
(13, 13, 20, '2024-02-16', 79.80),
(14, 14, 30, '2024-02-17', 134.70),
(15, 15, 50, '2024-02-18', 249.50),
(16, 16, 25, '2024-02-19', 74.75),
(17, 17, 15, '2024-02-20', 29.85),
-- Add 5 more records
(18, 18, 60, '2024-02-21', 269.40),
(19, 19, 20, '2024-02-22', 199.80),
(20, 20, 40, '2024-02-23', 151.60),
(21, 21, 70, '2024-02-24', 104.30),
(22, 22, 25, '2024-02-25', 124.75),
-- Add 3 more records
(23, 23, 50, '2024-02-26', 174.50),
(24, 24, 20, '2024-02-27', 259.80),
(25, 25, 15, '2024-02-28', 119.85);

-- Sample data for Users Table (25 records)
INSERT INTO Users (UserID, Username, Password, Role) VALUES
(4, 'cashier2', 'hashedpassword4', 'cashier'),
(5, 'manager2', 'hashedpassword5', 'manager'),
(6, 'admin2', 'hashedpassword6', 'administrator'),
(7, 'cashier3', 'hashedpassword7', 'cashier'),
(8, 'manager3', 'hashedpassword8', 'manager'),
(9, 'admin3', 'hashedpassword9', 'administrator'),
(10, 'cashier4', 'hashedpassword10', 'cashier'),
(11, 'manager4', 'hashedpassword11', 'manager'),
(12, 'admin4', 'hashedpassword12', 'administrator'),
(13, 'cashier5', 'hashedpassword13', 'cashier'),
(14, 'manager5', 'hashedpassword14', 'manager'),
(15, 'admin5', 'hashedpassword15', 'administrator'),
(16, 'cashier6', 'hashedpassword16', 'cashier'),
(17, 'manager6', 'hashedpassword17', 'manager'),
(18, 'admin6', 'hashedpassword18', 'administrator'),
(19, 'cashier7', 'hashedpassword19', 'cashier'),
(20, 'manager7', 'hashedpassword20', 'manager'),
(21, 'admin7', 'hashedpassword21', 'administrator'),
(22, 'cashier8', 'hashedpassword22', 'cashier'),
(23, 'manager8', 'hashedpassword23', 'manager'),
(24, 'admin8', 'hashedpassword24', 'administrator'),
(25, 'cashier9', 'hashedpassword25', 'cashier'),
(26, 'manager9', 'hashedpassword26', 'manager'),
(27, 'admin9', 'hashedpassword27', 'administrator');

-- Sample data for Orders Table (25 records)
INSERT INTO Orders (SupplierID, OrderDate, ExpectedDeliveryDate, Status) VALUES
(6, '2024-02-22', '2024-02-27', 'delivered'),
(7, '2024-02-19', '2024-02-24', 'canceled'),
(8, '2024-02-23', '2024-02-28', 'delivered'),
(9, '2024-02-18', '2024-02-23', 'delivered'),
(10, '2024-02-21', '2024-02-26', 'pending'),
(11, '2024-02-24', '2024-02-29', 'pending'),
(12, '2024-02-17', '2024-02-22', 'delivered'),
(13, '2024-02-20', '2024-02-25', 'canceled'),
(14, '2024-02-25', '2024-03-01', 'pending'),
(15, '2024-02-16', '2024-02-21', 'delivered'),
(16, '2024-02-19', '2024-02-24', 'canceled'),
(17, '2024-02-22', '2024-02-27', 'pending'),
(18, '2024-02-15', '2024-02-20', 'delivered'),
(19, '2024-02-18', '2024-02-23', 'pending'),
(20, '2024-02-21', '2024-02-26', 'delivered'),
(21, '2024-02-14', '2024-02-19', 'canceled'),
(22, '2024-02-17', '2024-02-22', 'pending'),
(23, '2024-02-20', '2024-02-25', 'delivered'),
(24, '2024-02-13', '2024-02-18', 'pending'),
(25, '2024-02-16', '2024-02-21', 'delivered');

INSERT INTO Users (UserID, Username, Password, Role) VALUES
(77,'dev','dev1','administrator');

-- Show data from Products Table
SELECT * FROM Products;
-- Show data from Suppliers Table
SELECT * FROM Suppliers;

-- Show data from Inventory Transactions Table
SELECT * FROM InventoryTransactions;

-- Show data from Sales Table
SELECT * FROM Sales;

-- Show data from Users Table
SELECT * FROM Users;

-- Show data from Orders Table
SELECT * FROM Orders;

ALTER TABLE Products MODIFY COLUMN ProductID INT AUTO_INCREMENT;
SELECT
   CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM
   INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
   TABLE_SCHEMA = 'project' AND
   TABLE_NAME = 'InventoryTransactions' AND
   REFERENCED_TABLE_NAME = 'Products' AND
   REFERENCED_COLUMN_NAME = 'ProductID';

ALTER TABLE InventoryTransactions DROP FOREIGN KEY FK_ProductID;
ALTER TABLE Products MODIFY COLUMN ProductID INT AUTO_INCREMENT;
ALTER TABLE Sales DROP FOREIGN KEY FK_ProductID_Sales;
SELECT
   CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM
   INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
   TABLE_SCHEMA = 'project' AND
   TABLE_NAME = 'Sales' AND
   REFERENCED_TABLE_NAME = 'Products' AND
   REFERENCED_COLUMN_NAME = 'ProductID';
   
ALTER TABLE Products MODIFY COLUMN ProductID INT AUTO_INCREMENT;

ALTER TABLE InventoryTransactions ADD CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID);
ALTER TABLE Sales ADD CONSTRAINT FK_ProductID_Sales FOREIGN KEY (ProductID) REFERENCES Products(ProductID);


SELECT * FROM Products WHERE QuantityInStock < 50;


SELECT * FROM Products WHERE Category = 'Fruits' AND Price < 2;

SELECT p.ProductName, s.SupplierName, o.OrderDate
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN Orders o ON p.SupplierID = o.SupplierID;


CREATE VIEW TransactionDetails AS
SELECT t.TransactionID, p.ProductName, t.Quantity, t.TransactionDate
FROM InventoryTransactions t
INNER JOIN Products p ON t.ProductID = p.ProductID;
SELECT * FROM TransactionDetails;


CREATE TRIGGER UpdateQuantityAfterSale
AFTER INSERT ON Sales
FOR EACH ROW
UPDATE Products
SET QuantityInStock = QuantityInStock - NEW.QuantitySold
WHERE ProductID = NEW.ProductID;
SELECT TRIGGER_NAME, EVENT_MANIPULATION, EVENT_OBJECT_TABLE, ACTION_STATEMENT
FROM information_schema.TRIGGERS
WHERE TRIGGER_NAME = 'UpdateQuantityAfterSale';

DELIMITER //

CREATE PROCEDURE UpdatePriceBy10Percent()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE productId INT;
    DECLARE cur CURSOR FOR SELECT ProductID FROM Products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO productId;
        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE Products
        SET Price = Price * 1.1
        WHERE ProductID = productId;
    END LOOP;

    CLOSE cur;
END//

DELIMITER ;

SELECT ROUTINE_NAME, ROUTINE_DEFINITION
FROM information_schema.ROUTINES
WHERE ROUTINE_NAME = 'UpdatePriceBy10Percent';


-- Implementation of Lock-Based Concurrency Control

-- Table to store locks
CREATE TABLE Locks (
    LockID INT AUTO_INCREMENT PRIMARY KEY,
    ResourceID INT,
    LockType ENUM('shared', 'exclusive'),
    TransactionID INT,
    FOREIGN KEY (ResourceID) REFERENCES Products(ProductID)
);

-- Procedure to acquire a lock
DELIMITER //
CREATE PROCEDURE AcquireLock(
    IN resourceId INT,
    IN lockType ENUM('shared', 'exclusive'),
    IN transactionId INT
)
BEGIN
    -- Check if the resource is already locked
    IF EXISTS (SELECT * FROM Locks WHERE ResourceID = resourceId) THEN
        -- Handle conflicts based on lock type
        IF lockType = 'exclusive' THEN
            SET @dummy = 'Wait or abort conflicting transactions';
        ELSE
            -- Check if an exclusive lock exists, if yes, wait or abort conflicting transactions
            SET @dummy = 'Wait or abort conflicting transactions';
        END IF;
    END IF;

    -- Acquire the lock
    INSERT INTO Locks (ResourceID, LockType, TransactionID)
    VALUES (resourceId, lockType, transactionId);
END//
DELIMITER ;


-- Implementation of Recovery Mechanisms

-- Table for storing transaction logs
CREATE TABLE TransactionLogs (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    TransactionID INT,
    Operation ENUM('insert', 'update', 'delete'),
    TableAffected VARCHAR(50),
    RowID INT,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Procedure to log transaction operations
DELIMITER //
CREATE PROCEDURE LogTransaction(
    IN transactionId INT,
    IN operation ENUM('insert', 'update', 'delete'),
    IN tableAffected VARCHAR(50),
    IN rowId INT
)
BEGIN
    -- Log the transaction operation
    INSERT INTO TransactionLogs (TransactionID, Operation, TableAffected, RowID)
    VALUES (transactionId, operation, tableAffected, rowId);
END//
DELIMITER ;

-- Procedure to recover from failure using logs
DELIMITER //
CREATE PROCEDURE RecoverFromFailure()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE logId INT;
    DECLARE logCursor CURSOR FOR SELECT LogID FROM TransactionLogs ORDER BY Timestamp ASC;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN logCursor;

    read_loop: LOOP
        FETCH logCursor INTO logId;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Apply the logged operation to the database
        -- (This is a simplified example, actual implementation would depend on the specific operation)
        -- For example, if operation is 'insert', insert the row into the table
        -- If operation is 'update', update the row in the table
        -- If operation is 'delete', delete the row from the table
    END LOOP;

    CLOSE logCursor;
END//
DELIMITER ;


SELECT * FROM information_schema.ROUTINES WHERE ROUTINE_SCHEMA = 'project';

SHOW TABLES LIKE 'Locks';

