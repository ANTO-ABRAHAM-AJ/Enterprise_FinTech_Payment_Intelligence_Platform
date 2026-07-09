/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
File: 02_Account_Analytics.sql
Objective: Analyze account behavior, transaction activity, 
and high-value accounts to understand user payment patterns.
==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

/*
==============================================================
KPI 1: Top Source Accounts
Business Objective: Identify the most active source accounts by transaction count.
==============================================================
*/
SELECT TOP (10)
    SA.SourceAccountID,
    COUNT(*) AS TotalTransactions
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
GROUP BY SA.SourceAccountID
ORDER BY TotalTransactions DESC;
GO

/*
==============================================================
KPI 2: Top Destination Accounts
Business Objective: Identify the most active destination accounts.
==============================================================
*/
SELECT TOP (10)
    DA.DestinationAccountID,
    COUNT(*) AS TotalTransactions
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_DestinationAccount DA
    ON F.DestinationAccountKey = DA.DestinationAccountKey
GROUP BY DA.DestinationAccountID
ORDER BY TotalTransactions DESC;
GO

/*
==============================================================
KPI 3: High-Value Source Accounts
Business Objective: Find accounts responsible for the highest transaction value.
==============================================================
*/
SELECT TOP (10)
    SA.SourceAccountID,
    SUM(F.Amount) AS TotalTransactionValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
GROUP BY SA.SourceAccountID
ORDER BY TotalTransactionValue DESC;
GO

/*
==============================================================
KPI 4: High-Value Destination Accounts
Business Objective: Find accounts receiving the highest transaction value.
==============================================================
*/
SELECT TOP (10)
    DA.DestinationAccountID,
    SUM(F.Amount) AS TotalTransactionValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_DestinationAccount DA
    ON F.DestinationAccountKey = DA.DestinationAccountKey
GROUP BY DA.DestinationAccountID
ORDER BY TotalTransactionValue DESC;
GO

/*
==============================================================
KPI 5: Transaction Frequency Analysis
Business Objective: Analyze transaction frequency for each source account.
==============================================================
*/
SELECT
    SA.SourceAccountID,
    COUNT(*) AS TransactionFrequency
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
GROUP BY SA.SourceAccountID
ORDER BY TransactionFrequency DESC;
GO

/*
==============================================================
KPI 6: Average Transaction Value by Source Account
Business Objective: Measure average transaction value for each source account.
==============================================================
*/
SELECT TOP (10)
    SA.SourceAccountID,
    AVG(F.Amount) AS AverageTransactionValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
GROUP BY SA.SourceAccountID
ORDER BY AverageTransactionValue DESC;
GO

/*
==============================================================
KPI 7: Source Account Ranking
Business Objective: Rank source accounts based on total transaction value.
==============================================================
*/
SELECT TOP (20)
    SA.SourceAccountID,
    SUM(F.Amount) AS TotalTransactionValue,
    RANK() OVER (ORDER BY SUM(F.Amount) DESC) AS AccountRank
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
GROUP BY SA.SourceAccountID
ORDER BY AccountRank;
GO

/*
==============================================================
KPI 8: Multi-Channel Source Accounts
Business Objective: Find source accounts using multiple transaction types.
==============================================================
*/
SELECT TOP (20)
    SA.SourceAccountID,
    COUNT(DISTINCT TT.TransactionType) AS TransactionTypesUsed
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
GROUP BY SA.SourceAccountID
ORDER BY TransactionTypesUsed DESC;
GO