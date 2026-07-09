/*
===============================================================================
Enterprise FinTech Payment Intelligence Platform
File: 01_Views.sql

Purpose:
Create reusable SQL Views for analytics and reporting.

Author: Anto Abraham AJ
===============================================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

/*
===============================================================================
VIEW 1: Payment Summary
Business Purpose: Provide a reusable dataset containing transaction, time,
account, and fraud information.
===============================================================================
*/
CREATE VIEW vw_PaymentSummary
AS
SELECT
    F.TransactionID,
    T.DayNumber,
    T.HourOfSimulation,
    T.PeriodOfDay,
    TT.TransactionType,
    SA.SourceAccountID,
    DA.DestinationAccountID,
    DF.IsFraud,
    DF.IsFlaggedFraud,
    F.Amount
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
INNER JOIN dbo.Dim_DestinationAccount DA
    ON F.DestinationAccountKey = DA.DestinationAccountKey;
GO

-- Test View 1
PRINT 'Testing vw_PaymentSummary';
SELECT TOP (20) * FROM vw_PaymentSummary;
GO

/*
===============================================================================
VIEW 2: Fraud Summary
Business Purpose: Provide a simplified fraud dataset for reporting.
===============================================================================
*/
CREATE VIEW vw_FraudSummary
AS
SELECT
    F.TransactionID,
    TT.TransactionType,
    T.DayNumber,
    T.PeriodOfDay,
    SA.SourceAccountID,
    DA.DestinationAccountID,
    F.Amount,
    DF.IsFraud,
    DF.IsFlaggedFraud
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
INNER JOIN dbo.Dim_DestinationAccount DA
    ON F.DestinationAccountKey = DA.DestinationAccountKey
WHERE DF.IsFraud = 1;
GO

-- Test View 2
PRINT 'Testing vw_FraudSummary';
SELECT TOP (20) * FROM vw_FraudSummary;
GO

/*
===============================================================================
VIEW 3: Daily Transaction Summary
Business Purpose: Summarize daily payment activity.
===============================================================================
*/
CREATE VIEW vw_DailyTransactionSummary
AS
SELECT
    T.DayNumber,
    COUNT(*) AS TotalTransactions,
    SUM(F.Amount) AS TotalTransactionValue,
    AVG(F.Amount) AS AverageTransactionValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
GROUP BY T.DayNumber;
GO

-- Test View 3
PRINT 'Testing vw_DailyTransactionSummary';
SELECT * FROM vw_DailyTransactionSummary ORDER BY DayNumber;
GO

/*
===============================================================================
VIEW 4: Transaction Type Summary
Business Purpose: Summarize transaction activity by payment mechanism.
===============================================================================
*/
CREATE VIEW vw_TransactionTypeSummary
AS
SELECT
    TT.TransactionType,
    COUNT(*) AS TotalTransactions,
    SUM(F.Amount) AS TotalTransactionValue,
    AVG(F.Amount) AS AverageTransactionValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
GROUP BY TT.TransactionType;
GO

-- Test View 4
PRINT 'Testing vw_TransactionTypeSummary';
SELECT * FROM vw_TransactionTypeSummary;
GO