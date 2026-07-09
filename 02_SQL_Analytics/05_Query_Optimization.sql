/*
===============================================================================
Enterprise FinTech Payment Intelligence Platform
File: 05_Query_Optimization.sql

Purpose:
Demonstrate SQL Server query optimization techniques by evaluating
execution plans, index usage, and query performance.

Author: Anto Abraham AJ
===============================================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

PRINT '=========================================================';
PRINT 'SQL QUERY OPTIMIZATION & PERFORMANCE ANALYSIS';
PRINT '=========================================================';
GO

/*
===============================================================================
STEP 1: Enable Performance Statistics
===============================================================================
*/
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

/*
===============================================================================
KPI 1: Query Using Indexed Foreign Key
Business Objective: Retrieve all CASH_OUT transactions.
===============================================================================
*/
SELECT
    TT.TransactionType,
    F.Amount
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
WHERE TT.TransactionType = 'CASH_OUT';
GO

/*
===============================================================================
STEP 2: Actual Execution Plan
Shortcut: Ctrl + M
Execute the query again to view the graphical plan.
===============================================================================
*/
SELECT
    TT.TransactionType,
    COUNT(*) AS TotalTransactions
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
GROUP BY TT.TransactionType;
GO

/*
===============================================================================
KPI 2: Verify Index Usage
Business Objective: Check how SQL Server is utilizing indexes on the Fact table.
===============================================================================
*/
SELECT
    OBJECT_NAME(S.object_id) AS TableName,
    I.name AS IndexName,
    S.user_seeks,
    S.user_scans,
    S.user_lookups,
    S.user_updates
FROM sys.dm_db_index_usage_stats S
INNER JOIN sys.indexes I
    ON S.object_id = I.object_id 
    AND S.index_id = I.index_id
WHERE OBJECT_NAME(S.object_id) = 'Fact_PaymentTransactions';
GO

/*
===============================================================================
KPI 3: Fraud Query Performance
Business Objective: Evaluate performance of multi-index joins filtering for fraud.
===============================================================================
*/
SELECT
    TT.TransactionType,
    COUNT(*) AS FraudTransactions,
    SUM(F.Amount) AS FraudAmount
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
WHERE DF.IsFraud = 1
GROUP BY TT.TransactionType;
GO

/*
===============================================================================
KPI 4: Time-Series Performance
Business Objective: Evaluate aggregation performance over the Time dimension.
===============================================================================
*/
SELECT
    T.DayNumber,
    SUM(F.Amount) AS DailyTransactionValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
GROUP BY T.DayNumber
ORDER BY T.DayNumber;
GO

/*
===============================================================================
KPI 5: Top Source Accounts
Business Objective: Evaluate performance grouping high-cardinality account data.
===============================================================================
*/
SELECT TOP (10)
    SA.SourceAccountID,
    SUM(F.Amount) AS TotalAmount
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
GROUP BY SA.SourceAccountID
ORDER BY TotalAmount DESC;
GO

/*
===============================================================================
STEP 3: Disable Statistics
===============================================================================
*/
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

/*
===============================================================================
Optimization Summary
Business Objective: Document the final index architecture supporting the queries.
===============================================================================
*/
SELECT
    Table_Name = t.name,
    Index_Name = i.name,
    Index_Type = i.type_desc
FROM sys.indexes i
INNER JOIN sys.tables t
    ON i.object_id = t.object_id
WHERE t.name = 'Fact_PaymentTransactions'
ORDER BY i.name;
GO