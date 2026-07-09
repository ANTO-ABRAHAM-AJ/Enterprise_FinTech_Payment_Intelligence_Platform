/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
File: 04_Money_Flow_Analytics.sql
Objective: Analyze how money moves through the payment system 
by tracking transaction values, balance changes, sender/receiver 
relationships, and cumulative payment trends.
==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

/*
==============================================================
KPI 1: Largest Transactions
Business Objective: Identify the highest-value transactions processed.
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
ORDER BY F.Amount DESC;
GO

/*
==============================================================
KPI 2: Average Balance Movement
Business Objective: Measure the average balance change for source accounts.
==============================================================
*/
SELECT
    AVG(OldBalanceOrig - NewBalanceOrig) AS AverageBalanceReduction
FROM dbo.Fact_PaymentTransactions;
GO

/*
==============================================================
KPI 3: Total Money Sent by Source Account
Business Objective: Identify accounts transferring the highest monetary value.
==============================================================
*/
SELECT TOP (10)
    SA.SourceAccountID,
    SUM(F.Amount) AS TotalAmountSent
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
GROUP BY SA.SourceAccountID
ORDER BY TotalAmountSent DESC;
GO

/*
==============================================================
KPI 4: Total Money Received by Destination Account
Business Objective: Identify accounts receiving the highest monetary value.
==============================================================
*/
SELECT TOP (10)
    DA.DestinationAccountID,
    SUM(F.Amount) AS TotalAmountReceived
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_DestinationAccount DA
    ON F.DestinationAccountKey = DA.DestinationAccountKey
GROUP BY DA.DestinationAccountID
ORDER BY TotalAmountReceived DESC;
GO

/*
==============================================================
KPI 5: Running Transaction Value
Business Objective: Calculate cumulative transaction value over simulation time.
==============================================================
*/
SELECT
    T.DayNumber,
    SUM(F.Amount) AS DailyTransactionValue,
    SUM(SUM(F.Amount)) OVER (
        ORDER BY T.DayNumber
    ) AS RunningTransactionValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
GROUP BY T.DayNumber
ORDER BY T.DayNumber;
GO

/*
==============================================================
KPI 6: Daily Average Transaction Value
Business Objective: Measure average transaction value for each simulation day.
==============================================================
*/
SELECT
    T.DayNumber,
    AVG(F.Amount) AS AverageTransactionValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
GROUP BY T.DayNumber
ORDER BY T.DayNumber;
GO

/*
==============================================================
KPI 7: Transaction Value by Period of Day
Business Objective: Compare transaction value across different periods of the day.
==============================================================
*/
SELECT
    T.PeriodOfDay,
    COUNT(*) AS TotalTransactions,
    SUM(F.Amount) AS TotalTransactionValue,
    AVG(F.Amount) AS AverageTransactionValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
GROUP BY T.PeriodOfDay
ORDER BY TotalTransactionValue DESC;
GO

/*
==============================================================
KPI 8: Largest Balance Reductions
Business Objective: Identify transactions causing the largest reduction in source account balance.
==============================================================
*/
SELECT TOP (10)
    SA.SourceAccountID,
    TT.TransactionType,
    F.OldBalanceOrig,
    F.NewBalanceOrig,
    (F.OldBalanceOrig - F.NewBalanceOrig) AS BalanceReduction
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_SourceAccount SA
    ON F.SourceAccountKey = SA.SourceAccountKey
INNER JOIN dbo.Dim_TransactionType TT
    ON F.TransactionTypeKey = TT.TransactionTypeKey
ORDER BY BalanceReduction DESC;
GO

/*
==============================================================
KPI 9: 3-Day Moving Average Transaction Value
Business Objective: Smooth transaction trends using a moving average.
==============================================================
*/
SELECT
    T.DayNumber,
    SUM(F.Amount) AS DailyValue,
    AVG(SUM(F.Amount)) OVER (
        ORDER BY T.DayNumber
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAverage
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T
    ON F.TimeKey = T.TimeKey
GROUP BY T.DayNumber
ORDER BY T.DayNumber;
GO