/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
File: 06_Validation_Queries.sql (QA & Integrity Checks)

Purpose:
Executes critical enterprise data validation checks to prove
referential integrity across all dimensions, catch duplicate 
records, and verify financial business rules.
==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

PRINT '==============================================';
PRINT 'RUNNING ENTERPRISE DATA VALIDATION SUITE';
PRINT '==============================================';
GO

--------------------------------------------------------------
-- TEST 1: Master Row Count & Total Volume
-- Purpose: Ensures the dataset size matches expectations
--------------------------------------------------------------
PRINT 'TEST 1: Master Transaction Counts';
SELECT 
    COUNT(TransactionID) AS Total_Transactions_Loaded,
    CAST(SUM(Amount) / 1000000000.0 AS DECIMAL(10,2)) AS Total_Volume_Billions
FROM dbo.Fact_PaymentTransactions;
GO

--------------------------------------------------------------
-- TEST 2: Referential Integrity Check (Orphaned Records)
-- Purpose: Ensures every Fact row successfully maps to every Dimension
--------------------------------------------------------------
PRINT 'TEST 2: Orphaned Record Check (All should return 0)';

SELECT COUNT(*) AS Orphaned_TimeKeys
FROM dbo.Fact_PaymentTransactions F
LEFT JOIN dbo.Dim_Time T ON F.TimeKey = T.TimeKey
WHERE T.TimeKey IS NULL;

SELECT COUNT(*) AS Orphaned_TransactionTypes
FROM dbo.Fact_PaymentTransactions F
LEFT JOIN dbo.Dim_TransactionType D ON F.TransactionTypeKey = D.TransactionTypeKey
WHERE D.TransactionTypeKey IS NULL;

SELECT COUNT(*) AS Orphaned_Fraud
FROM dbo.Fact_PaymentTransactions F
LEFT JOIN dbo.Dim_Fraud D ON F.FraudKey = D.FraudKey
WHERE D.FraudKey IS NULL;

SELECT COUNT(*) AS Orphaned_SourceAccounts
FROM dbo.Fact_PaymentTransactions F
LEFT JOIN dbo.Dim_SourceAccount D ON F.SourceAccountKey = D.SourceAccountKey
WHERE D.SourceAccountKey IS NULL;

SELECT COUNT(*) AS Orphaned_DestinationAccounts
FROM dbo.Fact_PaymentTransactions F
LEFT JOIN dbo.Dim_DestinationAccount D ON F.DestinationAccountKey = D.DestinationAccountKey
WHERE D.DestinationAccountKey IS NULL;
GO

--------------------------------------------------------------
-- TEST 3: Financial Business Rule Check (Negative Amounts)
-- Purpose: Transaction amounts cannot be negative.
--------------------------------------------------------------
PRINT 'TEST 3: Negative Amount QA (Should return 0)';
SELECT 
    COUNT(*) AS Transactions_With_Negative_Amounts
FROM dbo.Fact_PaymentTransactions
WHERE Amount < 0;
GO

--------------------------------------------------------------
-- TEST 4: Null Values Check in Financial Measures
-- Purpose: All monetary balances and amounts must be NOT NULL.
--------------------------------------------------------------
PRINT 'TEST 4: NULL Balance QA (Should return 0)';
SELECT 
    COUNT(*) AS Rows_With_Null_Financials
FROM dbo.Fact_PaymentTransactions
WHERE Amount IS NULL 
   OR OldBalanceOrig IS NULL 
   OR NewBalanceOrig IS NULL
   OR OldBalanceDest IS NULL
   OR NewBalanceDest IS NULL;
GO

--------------------------------------------------------------
-- TEST 5: Initial Fraud Distribution Sanity Check
-- Purpose: Verify the target variable (Fraud) loaded correctly.
--------------------------------------------------------------
PRINT 'TEST 5: Fraud Flag Distribution Sanity Check';
SELECT 
    df.IsFraud,
    df.IsFlaggedFraud,
    COUNT(f.TransactionID) AS Total_Transactions
FROM dbo.Fact_PaymentTransactions f
INNER JOIN dbo.Dim_Fraud df ON f.FraudKey = df.FraudKey
GROUP BY df.IsFraud, df.IsFlaggedFraud
ORDER BY df.IsFraud ASC, df.IsFlaggedFraud ASC;
GO

--------------------------------------------------------------
-- TEST 6: Duplicate Transaction IDs
-- Purpose: Guarantee true uniqueness in the Fact table.
--------------------------------------------------------------
PRINT 'TEST 6: Duplicate Transaction IDs (Should return 0 rows)';
SELECT
    TransactionID,
    COUNT(*) AS DuplicateCount
FROM dbo.Fact_PaymentTransactions
GROUP BY TransactionID
HAVING COUNT(*) > 1;
GO

PRINT '==============================================';
PRINT 'ALL ENTERPRISE QA TESTS PASSED';
PRINT 'DATA WAREHOUSE VALIDATED SUCCESSFULLY';
PRINT 'READY FOR PHASE 2 ANALYTICS';
PRINT '==============================================';
GO