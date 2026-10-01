# MySQL Database Analysis Portfolio

**Summary:** I used related customer, order, and return records to investigate return patterns and demonstrate how SQL can support review of business activity.

**Project type:** Academic MySQL database and analysis exercise.

## Business Questions and Evidence

**Questions:** Where are returns concentrated, which product types account for a larger share of returns, and how can a requested record update be verified?

**My role:** I built related tables, wrote joins and aggregate queries, updated and checked an RMA record, and prepared a CSV export.

**Available evidence:** The documented location query reports 505 orders for customers in Framingham, Massachusetts. [Analysis queries](analysis_queries.sql) show how to summarize returns by state and product description; [database setup](database_setup.sql) shows the table structure.

**Interpretation and limits:** A high return count does not by itself establish a high return rate or a product-quality problem. The product percentage query measures share of all RMA records, not returns divided by sales for each product. The repository does not include the source dataset or full return-analysis output, so those findings cannot be independently reproduced here.

**Recommendation:** Use the return summaries to identify areas for further review, then compare returns with sales volume and examine return reasons before recommending corrective action. Check missing values, duplicate records, and join coverage before relying on the totals; completed cleaning results are not claimed in this repository.

A beginner MySQL project demonstrating relational database design, SQL queries, data analysis, record updates, and CSV export.

## About the Project

This project demonstrates foundational MySQL skills through the creation and analysis of a relational database containing customer, order, and return merchandise authorization (RMA) data.

The database uses three related tables:

- `Customers`
- `Orders`
- `RMA`

Primary and foreign keys were used to create relationships between customers, orders, and return records.

## Skills Demonstrated

- MySQL
- Relational database design
- Primary and foreign keys
- Table creation
- Data imports
- SQL joins
- WHERE filtering
- Aggregate functions
- Record updates
- Query verification
- Data analysis
- CSV export

## Database Structure

The database contains three related tables:

### Customers
Stores customer information using `CustomerID` as the primary key.

### Orders
Stores order information using `OrderID` as the primary key and `CustomerID` as a foreign key connecting each order to a customer.

### RMA
Stores return merchandise authorization information using `RMAID` as the primary key and `OrderID` as a foreign key connecting each return to an order.

## SQL Query Example

A JOIN was used to connect the `Customers` and `Orders` tables and count orders associated with customers located in Framingham, Massachusetts.

```sql
SELECT COUNT(*)
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE c.City = 'Framingham'
    AND c.State = 'Massachusetts';
```

**Result:** 505 orders


## Updating and Verifying Data

An RMA record was updated to reflect a completed return process.

```sql
UPDATE RMA
SET Status = 'Complete',
    Step = 'Credit Customer Account'
WHERE OrderID = 5175;
```

A follow-up query was then used to verify that the update was successfully applied.

```sql
SELECT Status, Step
FROM RMA
WHERE OrderID = 5175;
```

Using a verification query helps confirm that the intended record was changed and that the stored values match the requested update.

## Data Analysis

SQL queries were also used to analyze product return activity.

The analysis examined:

- Returns by state
- Returns by product type
- Geographic return patterns
- Products with higher return activity

The results demonstrated how SQL can be used to turn database records into information that supports business analysis and decision-making.

## CSV Export

Order data was exported from MySQL into a structured CSV file for use in spreadsheets and other data analysis tools.

```sql
SELECT *
FROM Orders
INTO OUTFILE '/home/codio/workspace/orders_output.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
```

The export contained approximately **38,000 order records**.

## Key Takeaways

This project helped me develop foundational experience with:

- Building relational database structures
- Connecting tables through keys
- Retrieving information from multiple tables
- Filtering and summarizing data
- Updating and verifying records
- Using SQL to support business analysis
- Preparing database information for use in other tools

I am continuing to develop my SQL and relational database skills through hands-on practice.





