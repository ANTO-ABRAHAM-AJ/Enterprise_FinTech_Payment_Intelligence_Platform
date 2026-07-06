/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
File: 04_Star_Schema.sql
==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

-- 1. Drop Fact table first due to FK constraints
DROP TABLE IF EXISTS dbo.Fact_PaymentTransactions;
DROP TABLE IF EXISTS dbo.Dim_Time;
DROP TABLE IF EXISTS dbo.Dim_TransactionType;
DROP TABLE IF EXISTS dbo.Dim_Fraud;
GO

-- 2. Create and Load Dim_Time
CREATE TABLE dbo.Dim_Time
(
    TimeKey INT IDENTITY(1,1) PRIMARY KEY,
    Step INT NOT NULL
);
GO
INSERT INTO dbo.Dim_Time (Step)
SELECT DISTINCT step FROM dbo.stg_payment_transactions WHERE step IS NOT NULL ORDER BY step;
GO

-- 3. Create and Load Dim_TransactionType
CREATE TABLE dbo.Dim_TransactionType
(
    TransactionTypeKey INT IDENTITY(1,1) PRIMARY KEY,
    TransactionType VARCHAR(20) NOT NULL
);
GO
INSERT INTO dbo.Dim_TransactionType (TransactionType)
SELECT DISTINCT type FROM dbo.stg_payment_transactions WHERE type IS NOT NULL;
GO

-- 4. Create and Load Dim_Fraud
CREATE TABLE dbo.Dim_Fraud
(
    FraudKey INT IDENTITY(1,1) PRIMARY KEY,
    IsFraud BIT NOT NULL,
    IsFlaggedFraud BIT NOT NULL
);
GO
INSERT INTO dbo.Dim_Fraud (IsFraud, IsFlaggedFraud)
SELECT DISTINCT IsFraud, IsFlaggedFraud FROM dbo.stg_payment_transactions;
GO

-- 5. Create Fact Table
CREATE TABLE dbo.Fact_PaymentTransactions
(
    TransactionID BIGINT IDENTITY(1,1) PRIMARY KEY,
    TimeKey INT NOT NULL,
    TransactionTypeKey INT NOT NULL,
    FraudKey INT NOT NULL,
    SourceAccount VARCHAR(50) NOT NULL,
    DestinationAccount VARCHAR(50) NOT NULL,
    Amount DECIMAL(18,2),
    OldBalanceOrig DECIMAL(18,2),
    NewBalanceOrig DECIMAL(18,2),
    OldBalanceDest DECIMAL(18,2),
    NewBalanceDest DECIMAL(18,2)
);
GO

-- 6. Populate Fact Table
INSERT INTO dbo.Fact_PaymentTransactions
(
    TimeKey, TransactionTypeKey, FraudKey, SourceAccount, DestinationAccount,
    Amount, OldBalanceOrig, NewBalanceOrig, OldBalanceDest, NewBalanceDest
)
SELECT
    DT.TimeKey, DTT.TransactionTypeKey, DF.FraudKey,
    S.nameOrig, S.nameDest, S.amount, S.oldbalanceOrg, 
    S.newbalanceOrig, S.oldbalanceDest, S.newbalanceDest
FROM dbo.stg_payment_transactions AS S
INNER JOIN dbo.Dim_Time AS DT ON S.step = DT.Step
INNER JOIN dbo.Dim_TransactionType AS DTT ON S.type = DTT.TransactionType
INNER JOIN dbo.Dim_Fraud AS DF ON S.isFraud = DF.IsFraud AND S.isFlaggedFraud = DF.IsFlaggedFraud;
GO

-- 7. Add Foreign Keys
ALTER TABLE dbo.Fact_PaymentTransactions 
ADD CONSTRAINT FK_Fact_Time FOREIGN KEY (TimeKey) REFERENCES dbo.Dim_Time(TimeKey);

ALTER TABLE dbo.Fact_PaymentTransactions 
ADD CONSTRAINT FK_Fact_TransactionType FOREIGN KEY (TransactionTypeKey) REFERENCES dbo.Dim_TransactionType(TransactionTypeKey);

ALTER TABLE dbo.Fact_PaymentTransactions 
ADD CONSTRAINT FK_Fact_Fraud FOREIGN KEY (FraudKey) REFERENCES dbo.Dim_Fraud(FraudKey);
GO