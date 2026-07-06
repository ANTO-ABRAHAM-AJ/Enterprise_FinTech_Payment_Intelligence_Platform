# Entity Descriptions

## Overview

This document describes each entity (table) used in the Enterprise FinTech Payment Intelligence Platform.

Each entity has a specific responsibility within the data warehouse and contributes to payment analytics, fraud detection, and business intelligence.

---

# 1. Fact_PaymentTransactions

## Purpose

The **Fact_PaymentTransactions** table is the central table of the data warehouse.

It stores every payment transaction from the PaySim dataset and contains the numerical measures used for reporting, analytics, and machine learning.

---

## Columns

| Column | Description |
|----------|-------------|
| TransactionID | Unique identifier for each transaction |
| TimeKey | References the transaction time in Dim_Time |
| TransactionTypeKey | References the payment type in Dim_TransactionType |
| FraudKey | References fraud information in Dim_Fraud |
| SourceAccount | Account initiating the transaction |
| DestinationAccount | Account receiving the transaction |
| Amount | Transaction amount |
| OldBalanceOrig | Sender balance before transaction |
| NewBalanceOrig | Sender balance after transaction |
| OldBalanceDest | Receiver balance before transaction |
| NewBalanceDest | Receiver balance after transaction |

---

## Primary Key

- TransactionID

---

## Foreign Keys

- TimeKey
- TransactionTypeKey
- FraudKey

---

# 2. Dim_Time

## Purpose

The **Dim_Time** table stores unique transaction time values.

The PaySim dataset represents time using the **Step** attribute, where each step corresponds to one hour in the simulation.

---

## Columns

| Column | Description |
|----------|-------------|
| TimeKey | Surrogate Primary Key |
| Step | Hourly transaction step |

---

## Primary Key

- TimeKey

---

# 3. Dim_TransactionType

## Purpose

The **Dim_TransactionType** table stores the unique transaction types available in the PaySim dataset.

Separating transaction types into a dimension reduces redundancy and simplifies analytical queries.

---

## Columns

| Column | Description |
|----------|-------------|
| TransactionTypeKey | Surrogate Primary Key |
| TransactionType | Payment transaction type |

---

## Available Values

- CASH_IN
- CASH_OUT
- DEBIT
- PAYMENT
- TRANSFER

---

## Primary Key

- TransactionTypeKey

---

# 4. Dim_Fraud

## Purpose

The **Dim_Fraud** table stores fraud-related classifications for payment transactions.

It separates fraud attributes from transactional data and supports fraud analytics and machine learning.

---

## Columns

| Column | Description |
|----------|-------------|
| FraudKey | Surrogate Primary Key |
| IsFraud | Indicates whether the transaction is fraudulent |
| IsFlaggedFraud | Indicates whether the transaction was flagged as suspicious |

---

## Primary Key

- FraudKey

---

# Entity Summary

| Entity | Role |
|----------|------|
| Fact_PaymentTransactions | Stores payment transactions |
| Dim_Time | Stores transaction time information |
| Dim_TransactionType | Stores payment transaction categories |
| Dim_Fraud | Stores fraud classifications |

---

# Conclusion

Each entity in the Enterprise FinTech Payment Intelligence Platform has a clearly defined responsibility.

The combination of one Fact Table and three Dimension Tables provides a clean, scalable, and analytics-oriented data model suitable for SQL analytics, Power BI dashboards, and machine learning.