/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
File: 01_Payment_Analytics.sql
==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

/*
==============================================================
KPI 1: Total Transactions
Business Objective: Determine the total number of processed payment transactions.
Business Interpretation: Measures platform activity. Baseline KPI for every payment company.
==============================================================
*/
SELECT
    COUNT(*) AS TotalTransactions
FROM dbo.Fact_PaymentTransactions;
GO

/*
==============================================================
KPI 2: Total Transaction Value
Business Objective: Calculate the total monetary value processed by the platform.
Business Interpretation: Measures total payment volume. Equivalent to processed payment value.
==============================================================
*/
SELECT
    SUM(Amount) AS TotalTransactionValue
FROM dbo.Fact_PaymentTransactions;
GO

/*
==============================================================
KPI 3: Average Transaction Value (ATV)
Business Objective: Measure the average value of processed transactions.
==============================================================
*/
SELECT
    AVG(Amount) AS AverageTransactionValue
FROM dbo.Fact_PaymentTransactions;
GO

/*
==============================================================
KPI 4: Transaction Type Distribution
Business Objective: Analyze transaction volume by payment mechanism.
==============================================================
*/
SELECT
    TT.TransactionType,
    COUNT(*) AS TotalTransactions,
    SUM(F.Amount) AS TotalValue,
    AVG(F.Amount) AS AverageValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_TransactionType TT 
    ON F.TransactionTypeKey = TT.TransactionTypeKey
GROUP BY TT.TransactionType
ORDER BY TotalTransactions DESC;
GO

/*
==============================================================
KPI 5: Daily Transaction Trends
Business Objective: Measure transaction activity across simulation days.
==============================================================
*/
SELECT
    T.DayNumber,
    COUNT(*) AS TotalTransactions,
    SUM(F.Amount) AS TotalValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T 
    ON F.TimeKey = T.TimeKey
GROUP BY T.DayNumber
ORDER BY T.DayNumber;
GO

/*
==============================================================
KPI 6: Hourly Transaction Trends
Business Objective: Analyze transaction activity by hour of simulation.
==============================================================
*/
SELECT
    T.HourOfSimulation,
    COUNT(*) AS TotalTransactions,
    SUM(F.Amount) AS TotalValue
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T 
    ON F.TimeKey = T.TimeKey
GROUP BY T.HourOfSimulation
ORDER BY T.HourOfSimulation;
GO

/*
==============================================================
KPI 7: Peak Transaction Hours
Business Objective: Identify the busiest hours based on transaction volume.
==============================================================
*/
SELECT TOP (5)
    T.HourOfSimulation,
    COUNT(*) AS TotalTransactions
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Time T 
    ON F.TimeKey = T.TimeKey
GROUP BY T.HourOfSimulation
ORDER BY TotalTransactions DESC;
GO

/*
==============================================================
KPI 8: Large Transaction Distribution
Business Objective: Analyze high-value transactions exceeding 1,000,000.
==============================================================
*/
SELECT
    COUNT(*) AS HighValueTransactions,
    SUM(Amount) AS TotalHighValueAmount,
    AVG(Amount) AS AverageHighValueAmount
FROM dbo.Fact_PaymentTransactions
WHERE Amount > 1000000;
GO