/*
===============================================================================
Enterprise FinTech Payment Intelligence Platform
File: 03_User_Defined_Functions.sql

Purpose:
Create reusable User Defined Functions (Scalar & Table-Valued)
for financial analytics.

Author: Anto Abraham AJ
===============================================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

/*
===============================================================================
FUNCTION 1: Transaction Category (Scalar)
Business Objective: Categorize transactions based on monetary amount.
===============================================================================
*/
CREATE OR ALTER FUNCTION dbo.fn_TransactionCategory
(
    @Amount DECIMAL(18,2)
)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @Category VARCHAR(20);

    SET @Category =
    CASE
        WHEN @Amount < 1000 THEN 'Low'
        WHEN @Amount < 100000 THEN 'Medium'
        ELSE 'High'
    END;

    RETURN @Category;
END;
GO

-- Test Function 1
PRINT 'Testing dbo.fn_TransactionCategory';
SELECT TOP (20)
    TransactionID,
    Amount,
    dbo.fn_TransactionCategory(Amount) AS TransactionCategory
FROM dbo.Fact_PaymentTransactions;
GO

/*
===============================================================================
FUNCTION 2: Fraud Status (Scalar)
Business Objective: Translate binary fraud flags into readable text.
===============================================================================
*/
CREATE OR ALTER FUNCTION dbo.fn_FraudStatus
(
    @Fraud BIT
)
RETURNS VARCHAR(20)
AS
BEGIN
    RETURN
    (
        CASE
            WHEN @Fraud = 1 THEN 'Fraud'
            ELSE 'Legitimate'
        END
    );
END;
GO

-- Test Function 2
PRINT 'Testing dbo.fn_FraudStatus';
SELECT TOP (20)
    F.TransactionID,
    DF.IsFraud,
    dbo.fn_FraudStatus(DF.IsFraud) AS FraudStatus
FROM dbo.Fact_PaymentTransactions F
INNER JOIN dbo.Dim_Fraud DF
    ON F.FraudKey = DF.FraudKey;
GO

/*
===============================================================================
FUNCTION 3: Daily Transaction Summary (Inline Table-Valued)
Business Objective: Retrieve a daily summary using a parameter.
===============================================================================
*/
CREATE OR ALTER FUNCTION dbo.fn_DailySummary
(
    @DayNumber INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        T.DayNumber,
        COUNT(*) AS TotalTransactions,
        SUM(F.Amount) AS TotalTransactionValue,
        AVG(F.Amount) AS AverageTransactionValue
    FROM dbo.Fact_PaymentTransactions F
    INNER JOIN dbo.Dim_Time T
        ON F.TimeKey = T.TimeKey
    WHERE T.DayNumber = @DayNumber
    GROUP BY T.DayNumber
);
GO

-- Test Function 3
PRINT 'Testing dbo.fn_DailySummary for Day 5';
SELECT * FROM dbo.fn_DailySummary(5);
GO

/*
===============================================================================
FUNCTION 4: Fraud Transactions (Inline Table-Valued)
Business Objective: Retrieve a clean dataset of all fraudulent transactions.
===============================================================================
*/
CREATE OR ALTER FUNCTION dbo.fn_FraudTransactions()
RETURNS TABLE
AS
RETURN
(
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
    INNER JOIN dbo.Dim_Fraud DF
        ON F.FraudKey = DF.FraudKey
    WHERE DF.IsFraud = 1
);
GO

-- Test Function 4
PRINT 'Testing dbo.fn_FraudTransactions';
SELECT TOP (20) * FROM dbo.fn_FraudTransactions();
GO

/*
===============================================================================
FUNCTION 5: Source Account Transaction Count (Scalar)
Business Objective: Calculate the total transactions for a specific source account.
===============================================================================
*/
CREATE OR ALTER FUNCTION dbo.fn_SourceTransactionCount
(
    @SourceAccountKey INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Total INT;
    
    SELECT @Total = COUNT(*)
    FROM dbo.Fact_PaymentTransactions
    WHERE SourceAccountKey = @SourceAccountKey;
    
    RETURN @Total;
END;
GO

-- Test Function 5
PRINT 'Testing dbo.fn_SourceTransactionCount';
SELECT TOP (20)
    SourceAccountKey,
    SourceAccountID,
    dbo.fn_SourceTransactionCount(SourceAccountKey) AS TotalTransactions
FROM dbo.Dim_SourceAccount;
GO