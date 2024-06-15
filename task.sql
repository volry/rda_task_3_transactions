-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)


-- Insert the product with the correct initial WarehouseAmount
INSERT INTO Products (ID, Name, Description, Price, WarehouseAmount)
VALUES (1, 'AwesomeProduct', 'Product Description', 5, 42)
ON DUPLICATE KEY UPDATE WarehouseAmount = 42;

-- Insert a customer
INSERT INTO Customers (ID, FirstName, LastName, Email, Address)
VALUES (1, 'John', 'Doe', 'j@doe.ua', 'far, far away')
ON DUPLICATE KEY UPDATE Email = 'j@doe.ua';

-- Some data should be created outside the transaction
INSERT INTO Orders (ID, CustomerID, Date) VALUES (1, 1, '2023-01-01');

-- Start the transaction
START TRANSACTION;

-- Add the OrderItem inside the transaction
INSERT INTO OrderItems (ID, OrderID, ProductID, Count) VALUES (1, 1, 1, 1);

-- Update the Products table inside the transaction
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;

-- Commit the transaction
COMMIT;
