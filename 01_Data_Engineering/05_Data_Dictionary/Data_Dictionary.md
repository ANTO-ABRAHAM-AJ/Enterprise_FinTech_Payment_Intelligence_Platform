# Enterprise Data Dictionary

## Overview

This document defines the schema of the **Enterprise FinTech Payment Intelligence** data warehouse. The database is implemented in **Microsoft SQL Server** using the **Kimball Star Schema** methodology to support scalable analytical processing, fraud analysis, and business intelligence reporting.

The schema consists of one central fact table and five supporting dimension tables connected through surrogate keys to maintain referential integrity and optimize query performance.

---

# Fact Table: `Fact_PaymentTransactions`

**Description**

Stores every payment transaction as a measurable business event. This table contains financial measures and foreign keys that connect each transaction to its corresponding business dimensions.

| Column Name | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| TransactionID | BIGINT | PK | Unique surrogate identifier for each transaction record. |
| TimeKey | INT | FK | References the transaction time in `Dim_Time`. |
| TransactionTypeKey | INT | FK | References the transaction category in `Dim_TransactionType`. |
| FraudKey | INT | FK | References the fraud classification in `Dim_Fraud`. |
| SourceAccountKey | INT | FK | References the originating account in `Dim_SourceAccount`. |
| DestinationAccountKey | INT | FK | References the destination account in `Dim_DestinationAccount`. |
| Amount | DECIMAL(18,2) | - | Monetary value of the transaction. |
| OldBalanceOrig | DECIMAL(18,2) | - | Source account balance before the transaction. |
| NewBalanceOrig | DECIMAL(18,2) | - | Source account balance after the transaction. |
| OldBalanceDest | DECIMAL(18,2) | - | Destination account balance before the transaction. |
| NewBalanceDest | DECIMAL(18,2) | - | Destination account balance after the transaction. |

---

# Dimension Table: `Dim_Time`

**Description**

Stores derived temporal attributes used for time-based reporting and trend analysis.

| Column Name | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| TimeKey | INT | PK | Surrogate key for the time dimension. |
| Step | INT | - | Original simulation step where one step represents one hour. |
| HourOfSimulation | INT | - | Hour within a standardized 24-hour cycle. |
| DayNumber | INT | - | Sequential day number within the simulation. |
| PeriodOfDay | VARCHAR(20) | - | Categorized period of the day (Night, Morning, Afternoon, Evening). |

---

# Dimension Table: `Dim_TransactionType`

**Description**

Stores the category of each payment transaction.

| Column Name | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| TransactionTypeKey | INT | PK | Surrogate key for the transaction type. |
| TransactionType | VARCHAR(20) | - | Transaction category (PAYMENT, TRANSFER, CASH_IN, CASH_OUT, DEBIT). |

---

# Dimension Table: `Dim_Fraud`

**Description**

Stores fraud-related indicators associated with each transaction.

| Column Name | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| FraudKey | INT | PK | Surrogate key for the fraud dimension. |
| IsFraud | BIT | - | Indicates whether the transaction is actually fraudulent (1 = Fraud, 0 = Legitimate). |
| IsFlaggedFraud | BIT | - | Indicates whether the transaction was flagged by the legacy fraud detection rules (1 = Flagged, 0 = Not Flagged). |

---

# Dimension Table: `Dim_SourceAccount`

**Description**

Stores unique identifiers for all originating accounts involved in payment transactions.

| Column Name | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| SourceAccountKey | INT | PK | Surrogate key for the source account. |
| SourceAccountID | VARCHAR(50) | - | Original alphanumeric identifier of the originating account. |

---

# Dimension Table: `Dim_DestinationAccount`

**Description**

Stores unique identifiers for all destination accounts involved in payment transactions.

| Column Name | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| DestinationAccountKey | INT | PK | Surrogate key for the destination account. |
| DestinationAccountID | VARCHAR(50) | - | Original alphanumeric identifier of the receiving account. |

---

## Summary

| Object | Count |
|---------|------:|
| Fact Tables | 1 |
| Dimension Tables | 5 |
| Total Tables | 6 |
| Primary Keys | 6 |
| Foreign Keys | 5 |

---

**Database:** Enterprise_FinTech_Payment_Intelligence

**Architecture:** Kimball Star Schema

**Platform:** Microsoft SQL Server

**Status:** Phase 1 Complete