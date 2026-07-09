/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
File: 03_Fraud_Analytics.sql
Objective: Analyze fraud patterns, identify risky transaction 
types, monitor fraud concentration, and evaluate fraud 
detection effectiveness.
==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

/*
==============================================================
KPI 1: Overall Fraud Rate
Business Objective: Calculate the overall fraud rate across all transactions.
==============================================================
*/
SELECT
    COUNT(*) AS TotalTransactions,
    SUM(CASE WHEN DF.IsFraud = 1 THEN 1 ELSE 0 END) AS FraudTransactions,
    CAST(
        100.0 * SUM(CASE WHEN DF.IsFraud = 1 THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(10,4)
    ) AS FraudRatePercent
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey;
GO

/*
==============================================================
KPI 2: Fraud by Transaction Type
Business Objective: Measure fraud concentration across payment mechanisms.
==============================================================
*/
SELECT
    TT.TransactionType,
    COUNT(*) AS TotalTransactions,
    SUM(CASE WHEN DF.IsFraud = 1 THEN 1 ELSE 0 END) AS FraudTransactions,
    CAST(
        100.0 * SUM(CASE WHEN DF.IsFraud = 1 THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(10,2)
    ) AS FraudRate
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
GROUP BY TT.TransactionType
ORDER BY FraudRate DESC;
GO

/*
==============================================================
KPI 3: Fraud by Period of Day
Business Objective: Identify when fraudulent activity occurs most frequently.
==============================================================
*/
SELECT
    T.PeriodOfDay,
    COUNT(*) AS TotalTransactions,
    SUM(CASE WHEN DF.IsFraud = 1 THEN 1 ELSE 0 END) AS FraudTransactions
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
GROUP BY T.PeriodOfDay
ORDER BY FraudTransactions DESC;
GO

/*
==============================================================
KPI 4: Fraud Amount Analysis
Business Objective: Measure the financial impact of fraudulent transactions.
==============================================================
*/
SELECT
    COUNT(*) AS FraudTransactions,
    SUM(F.Amount) AS TotalFraudAmount,
    AVG(F.Amount) AS AverageFraudAmount,
    MAX(F.Amount) AS LargestFraudAmount
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
WHERE DF.IsFraud = 1;
GO

/*
==============================================================
KPI 5: Flagged vs Actual Fraud
Business Objective: Compare system-generated fraud flags with actual fraud.
==============================================================
*/
SELECT
    DF.IsFraud,
    DF.IsFlaggedFraud,
    COUNT(*) AS TotalTransactions
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
GROUP BY DF.IsFraud, DF.IsFlaggedFraud
ORDER BY DF.IsFraud DESC, DF.IsFlaggedFraud DESC;
GO

/*
==============================================================
KPI 6: Top Fraudulent Source Accounts
Business Objective: Identify source accounts involved in the highest number of fraud cases.
==============================================================
*/
SELECT TOP (10)
    SA.SourceAccountID,
    COUNT(*) AS FraudTransactions,
    SUM(F.Amount) AS FraudAmount
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
WHERE DF.IsFraud = 1
GROUP BY SA.SourceAccountID
ORDER BY FraudTransactions DESC;
GO

/*
==============================================================
KPI 7: Largest Fraudulent Transactions
Business Objective: Identify the highest-value fraudulent transactions.
==============================================================
*/
SELECT TOP (20)
    SA.SourceAccountID,
    DA.DestinationAccountID,
    TT.TransactionType,
    F.Amount
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
INNER JOIN dbo.Dim_DestinationAccount DA
    ON F.DestinationAccountKey = DA.DestinationAccountKey
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
WHERE DF.IsFraud = 1
ORDER BY F.Amount DESC;
GO

/*
==============================================================
KPI 8: Fraud Trend by Simulation Day
Business Objective: Track fraudulent activity across simulation days.
==============================================================
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
ORDER BY T.DayNumber;
GO

/*
==============================================================
KPI 9: Fraud Contribution by Transaction Type
Business Objective: Measure each transaction type's contribution to total fraud.
==============================================================
*/
SELECT
    TT.TransactionType,
    COUNT(*) AS FraudTransactions,
    CAST(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER ()
        AS DECIMAL(10,2)
    ) AS FraudContributionPercent
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
WHERE DF.IsFraud = 1
GROUP BY TT.TransactionType
ORDER BY FraudContributionPercent DESC;
GO