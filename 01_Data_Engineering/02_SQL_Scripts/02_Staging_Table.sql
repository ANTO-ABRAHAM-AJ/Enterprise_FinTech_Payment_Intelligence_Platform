/*
===============================================================================
Enterprise FinTech Payment Intelligence Platform
File: 02_Staging_Table.sql

Purpose:
Create the staging table and load data from the raw transaction table.
The staging table is used for all cleaning and transformation operations.

Author  : Anto Abraham AJ
Database: Enterprise_FinTech_Payment_Intelligence
===============================================================================
*/

-- ============================================================================
-- Step 1 : Select Database
-- ============================================================================

USE Enterprise_FinTech_Payment_Intelligence;
GO

-- ============================================================================
-- Step 2 : Drop Existing Staging Table (if it exists)
-- ============================================================================

IF OBJECT_ID('dbo.stg_payment_transactions', 'U') IS NOT NULL
    DROP TABLE dbo.stg_payment_transactions;
GO

-- ============================================================================
-- Step 3 : Create Staging Table from Raw Table
-- ============================================================================

SELECT *
INTO dbo.stg_payment_transactions
FROM dbo.payment_transactions_raw;
GO

-- ============================================================================
-- Step 4 : Validate Row Count
-- ============================================================================

SELECT
    COUNT(*) AS TotalRows
FROM dbo.stg_payment_transactions;
GO