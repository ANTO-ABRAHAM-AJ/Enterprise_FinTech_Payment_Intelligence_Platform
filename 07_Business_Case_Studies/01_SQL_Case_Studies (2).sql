/*
===============================================================================
Enterprise FinTech Payment Intelligence Platform
File: 06_Business_Case_Studies.sql

Purpose:
Solve real-world FinTech business problems using advanced SQL techniques
including CTEs, Window Functions, Ranking, and Business Analysis.

Author: Anto Abraham AJ
===============================================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

/*
===============================================================================
CASE STUDY 1: Fraud Spike Investigation
Business Problem: Identify the day with the highest number of fraudulent transactions.
===============================================================================
*/
SELECT
    T.DayNumber,
    COUNT(*) AS FraudTransactions,
    SUM(F.Amount) AS FraudAmount
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
WHERE DF.IsFraud = 1
GROUP BY T.DayNumber
ORDER BY FraudTransactions DESC;
GO

/*
===============================================================================
CASE STUDY 2: Top Fraud Contributors
Business Problem: Identify source accounts responsible for the largest fraud amounts.
===============================================================================
*/
SELECT TOP (10)
    SA.SourceAccountID,
    COUNT(*) AS FraudTransactions,
    SUM(F.Amount) AS TotalFraudAmount,
    RANK() OVER (ORDER BY SUM(F.Amount) DESC) AS FraudRank
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
WHERE DF.IsFraud = 1
GROUP BY SA.SourceAccountID
ORDER BY FraudRank;
GO

/*
===============================================================================
CASE STUDY 3: Suspicious High-Value Accounts
Business Problem: Identify accounts sending unusually large transaction values.
===============================================================================
*/
SELECT TOP (20)
    SA.SourceAccountID,
    SUM(F.Amount) AS TotalAmountSent,
    AVG(F.Amount) AS AverageAmount,
    MAX(F.Amount) AS LargestTransaction
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
GROUP BY SA.SourceAccountID
ORDER BY TotalAmountSent DESC;
GO

/*
===============================================================================
CASE STUDY 4: Transaction Velocity Analysis
Business Problem: Identify highly active source accounts.
===============================================================================
*/
SELECT TOP (20)
    SA.SourceAccountID,
    COUNT(*) AS TransactionCount,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS ActivityRank
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
GROUP BY SA.SourceAccountID
ORDER BY ActivityRank;
GO

/*
===============================================================================
CASE STUDY 5: Fraud Hotspot Detection
Business Problem: Find the combination of day, period, and transaction type with the highest fraud concentration.
===============================================================================
*/
SELECT
    T.DayNumber,
    T.PeriodOfDay,
    TT.TransactionType,
    COUNT(*) AS FraudTransactions
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
WHERE DF.IsFraud = 1
GROUP BY
    T.DayNumber,
    T.PeriodOfDay,
    TT.TransactionType
ORDER BY FraudTransactions DESC;
GO

/*
===============================================================================
CASE STUDY 6: Customer Activity Segmentation
Business Problem: Segment source accounts based on transaction frequency.
===============================================================================
*/
WITH AccountActivity AS (
    SELECT
        SA.SourceAccountID,
        COUNT(*) AS Transactions
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_SourceAccount SA
        ON F.SourceAccountKey = SA.SourceAccountKey
    GROUP BY SA.SourceAccountID
)
SELECT
    SourceAccountID,
    Transactions,
    CASE 
        WHEN Transactions >= 100 THEN 'High Activity'
        WHEN Transactions >= 20 THEN 'Medium Activity'
        ELSE 'Low Activity'
    END AS ActivitySegment
FROM AccountActivity
ORDER BY Transactions DESC;
GO

/*
===============================================================================
CASE STUDY 7: Running Fraud Amount
Business Problem: Monitor cumulative fraud losses over time.
===============================================================================
*/
SELECT
    T.DayNumber,
    SUM(F.Amount) AS DailyFraud,
    SUM(SUM(F.Amount)) OVER (ORDER BY T.DayNumber) AS RunningFraudAmount
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
WHERE DF.IsFraud = 1
GROUP BY T.DayNumber
ORDER BY T.DayNumber;
GO

/*
===============================================================================
CASE STUDY 8: Transaction Type Risk Ranking
Business Problem: Rank transaction types by fraud risk.
===============================================================================
*/
SELECT
    TT.TransactionType,
    COUNT(*) AS FraudTransactions,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS RiskRank
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
WHERE DF.IsFraud = 1
GROUP BY TT.TransactionType
ORDER BY RiskRank;
GO