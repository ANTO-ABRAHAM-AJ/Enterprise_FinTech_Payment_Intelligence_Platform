/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
06_Validation_Queries.sql
==============================================================

Author  : Anto Abraham AJ
Database: Enterprise_FinTech_Payment_Intelligence

Purpose:
Validate the Data Warehouse after loading and modeling.

==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

--------------------------------------------------------------
-- Validation 1 : Raw Table Row Count
--------------------------------------------------------------

SELECT
    'payment_transactions_raw' AS TableName,
    COUNT(*) AS TotalRows
FROM dbo.payment_transactions_raw;
GO

--------------------------------------------------------------
-- Validation 2 : Staging Table Row Count
--------------------------------------------------------------

SELECT
    'stg_payment_transactions' AS TableName,
    COUNT(*) AS TotalRows
FROM dbo.stg_payment_transactions;
GO

--------------------------------------------------------------
-- Validation 3 : Fact Table Row Count
--------------------------------------------------------------

SELECT
    'Fact_PaymentTransactions' AS TableName,
    COUNT(*) AS TotalRows
FROM dbo.Fact_PaymentTransactions;
GO

--------------------------------------------------------------
-- Validation 4 : Transaction Type Dimension
--------------------------------------------------------------

SELECT *
FROM dbo.Dim_TransactionType;
GO

--------------------------------------------------------------
-- Validation 5 : Fraud Dimension
--------------------------------------------------------------

SELECT *
FROM dbo.Dim_Fraud;
GO

--------------------------------------------------------------
-- Validation 6 : Sample Fact Records
--------------------------------------------------------------

SELECT TOP 10 *
FROM dbo.Fact_PaymentTransactions;
GO

--------------------------------------------------------------
-- Validation 7 : Transaction Type Distribution
--------------------------------------------------------------

SELECT
    DT.TransactionType,
    COUNT(*) AS TotalTransactions
FROM dbo.Fact_PaymentTransactions F
JOIN dbo.Dim_TransactionType DT
ON F.TransactionTypeKey = DT.TransactionTypeKey
GROUP BY DT.TransactionType
ORDER BY TotalTransactions DESC;
GO

--------------------------------------------------------------
-- Validation 8 : Fraud Distribution
--------------------------------------------------------------

SELECT
    DF.IsFraud,
    DF.IsFlaggedFraud,
    COUNT(*) AS TotalTransactions
FROM dbo.Fact_PaymentTransactions F
JOIN dbo.Dim_Fraud DF
ON F.FraudKey = DF.FraudKey
GROUP BY
    DF.IsFraud,
    DF.IsFlaggedFraud
ORDER BY TotalTransactions DESC;
GO

--------------------------------------------------------------
-- Validation 9 : Amount Statistics
--------------------------------------------------------------

SELECT
    MIN(Amount) AS MinimumAmount,
    MAX(Amount) AS MaximumAmount,
    AVG(Amount) AS AverageAmount,
    SUM(Amount) AS TotalAmount
FROM dbo.Fact_PaymentTransactions;
GO

--------------------------------------------------------------
-- Validation 10 : Check NULL Values
--------------------------------------------------------------

SELECT
    SUM(CASE WHEN TransactionTypeKey IS NULL THEN 1 ELSE 0 END) AS Null_TransactionTypeKey,
    SUM(CASE WHEN FraudKey IS NULL THEN 1 ELSE 0 END) AS Null_FraudKey,
    SUM(CASE WHEN Step IS NULL THEN 1 ELSE 0 END) AS Null_Step,
    SUM(CASE WHEN Amount IS NULL THEN 1 ELSE 0 END) AS Null_Amount
FROM dbo.Fact_PaymentTransactions;
GO

--------------------------------------------------------------
-- Validation 11 : Duplicate Transaction IDs
--------------------------------------------------------------

SELECT
    TransactionID,
    COUNT(*) AS DuplicateCount
FROM dbo.Fact_PaymentTransactions
GROUP BY TransactionID
HAVING COUNT(*) > 1;
GO

--------------------------------------------------------------
-- Validation 12 : Foreign Key Validation
--------------------------------------------------------------

SELECT
    FK.name AS ForeignKeyName,
    OBJECT_NAME(FK.parent_object_id) AS FactTable,
    OBJECT_NAME(FK.referenced_object_id) AS DimensionTable
FROM sys.foreign_keys FK
WHERE OBJECT_NAME(FK.parent_object_id)='Fact_PaymentTransactions';
GO

--------------------------------------------------------------
-- Validation Complete
--------------------------------------------------------------

PRINT '==========================================';
PRINT 'DATA WAREHOUSE VALIDATION COMPLETED';
PRINT 'All validation queries executed successfully.';
PRINT '==========================================';
GO