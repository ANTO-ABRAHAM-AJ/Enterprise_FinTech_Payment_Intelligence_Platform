/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
File: 04_Star_Schema.sql (FINAL - Fully Normalized & Governed)

Purpose:
Builds the Kimball-standard Star Schema with strict data 
integrity constraints (UNIQUE, NOT NULL), mathematically 
adjusted time dimensions (1-24 scale), and explicit Account IDs.
==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

PRINT '--- 1. Dropping Existing Tables ---';
DROP TABLE IF EXISTS dbo.Fact_PaymentTransactions;
DROP TABLE IF EXISTS dbo.Dim_Time;
DROP TABLE IF EXISTS dbo.Dim_TransactionType;
DROP TABLE IF EXISTS dbo.Dim_Fraud;
DROP TABLE IF EXISTS dbo.Dim_SourceAccount;
DROP TABLE IF EXISTS dbo.Dim_DestinationAccount;
GO

PRINT '--- 2. Creating & Loading Dim_Time ---';
CREATE TABLE dbo.Dim_Time
(
    TimeKey INT IDENTITY(1,1) PRIMARY KEY,
    Step INT NOT NULL UNIQUE,
    HourOfSimulation INT NOT NULL,
    DayNumber INT NOT NULL,
    PeriodOfDay VARCHAR(20) NOT NULL
);
GO

INSERT INTO dbo.Dim_Time (Step, HourOfSimulation, DayNumber, PeriodOfDay)
SELECT DISTINCT 
    step,
    (((step - 1) % 24) + 1) AS HourOfSimulation,
    (((step - 1) / 24) + 1) AS DayNumber,
    CASE 
        WHEN (((step - 1) % 24) + 1) BETWEEN 1 AND 6 THEN 'Night'
        WHEN (((step - 1) % 24) + 1) BETWEEN 7 AND 12 THEN 'Morning'
        WHEN (((step - 1) % 24) + 1) BETWEEN 13 AND 18 THEN 'Afternoon'
        ELSE 'Evening' 
    END AS PeriodOfDay
FROM dbo.stg_payment_transactions 
WHERE step IS NOT NULL
ORDER BY step;
GO

PRINT '--- 3. Creating & Loading Dim_TransactionType ---';
CREATE TABLE dbo.Dim_TransactionType
(
    TransactionTypeKey INT IDENTITY(1,1) PRIMARY KEY,
    TransactionType VARCHAR(20) NOT NULL UNIQUE
);
GO

INSERT INTO dbo.Dim_TransactionType (TransactionType)
SELECT DISTINCT type 
FROM dbo.stg_payment_transactions 
WHERE type IS NOT NULL;
GO

PRINT '--- 4. Creating & Loading Dim_Fraud ---';
CREATE TABLE dbo.Dim_Fraud
(
    FraudKey INT IDENTITY(1,1) PRIMARY KEY,
    IsFraud BIT NOT NULL,
    IsFlaggedFraud BIT NOT NULL,
    CONSTRAINT UQ_FraudCombo UNIQUE (IsFraud, IsFlaggedFraud)
);
GO

INSERT INTO dbo.Dim_Fraud (IsFraud, IsFlaggedFraud)
SELECT DISTINCT isFraud, isFlaggedFraud 
FROM dbo.stg_payment_transactions;
GO

PRINT '--- 5. Creating & Loading Dim_SourceAccount ---';
CREATE TABLE dbo.Dim_SourceAccount
(
    SourceAccountKey INT IDENTITY(1,1) PRIMARY KEY,
    SourceAccountID VARCHAR(50) NOT NULL UNIQUE
);
GO

INSERT INTO dbo.Dim_SourceAccount (SourceAccountID)
SELECT DISTINCT nameOrig 
FROM dbo.stg_payment_transactions 
WHERE nameOrig IS NOT NULL;
GO

PRINT '--- 6. Creating & Loading Dim_DestinationAccount ---';
CREATE TABLE dbo.Dim_DestinationAccount
(
    DestinationAccountKey INT IDENTITY(1,1) PRIMARY KEY,
    DestinationAccountID VARCHAR(50) NOT NULL UNIQUE
);
GO

INSERT INTO dbo.Dim_DestinationAccount (DestinationAccountID)
SELECT DISTINCT nameDest 
FROM dbo.stg_payment_transactions 
WHERE nameDest IS NOT NULL;
GO

