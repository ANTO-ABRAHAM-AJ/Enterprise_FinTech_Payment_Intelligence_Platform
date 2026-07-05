/*
==============================================================
Enterprise FinTech Payment Intelligence Platform
Star Schema Design
==============================================================

Author : Anto Abraham AJ
Database : Enterprise_FinTech_Payment_Intelligence

Purpose:
Create the first Dimension Table for the Star Schema.

Dimension:
Dim_TransactionType

==============================================================
*/

USE Enterprise_FinTech_Payment_Intelligence;
GO

--------------------------------------------------------------
-- Drop Existing Table
--------------------------------------------------------------

DROP TABLE IF EXISTS dbo.Dim_TransactionType;
GO

--------------------------------------------------------------
-- Create Dimension Table
--------------------------------------------------------------

CREATE TABLE dbo.Dim_TransactionType
(
    TransactionTypeKey INT IDENTITY(1,1) PRIMARY KEY,

    TransactionType VARCHAR(20) NOT NULL
);
GO

--------------------------------------------------------------
-- Load Dimension Table
--------------------------------------------------------------

INSERT INTO dbo.Dim_TransactionType
(
    TransactionType
)
SELECT DISTINCT
    type
FROM dbo.stg_payment_transactions;
GO

--------------------------------------------------------------
-- Validate Data
--------------------------------------------------------------

SELECT *
FROM dbo.Dim_TransactionType;
GO

--------------------------------------------------------------
-- Validate Row Count
--------------------------------------------------------------

SELECT COUNT(*) AS TotalTransactionTypes
FROM dbo.Dim_TransactionType;
GO

/*============================================================
Step 2 : Create Fraud Dimension
============================================================*/

--------------------------------------------------------------
-- Drop Existing Table
--------------------------------------------------------------

DROP TABLE IF EXISTS dbo.Dim_Fraud;
GO

--------------------------------------------------------------
-- Create Fraud Dimension
--------------------------------------------------------------

CREATE TABLE dbo.Dim_Fraud
(
    FraudKey INT IDENTITY(1,1) PRIMARY KEY,

    IsFraud BIT NOT NULL,

    IsFlaggedFraud BIT NOT NULL
);
GO

--------------------------------------------------------------
-- Populate Fraud Dimension
--------------------------------------------------------------

INSERT INTO dbo.Dim_Fraud
(
    IsFraud,
    IsFlaggedFraud
)
SELECT DISTINCT
    IsFraud,
    IsFlaggedFraud
FROM dbo.stg_payment_transactions;
GO

--------------------------------------------------------------
-- Validate Fraud Dimension
--------------------------------------------------------------

SELECT *
FROM dbo.Dim_Fraud;
GO

--------------------------------------------------------------
-- Validate Row Count
--------------------------------------------------------------

SELECT COUNT(*) AS TotalFraudCombinations
FROM dbo.Dim_Fraud;
GO

/*============================================================
Step 3 : Create Fact Table
============================================================*/

--------------------------------------------------------------
-- Drop Existing Fact Table
--------------------------------------------------------------

DROP TABLE IF EXISTS dbo.Fact_PaymentTransactions;
GO

--------------------------------------------------------------
-- Create Fact Table
--------------------------------------------------------------

CREATE TABLE dbo.Fact_PaymentTransactions
(
    TransactionID BIGINT IDENTITY(1,1) PRIMARY KEY,

    TransactionTypeKey INT NOT NULL,

    FraudKey INT NOT NULL,

    Step INT,

    Amount DECIMAL(18,2),

    OldBalanceOrig DECIMAL(18,2),

    NewBalanceOrig DECIMAL(18,2),

    OldBalanceDest DECIMAL(18,2),

    NewBalanceDest DECIMAL(18,2)
);
GO


/*============================================================
Step 4 : Populate Fact Table
============================================================*/

INSERT INTO dbo.Fact_PaymentTransactions
(
    TransactionTypeKey,
    FraudKey,
    Step,
    Amount,
    OldBalanceOrig,
    NewBalanceOrig,
    OldBalanceDest,
    NewBalanceDest
)

SELECT

    DT.TransactionTypeKey,

    DF.FraudKey,

    S.step,

    S.amount,

    S.oldbalanceOrg,

    S.newbalanceOrig,

    S.oldbalanceDest,

    S.newbalanceDest

FROM dbo.stg_payment_transactions AS S

INNER JOIN dbo.Dim_TransactionType AS DT
ON S.type = DT.TransactionType

INNER JOIN dbo.Dim_Fraud AS DF
ON S.isFraud = DF.IsFraud
AND S.isFlaggedFraud = DF.IsFlaggedFraud;
GO


/*============================================================
Step 5 : Validation
============================================================*/

SELECT TOP 10 *
FROM dbo.Fact_PaymentTransactions;
GO

SELECT COUNT(*) AS TotalFactRows
FROM dbo.Fact_PaymentTransactions;
GO

/*============================================================
Step 6 : Add Foreign Key Relationships
============================================================*/

--------------------------------------------------------------
-- Transaction Type Foreign Key
--------------------------------------------------------------

ALTER TABLE dbo.Fact_PaymentTransactions
ADD CONSTRAINT FK_Fact_TransactionType
FOREIGN KEY (TransactionTypeKey)
REFERENCES dbo.Dim_TransactionType(TransactionTypeKey);
GO

--------------------------------------------------------------
-- Fraud Foreign Key
--------------------------------------------------------------

ALTER TABLE dbo.Fact_PaymentTransactions
ADD CONSTRAINT FK_Fact_Fraud
FOREIGN KEY (FraudKey)
REFERENCES dbo.Dim_Fraud(FraudKey);
GO

/*============================================================
Step 7 : Verify Foreign Keys
============================================================*/

SELECT
    FK.name AS ForeignKeyName,
    OBJECT_NAME(FK.parent_object_id) AS FactTable,
    OBJECT_NAME(FK.referenced_object_id) AS DimensionTable
FROM sys.foreign_keys FK;
GO