/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
File: 05_Indexes.sql (Phase 1 Final Step)

Purpose:
Creates Non-Clustered Indexes on the Fact table foreign keys
and highly queried measures (Amount) to optimize Phase 2 
analytics and BI reporting performance.
==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

PRINT '--- Beginning Index Creation ---';
PRINT '--- (Please wait... indexing 6.3 million rows takes a moment) ---';
GO

--------------------------------------------------------------
-- 1. Index: TimeKey (Crucial for Time-Series Analytics)
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
-- 4. Index: SourceAccountKey (Optimizes Sender Behavioral Analytics)
--------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Fact_SourceAccountKey' AND object_id = OBJECT_ID('dbo.Fact_PaymentTransactions'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_SourceAccountKey 
    ON dbo.Fact_PaymentTransactions(SourceAccountKey);
    PRINT 'Created Index: IX_Fact_SourceAccountKey';
END
GO

--------------------------------------------------------------
-- 5. Index: DestinationAccountKey (Optimizes Receiver Risk Profiling)
--------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Fact_DestinationAccountKey' AND object_id = OBJECT_ID('dbo.Fact_PaymentTransactions'))
BEGIN
    CREATE NONCLUSTERED INDEX IX_Fact_DestinationAccountKey 
    ON dbo.Fact_PaymentTransactions(DestinationAccountKey);
    PRINT 'Created Index: IX_Fact_DestinationAccountKey';
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

PRINT '==============================================';
PRINT 'ALL INDEXES CREATED SUCCESSFULLY';
PRINT 'Phase 1: Data Architecture is 100% Complete.';
PRINT '==============================================';
GO

--------------------------------------------------------------
-- 7. Verify Created Indexes
--------------------------------------------------------------
PRINT '';
PRINT '--- Verifying Created Indexes ---';
GO

SELECT
    t.name AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType
FROM sys.indexes i
INNER JOIN sys.tables t
    ON i.object_id = t.object_id
WHERE t.name = 'Fact_PaymentTransactions'
AND i.type_desc = 'NONCLUSTERED'
ORDER BY i.name;
GO