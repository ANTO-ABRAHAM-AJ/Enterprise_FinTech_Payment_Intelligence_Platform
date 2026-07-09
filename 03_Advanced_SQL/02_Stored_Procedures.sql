/*
===============================================================================
Enterprise FinTech Payment Intelligence Platform
File: 02_Stored_Procedures.sql

Purpose:
Create reusable Stored Procedures for payment analytics.
Demonstrates parameterized SQL and enterprise reporting logic.

Author: Anto Abraham AJ
===============================================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

/*
===============================================================================
STORED PROCEDURE 1: Daily Transaction Summary
Business Purpose: Aggregate daily transaction volume and value.
===============================================================================
*/
CREATE OR ALTER PROCEDURE usp_GetDailyTransactionSummary
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        T.DayNumber,
        COUNT(*) AS TotalTransactions,
        SUM(F.Amount) AS TotalTransactionValue,
        AVG(F.Amount) AS AverageTransactionValue
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_Time T
        ON F.TimeKey = T.TimeKey
    GROUP BY T.DayNumber
    ORDER BY T.DayNumber;
END;
GO

-- Execute Procedure 1
PRINT 'Executing usp_GetDailyTransactionSummary';
EXEC usp_GetDailyTransactionSummary;
GO

/*
===============================================================================
STORED PROCEDURE 2: Transaction Type Summary
Business Purpose: Summarize activity by payment mechanism.
===============================================================================
*/
CREATE OR ALTER PROCEDURE usp_GetTransactionTypeSummary
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        TT.TransactionType,
        COUNT(*) AS TotalTransactions,
        SUM(F.Amount) AS TotalTransactionValue,
        AVG(F.Amount) AS AverageTransactionValue
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_TransactionType TT
        ON F.TransactionTypeKey = TT.TransactionTypeKey
    GROUP BY TT.TransactionType
    ORDER BY TotalTransactions DESC;
END;
GO

-- Execute Procedure 2
PRINT 'Executing usp_GetTransactionTypeSummary';
EXEC usp_GetTransactionTypeSummary;
GO

/*
===============================================================================
STORED PROCEDURE 3: Fraud Summary
Business Purpose: Aggregate fraud volume and value by transaction type.
===============================================================================
*/
CREATE OR ALTER PROCEDURE usp_GetFraudSummary
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        TT.TransactionType,
        COUNT(*) AS FraudTransactions,
        SUM(F.Amount) AS FraudAmount
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_Fraud DF
        ON F.FraudKey = DF.FraudKey
    INNER JOIN dbo.Dim_TransactionType TT
        ON F.TransactionTypeKey = TT.TransactionTypeKey
    WHERE DF.IsFraud = 1
    GROUP BY TT.TransactionType
    ORDER BY FraudTransactions DESC;
END;
GO

-- Execute Procedure 3
PRINT 'Executing usp_GetFraudSummary';
EXEC usp_GetFraudSummary;
GO

/*
===============================================================================
STORED PROCEDURE 4: High Value Transactions (Parameterized)
Business Purpose: Retrieve detailed transactions exceeding a dynamic threshold.
===============================================================================
*/
CREATE OR ALTER PROCEDURE usp_GetHighValueTransactions
    @MinimumAmount DECIMAL(18,2)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        F.TransactionID,
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
    WHERE F.Amount >= @MinimumAmount
    ORDER BY F.Amount DESC;
END;
GO

-- Execute Procedure 4
PRINT 'Executing usp_GetHighValueTransactions for > 1,000,000';
EXEC usp_GetHighValueTransactions @MinimumAmount = 1000000.00;
GO

/*
===============================================================================
STORED PROCEDURE 5: Fraud by Day (Parameterized)
Business Purpose: Analyze fraud concentration for a specific simulation day.
===============================================================================
*/
CREATE OR ALTER PROCEDURE usp_GetFraudByDay
    @DayNumber INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        T.DayNumber,
        TT.TransactionType,
        COUNT(*) AS FraudTransactions,
        SUM(F.Amount) AS FraudAmount
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_Time T
        ON F.TimeKey = T.TimeKey
    INNER JOIN dbo.Dim_TransactionType TT
        ON F.TransactionTypeKey = TT.TransactionTypeKey
    INNER JOIN dbo.Dim_Fraud DF
        ON F.FraudKey = DF.FraudKey
    WHERE DF.IsFraud = 1
      AND T.DayNumber = @DayNumber
    GROUP BY
        T.DayNumber,
        TT.TransactionType
    ORDER BY FraudTransactions DESC;
END;
GO

-- Execute Procedure 5
PRINT 'Executing usp_GetFraudByDay for Day 5';
EXEC usp_GetFraudByDay @DayNumber = 5;
GO