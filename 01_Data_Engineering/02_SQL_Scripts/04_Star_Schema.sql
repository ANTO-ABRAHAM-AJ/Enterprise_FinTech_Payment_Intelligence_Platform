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