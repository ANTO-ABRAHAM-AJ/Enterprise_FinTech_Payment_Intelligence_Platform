/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
File: 06_Validation_Queries.sql

Purpose:
Final validation of the Data Warehouse after loading, modeling,
and indexing. Ensures data integrity before Phase 2 Analytics.
==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

PRINT '--- 1. Validating Table Row Counts ---';
SELECT 'payment_transactions_raw' AS TableName, COUNT(*) AS TotalRows FROM dbo.payment_transactions_raw
UNION ALL
SELECT 'stg_payment_transactions', COUNT(*) FROM dbo.stg_payment_transactions
UNION ALL
SELECT 'Fact_PaymentTransactions', COUNT(*) FROM dbo.Fact_PaymentTransactions
UNION ALL
SELECT 'Dim_Time', COUNT(*) FROM dbo.Dim_Time
UNION ALL
SELECT 'Dim_TransactionType', COUNT(*) FROM dbo.Dim_TransactionType
UNION ALL
SELECT 'Dim_Fraud', COUNT(*) FROM dbo.Dim_Fraud;
GO

PRINT '--- 2. Validating Foreign Key Relationships ---';
SELECT
    FK.name AS ForeignKeyName,
    OBJECT_NAME(FK.parent_object_id) AS FactTable,
    OBJECT_NAME(FK.referenced_object_id) AS DimensionTable
FROM sys.foreign_keys FK
WHERE OBJECT_NAME(FK.parent_object_id) = 'Fact_PaymentTransactions';
GO

PRINT '--- 3. Checking for NULLs in Fact Table ---';
SELECT
    SUM(CASE WHEN TimeKey IS NULL THEN 1 ELSE 0 END) AS Null_TimeKey,
    SUM(CASE WHEN TransactionTypeKey IS NULL THEN 1 ELSE 0 END) AS Null_TransactionTypeKey,
    SUM(CASE WHEN FraudKey IS NULL THEN 1 ELSE 0 END) AS Null_FraudKey,
    SUM(CASE WHEN SourceAccount IS NULL THEN 1 ELSE 0 END) AS Null_SourceAccount,
    SUM(CASE WHEN DestinationAccount IS NULL THEN 1 ELSE 0 END) AS Null_DestinationAccount,
    SUM(CASE WHEN Amount IS NULL THEN 1 ELSE 0 END) AS Null_Amount
FROM dbo.Fact_PaymentTransactions;
GO

PRINT '--- 4. Previewing Final Fact Data (Top 10 Rows) ---';
SELECT TOP 10 *
FROM dbo.Fact_PaymentTransactions;
GO

PRINT '==========================================';
PRINT 'PHASE 1: DATA ENGINEERING COMPLETELY LOCKED';
PRINT '==========================================';
GO

PRINT '--- 5. Validating Indexes ---';

SELECT
    i.name AS IndexName,
    i.type_desc AS IndexType
FROM sys.indexes i
WHERE OBJECT_NAME(i.object_id) = 'Fact_PaymentTransactions'
ORDER BY i.name;
GO