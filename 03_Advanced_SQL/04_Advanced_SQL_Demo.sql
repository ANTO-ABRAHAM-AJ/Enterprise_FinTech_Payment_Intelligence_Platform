/*
===============================================================================
Enterprise FinTech Payment Intelligence Platform
File: 04_Advanced_SQL_Demo.sql

Purpose:
A masterclass demonstration of advanced SQL Server techniques including 
Window Functions, CTEs, conditional logic, set operators, CROSS APPLY, 
and performance comparisons using custom database objects.

Author: Anto Abraham AJ
===============================================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

PRINT '=========================================================';
PRINT 'EXECUTING ADVANCED SQL MASTERCLASS DEMO';
PRINT '=========================================================';
GO

/*
===============================================================================
DEMO 1: Window Functions (Ranking & Distribution)
Showcasing ROW_NUMBER, RANK, DENSE_RANK, and NTILE to rank Source Accounts.
===============================================================================
*/
PRINT '--- Demo 1: Ranking Window Functions ---';
SELECT TOP (20)
    SA.SourceAccountID,
    SUM(F.Amount) AS TotalTransactionValue,
    ROW_NUMBER() OVER (ORDER BY SUM(F.Amount) DESC) AS RowNum,
    RANK() OVER (ORDER BY SUM(F.Amount) DESC) AS Rnk,
    DENSE_RANK() OVER (ORDER BY SUM(F.Amount) DESC) AS DenseRnk,
    NTILE(4) OVER (ORDER BY SUM(F.Amount) DESC) AS QuartileBucket
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
GROUP BY SA.SourceAccountID;
GO

/*
===============================================================================
DEMO 2: Window Functions (Offset - LAG & LEAD)
Comparing day-over-day total transaction volume.
===============================================================================
*/
PRINT '--- Demo 2: LAG & LEAD ---';
WITH DailyVolume AS (
    SELECT 
        T.DayNumber,
        COUNT(*) AS DailyTransactions
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_Time T
        ON F.TimeKey = T.TimeKey
    GROUP BY T.DayNumber
)
SELECT 
    DayNumber,
    DailyTransactions,
    LAG(DailyTransactions, 1, 0) OVER (ORDER BY DayNumber) AS PreviousDayTransactions,
    LEAD(DailyTransactions, 1, 0) OVER (ORDER BY DayNumber) AS NextDayTransactions,
    DailyTransactions - LAG(DailyTransactions, 1, 0) OVER (ORDER BY DayNumber) AS DayOverDayChange
FROM DailyVolume;
GO