PRINT '--- 7. Creating Fact_PaymentTransactions ---';
CREATE TABLE dbo.Fact_PaymentTransactions
(
    TransactionID BIGINT IDENTITY(1,1) PRIMARY KEY,
    TimeKey INT NOT NULL,
    TransactionTypeKey INT NOT NULL,
    FraudKey INT NOT NULL,
    SourceAccountKey INT NOT NULL,
    DestinationAccountKey INT NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    OldBalanceOrig DECIMAL(18,2) NOT NULL,
    NewBalanceOrig DECIMAL(18,2) NOT NULL,
    OldBalanceDest DECIMAL(18,2) NOT NULL,
    NewBalanceDest DECIMAL(18,2) NOT NULL
);
GO

PRINT '--- 8. Populating Fact_PaymentTransactions (This will take a moment) ---';
INSERT INTO dbo.Fact_PaymentTransactions
(
    TimeKey, TransactionTypeKey, FraudKey, SourceAccountKey, DestinationAccountKey,
    Amount, OldBalanceOrig, NewBalanceOrig, OldBalanceDest, NewBalanceDest
)
SELECT
    DT.TimeKey, 
    DTT.TransactionTypeKey, 
    DF.FraudKey,
    DSA.SourceAccountKey,
    DDA.DestinationAccountKey,
    S.amount, S.oldbalanceOrg, S.newbalanceOrig, S.oldbalanceDest, S.newbalanceDest
FROM dbo.stg_payment_transactions AS S
INNER JOIN dbo.Dim_Time AS DT ON S.step = DT.Step
INNER JOIN dbo.Dim_TransactionType AS DTT ON S.type = DTT.TransactionType
INNER JOIN dbo.Dim_Fraud AS DF ON S.isFraud = DF.IsFraud AND S.isFlaggedFraud = DF.IsFlaggedFraud
INNER JOIN dbo.Dim_SourceAccount AS DSA ON S.nameOrig = DSA.SourceAccountID
INNER JOIN dbo.Dim_DestinationAccount AS DDA ON S.nameDest = DDA.DestinationAccountID;
GO

PRINT '--- 9. Applying Foreign Keys ---';
ALTER TABLE dbo.Fact_PaymentTransactions ADD CONSTRAINT FK_Fact_Time FOREIGN KEY (TimeKey) REFERENCES dbo.Dim_Time(TimeKey);
ALTER TABLE dbo.Fact_PaymentTransactions ADD CONSTRAINT FK_Fact_TransactionType FOREIGN KEY (TransactionTypeKey) REFERENCES dbo.Dim_TransactionType(TransactionTypeKey);
ALTER TABLE dbo.Fact_PaymentTransactions ADD CONSTRAINT FK_Fact_Fraud FOREIGN KEY (FraudKey) REFERENCES dbo.Dim_Fraud(FraudKey);
ALTER TABLE dbo.Fact_PaymentTransactions ADD CONSTRAINT FK_Fact_SourceAccount FOREIGN KEY (SourceAccountKey) REFERENCES dbo.Dim_SourceAccount(SourceAccountKey);
ALTER TABLE dbo.Fact_PaymentTransactions ADD CONSTRAINT FK_Fact_DestinationAccount FOREIGN KEY (DestinationAccountKey) REFERENCES dbo.Dim_DestinationAccount(DestinationAccountKey);
GO

PRINT '--- 10. Validating Data (QA Check) ---';
SELECT COUNT(*) AS FactRows FROM dbo.Fact_PaymentTransactions;
SELECT COUNT(*) AS TimeDimension FROM dbo.Dim_Time;
SELECT COUNT(*) AS TransactionTypes FROM dbo.Dim_TransactionType;
SELECT COUNT(*) AS FraudDimension FROM dbo.Dim_Fraud;
SELECT COUNT(*) AS SourceAccounts FROM dbo.Dim_SourceAccount;
SELECT COUNT(*) AS DestinationAccounts FROM dbo.Dim_DestinationAccount;

PRINT '==============================================';
PRINT 'STAR SCHEMA CREATED SUCCESSFULLY';
PRINT 'Fact table loaded successfully.';
PRINT 'All dimensions validated.';
PRINT 'Ready for Phase 2 Analytics.';
PRINT '==============================================';
GO