/*
===============================================================================
Enterprise FinTech Payment Intelligence Platform
File: 01_Database_Setup.sql

Purpose:
This script creates and initializes the SQL Server database used for the
Enterprise FinTech Payment Intelligence Platform.

Author  : Anto Abraham AJ
Database: Enterprise_FinTech_Payment_Intelligence
===============================================================================
*/

-- ============================================================================
-- Step 1 : Create Database (Run only if it doesn't already exist)
-- ============================================================================

IF DB_ID('Enterprise_FinTech_Payment_Intelligence') IS NULL
BEGIN
    CREATE DATABASE Enterprise_FinTech_Payment_Intelligence;
END;
GO

-- ============================================================================
-- Step 2 : Select Database
-- ============================================================================

USE Enterprise_FinTech_Payment_Intelligence;
GO

-- ============================================================================
-- Step 3 : Verify Current Database
-- ============================================================================

SELECT DB_NAME() AS CurrentDatabase;
GO

-- ============================================================================
-- Step 4 : Verify SQL Server Version
-- ============================================================================

SELECT @@VERSION AS SQLServerVersion;
GO

-- ============================================================================
-- Step 5 : Verify Database Recovery Model
-- ============================================================================

SELECT
    name,
    recovery_model_desc
FROM sys.databases
WHERE name = 'Enterprise_FinTech_Payment_Intelligence';
GO