/*
===============================================================================
DEMO 3: Aggregate Window Functions (Running Total & Moving Average)
Tracking cumulative platform revenue and smoothing trends.
===============================================================================
*/
PRINT '--- Demo 3: Running Totals & Moving Averages ---';
SELECT 
    T.DayNumber,
    SUM(F.Amount) AS DailyValue,
    SUM(SUM(F.Amount)) OVER (
        ORDER BY T.DayNumber
    ) AS RunningTotalValue,
    AVG(SUM(F.Amount)) OVER (
        ORDER BY T.DayNumber 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS ThreeDayMovingAverage
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
GROUP BY T.DayNumber;
GO

/*
===============================================================================
DEMO 4: Common Table Expressions (Multiple CTEs)
Finding high-value accounts that also have a history of fraud.
===============================================================================
*/
PRINT '--- Demo 4: Multiple CTEs ---';
WITH HighValueAccounts AS (
    SELECT 
        SA.SourceAccountKey,
        SUM(F.Amount) AS TotalSent
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_SourceAccount SA 
        ON F.SourceAccountKey = SA.SourceAccountKey
    GROUP BY SA.SourceAccountKey
    HAVING SUM(F.Amount) > 5000000
),
FraudulentAccounts AS (
    SELECT DISTINCT 
        SA.SourceAccountKey
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_SourceAccount SA 
        ON F.SourceAccountKey = SA.SourceAccountKey
    INNER JOIN dbo.Dim_Fraud DF 
        ON F.FraudKey = DF.FraudKey
    WHERE DF.IsFraud = 1
)
SELECT TOP (10)
    SA.SourceAccountID,
    HVA.TotalSent
FROM HighValueAccounts HVA
INNER JOIN FraudulentAccounts FA 
    ON HVA.SourceAccountKey = FA.SourceAccountKey
INNER JOIN dbo.Dim_SourceAccount SA 
    ON HVA.SourceAccountKey = SA.SourceAccountKey
ORDER BY HVA.TotalSent DESC;
GO

/*
===============================================================================
DEMO 5: CASE Expressions (Risk Classification)
Segmenting transactions dynamically based on amount and type.
===============================================================================
*/
PRINT '--- Demo 5: CASE Expressions ---';
SELECT TOP (20)
    F.TransactionID,
    TT.TransactionType,
    F.Amount,
    CASE 
        WHEN F.Amount > 1000000 AND TT.TransactionType IN ('TRANSFER', 'CASH_OUT') THEN 'Critical Risk'
        WHEN F.Amount > 500000 THEN 'High Risk'
        WHEN TT.TransactionType = 'PAYMENT' THEN 'Low Risk - Standard'
        ELSE 'Review Required'
    END AS DynamicRiskClassification
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
ORDER BY F.Amount DESC;
GO

/*
===============================================================================
DEMO 6: EXISTS / NOT EXISTS
Finding Source Accounts that have made a TRANSFER but NEVER a CASH_OUT.
===============================================================================
*/
PRINT '--- Demo 6: EXISTS & NOT EXISTS ---';
SELECT TOP (10)
    SA.SourceAccountID
FROM dbo.Dim_SourceAccount SA
WHERE EXISTS (
    SELECT 1 FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_TransactionType TT ON F.TransactionTypeKey = TT.TransactionTypeKey
    WHERE F.SourceAccountKey = SA.SourceAccountKey AND TT.TransactionType = 'TRANSFER'
)
AND NOT EXISTS (
    SELECT 1 FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_TransactionType TT ON F.TransactionTypeKey = TT.TransactionTypeKey
    WHERE F.SourceAccountKey = SA.SourceAccountKey AND TT.TransactionType = 'CASH_OUT'
);
GO

/*
===============================================================================
DEMO 7: UNION / UNION ALL
Combining the Top 5 Source and Top 5 Destination accounts into one master list.
===============================================================================
*/
PRINT '--- Demo 7: UNION ALL ---';

WITH TopSourceAccounts AS (
    SELECT TOP (5)
        'Source Account' AS AccountRole,
        SA.SourceAccountID AS AccountID,
        SUM(F.Amount) AS TotalVolume
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_SourceAccount SA ON F.SourceAccountKey = SA.SourceAccountKey
    GROUP BY SA.SourceAccountID
    ORDER BY SUM(F.Amount) DESC
),
TopDestinationAccounts AS (
    SELECT TOP (5)
        'Destination Account' AS AccountRole,
        DA.DestinationAccountID AS AccountID,
        SUM(F.Amount) AS TotalVolume
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_DestinationAccount DA ON F.DestinationAccountKey = DA.DestinationAccountKey
    GROUP BY DA.DestinationAccountID
    ORDER BY SUM(F.Amount) DESC
)

SELECT * FROM TopSourceAccounts
UNION ALL
SELECT * FROM TopDestinationAccounts;
GO

/*
===============================================================================
DEMO 8: CROSS APPLY
Fetching the top 2 largest transactions for each of the top 5 source accounts.
===============================================================================
*/
PRINT '--- Demo 8: CROSS APPLY ---';
WITH TopAccounts AS (
    SELECT TOP (5) SourceAccountKey, SourceAccountID
    FROM dbo.Dim_SourceAccount
)
SELECT 
    TA.SourceAccountID,
    TopTxns.TransactionType,
    TopTxns.Amount
FROM TopAccounts TA
CROSS APPLY (
    SELECT TOP (2) 
        TT.TransactionType, 
        F.Amount
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_TransactionType TT ON F.TransactionTypeKey = TT.TransactionTypeKey
    WHERE F.SourceAccountKey = TA.SourceAccountKey
    ORDER BY F.Amount DESC
) AS TopTxns;
GO

/*
===============================================================================
DEMO 9: Performance Comparison (Views, UDFs, and Stored Procedures)
Utilizing the database objects created in Steps 1-3 of Phase 3.
===============================================================================
*/
PRINT '--- Demo 9: Querying Custom Database Objects ---';

-- 9A. Querying the Custom View
SELECT TOP (5) * FROM vw_FraudSummary
ORDER BY Amount DESC;

-- 9B. Using the Scalar UDF inside a SELECT statement
SELECT TOP (5)
    TransactionID,
    Amount,
    dbo.fn_TransactionCategory(Amount) AS RiskCategory
FROM dbo.Fact_PaymentTransactions;

-- 9C. Executing the Parameterized Stored Procedure
EXEC usp_GetHighValueTransactions @MinimumAmount = 5000000.00;
GO