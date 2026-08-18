-- MySQL Analysis Queries
-- Demonstrates joins, filtering, aggregation, updates, verification, and export.

USE QuantigrationUpdates;

-- Count orders for customers in Framingham, Massachusetts
SELECT COUNT(*) AS FraminghamOrderCount
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE c.City = 'Framingham'
    AND c.State = 'Massachusetts';

-- Analyze the number of returns by state
SELECT c.State,
       COUNT(*) AS NumberOfReturns
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN RMA r
    ON o.OrderID = r.OrderID
GROUP BY c.State
ORDER BY NumberOfReturns DESC;

-- Analyze the percentage of returns by product type
SELECT o.Description,
       COUNT(*) AS ReturnCount,
       ROUND(
           COUNT(*) * 100.0 /
           (SELECT COUNT(*) FROM RMA),
           2
       ) AS ReturnPercentage
FROM Orders o
JOIN RMA r
    ON o.OrderID = r.OrderID
GROUP BY o.Description
ORDER BY ReturnCount DESC;

-- Update an RMA record
UPDATE RMA
SET Status = 'Complete',
    Step = 'Credit Customer Account'
WHERE OrderID = 5175;

-- Verify the update
SELECT Status, Step
FROM RMA
WHERE OrderID = 5175;

-- Export order data to CSV
SELECT *
FROM Orders
INTO OUTFILE '/home/codio/workspace/orders_output.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
