# Entity Relationship (ER) Diagram

## Overview

The Entity Relationship (ER) Diagram represents the logical database structure of the Enterprise FinTech Payment Intelligence Platform. It illustrates how the Fact table and Dimension tables are connected through Primary Keys (PK) and Foreign Keys (FK).

---

## Tables

### Fact_PaymentTransactions

The central table of the database that stores every payment transaction.

**Primary Key**
- TransactionID

**Foreign Keys**
- TransactionTypeKey
- FraudKey

**Measures**
- Step
- Amount
- OldBalanceOrig
- NewBalanceOrig
- OldBalanceDest
- NewBalanceDest

---

### Dim_TransactionType

Stores unique transaction types.

**Primary Key**
- TransactionTypeKey

**Attribute**
- TransactionType

Examples:
- CASH_IN
- CASH_OUT
- DEBIT
- PAYMENT
- TRANSFER

---

### Dim_Fraud

Stores fraud-related information.

**Primary Key**
- FraudKey

**Attributes**
- IsFraud
- IsFlaggedFraud

---

## Relationships

The database contains two One-to-Many (1:M) relationships.

1. Dim_TransactionType → Fact_PaymentTransactions
2. Dim_Fraud → Fact_PaymentTransactions

Each transaction references one transaction type and one fraud category, while each dimension record can be associated with many transactions.

---

## Purpose

The ER Diagram provides a clear view of the database structure, ensuring data integrity through Primary Key and Foreign Key relationships. It serves as the logical blueprint of the database before performing analytical queries and reporting.