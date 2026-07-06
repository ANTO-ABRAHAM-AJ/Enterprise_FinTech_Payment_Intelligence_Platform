/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
File: 05_Indexes.sql

Purpose:
Create Non-Clustered Indexes on the Fact_PaymentTransactions 
table to dramatically reduce query execution time for analytics.
==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

PRINT '--- Beginning Index Creation ---';

--------------------------------------------------------------
-- 1. Index: TimeKey (Crucial for Time-Series Analysis)
--------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Fact_TimeKey' AND object_id = OBJECT_ID('dbo.Fact_PaymentTransactions'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_TimeKey 
    ON dbo.Fact_PaymentTransactions(TimeKey);
    PRINT 'Created Index: IX_Fact_TimeKey';
END
GO

--------------------------------------------------------------
-- 2. Index: TransactionTypeKey (Crucial for Segmenting Risk)
--------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Fact_TransactionTypeKey' AND object_id = OBJECT_ID('dbo.Fact_PaymentTransactions'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_TransactionTypeKey 
    ON dbo.Fact_PaymentTransactions(TransactionTypeKey);
    PRINT 'Created Index: IX_Fact_TransactionTypeKey';
END
GO

--------------------------------------------------------------
-- 3. Index: FraudKey (Crucial for Fraud Filtering)
--------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Fact_FraudKey' AND object_id = OBJECT_ID('dbo.Fact_PaymentTransactions'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_FraudKey 
    ON dbo.Fact_PaymentTransactions(FraudKey);
    PRINT 'Created Index: IX_Fact_FraudKey';
END
GO

--------------------------------------------------------------
-- 4. Index: SourceAccount (Optimizes Sender Behavioral Analytics)
--------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Fact_SourceAccount' AND object_id = OBJECT_ID('dbo.Fact_PaymentTransactions'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_SourceAccount 
    ON dbo.Fact_PaymentTransactions(SourceAccount);
    PRINT 'Created Index: IX_Fact_SourceAccount';
END
GO

--------------------------------------------------------------
-- 5. Index: DestinationAccount (Optimizes Receiver Risk Profiling)
--------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Fact_DestinationAccount' AND object_id = OBJECT_ID('dbo.Fact_PaymentTransactions'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_DestinationAccount 
    ON dbo.Fact_PaymentTransactions(DestinationAccount);
    PRINT 'Created Index: IX_Fact_DestinationAccount';
END
GO

--------------------------------------------------------------
-- 6. Index: Amount (Optimizes High-Value Transaction Sweeps)
--------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Fact_Amount' AND object_id = OBJECT_ID('dbo.Fact_PaymentTransactions'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_Amount 
    ON dbo.Fact_PaymentTransactions(Amount);
    PRINT 'Created Index: IX_Fact_Amount';
END
GO

PRINT '--- All Indexes Created Successfully ---';
GO

/*==============================================================
Step 7 : Verify Created Indexes
==============================================================*/

SELECT
    i.name AS IndexName,
    i.type_desc AS IndexType,
    OBJECT_NAME(i.object_id) AS TableName
FROM sys.indexes i
WHERE OBJECT_NAME(i.object_id) = 'Fact_PaymentTransactions'
ORDER BY i.name;
GO