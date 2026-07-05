/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
05_Indexes.sql
==============================================================

Author  : Anto Abraham AJ
Database: Enterprise_FinTech_Payment_Intelligence

Purpose:
Create indexes on the Fact table to improve query performance.

==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

--------------------------------------------------------------
-- Step 1 : View Existing Indexes
--------------------------------------------------------------

SELECT
    name AS IndexName,
    type_desc,
    OBJECT_NAME(object_id) AS TableName
FROM sys.indexes
WHERE OBJECT_NAME(object_id) = 'Fact_PaymentTransactions';
GO

--------------------------------------------------------------
-- Step 2 : Create Index on TransactionTypeKey
--------------------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'IX_Fact_TransactionType'
)
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_TransactionType
    ON dbo.Fact_PaymentTransactions(TransactionTypeKey);
END
GO

--------------------------------------------------------------
-- Step 3 : Create Index on FraudKey
--------------------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'IX_Fact_Fraud'
)
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_Fraud
    ON dbo.Fact_PaymentTransactions(FraudKey);
END
GO

--------------------------------------------------------------
-- Step 4 : Create Index on Step
--------------------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'IX_Fact_Step'
)
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_Step
    ON dbo.Fact_PaymentTransactions(Step);
END
GO

--------------------------------------------------------------
-- Step 5 : Create Index on Amount
--------------------------------------------------------------

IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'IX_Fact_Amount'
)
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_Amount
    ON dbo.Fact_PaymentTransactions(Amount);
END
GO

--------------------------------------------------------------
-- Step 6 : Verify All Indexes
--------------------------------------------------------------

SELECT
    name AS IndexName,
    type_desc,
    OBJECT_NAME(object_id) AS TableName
FROM sys.indexes
WHERE OBJECT_NAME(object_id) = 'Fact_PaymentTransactions';
GO

--------------------------------------------------------------
-- Step 7 : Test Query Performance
--------------------------------------------------------------

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT *
FROM dbo.Fact_PaymentTransactions
WHERE TransactionTypeKey = 4;
GO

SELECT *
FROM dbo.Fact_PaymentTransactions
WHERE FraudKey = 2;
GO

SELECT *
FROM dbo.Fact_PaymentTransactions
WHERE Amount > 100000;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO