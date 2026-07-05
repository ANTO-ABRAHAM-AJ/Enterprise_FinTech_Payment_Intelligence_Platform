USE Enterprise_FinTech_Payment_Intelligence;
GO

/*===========================================================
  STEP 1 : Inspect Dataset
===========================================================*/

SELECT TOP 20 *
FROM dbo.stg_payment_transactions;
GO

/*===========================================================
  STEP 2 : Row Count
===========================================================*/

SELECT COUNT(*) AS TotalRows
FROM dbo.stg_payment_transactions;
GO

/*===========================================================
  STEP 3 : Check NULL Values
===========================================================*/

SELECT
    SUM(CASE WHEN step IS NULL THEN 1 ELSE 0 END) AS step_nulls,
    SUM(CASE WHEN type IS NULL THEN 1 ELSE 0 END) AS type_nulls,
    SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS amount_nulls,
    SUM(CASE WHEN nameOrig IS NULL THEN 1 ELSE 0 END) AS nameOrig_nulls,
    SUM(CASE WHEN oldbalanceOrg IS NULL THEN 1 ELSE 0 END) AS oldbalanceOrg_nulls,
    SUM(CASE WHEN newbalanceOrig IS NULL THEN 1 ELSE 0 END) AS newbalanceOrig_nulls,
    SUM(CASE WHEN nameDest IS NULL THEN 1 ELSE 0 END) AS nameDest_nulls,
    SUM(CASE WHEN oldbalanceDest IS NULL THEN 1 ELSE 0 END) AS oldbalanceDest_nulls,
    SUM(CASE WHEN newbalanceDest IS NULL THEN 1 ELSE 0 END) AS newbalanceDest_nulls,
    SUM(CASE WHEN isFraud IS NULL THEN 1 ELSE 0 END) AS isFraud_nulls,
    SUM(CASE WHEN isFlaggedFraud IS NULL THEN 1 ELSE 0 END) AS isFlaggedFraud_nulls
FROM dbo.stg_payment_transactions;
GO

/*===========================================================
  STEP 4 : Duplicate Check
===========================================================*/

SELECT
    step,
    type,
    amount,
    nameOrig,
    nameDest,
    COUNT(*) AS DuplicateCount
FROM dbo.stg_payment_transactions
GROUP BY
    step,
    type,
    amount,
    nameOrig,
    nameDest
HAVING COUNT(*) > 1;
GO

/*===========================================================
  STEP 5 : Transaction Type Distribution
===========================================================*/

SELECT
    type,
    COUNT(*) AS TotalTransactions
FROM dbo.stg_payment_transactions
GROUP BY type
ORDER BY TotalTransactions DESC;
GO

/*===========================================================
  STEP 6 : Fraud Distribution
===========================================================*/

SELECT
    isFraud,
    COUNT(*) AS TotalTransactions
FROM dbo.stg_payment_transactions
GROUP BY isFraud;
GO

/*===========================================================
  STEP 7 : Flagged Fraud Distribution
===========================================================*/

SELECT
    isFlaggedFraud,
    COUNT(*) AS TotalTransactions
FROM dbo.stg_payment_transactions
GROUP BY isFlaggedFraud;
GO