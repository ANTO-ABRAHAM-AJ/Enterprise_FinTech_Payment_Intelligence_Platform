# Star Schema

## Enterprise FinTech Payment Intelligence Platform

---

## Overview

The Enterprise FinTech Payment Intelligence Platform uses a **Star Schema** to organize payment transaction data for analytical reporting and business intelligence.

The Star Schema consists of one central **Fact Table** connected to multiple **Dimension Tables**. This design simplifies data analysis, reduces redundancy, and improves query performance.

---

# Star Schema Architecture

The Star Schema contains the following tables:

- Fact_PaymentTransactions
- Dim_TransactionType
- Dim_Fraud

The Fact table stores all payment transactions, while the Dimension tables store descriptive business information.

---

# Fact Table

## Fact_PaymentTransactions

The Fact table is the central table of the Star Schema.

It stores every payment transaction along with numerical business measures.

### Columns

- TransactionID (Primary Key)
- TransactionTypeKey (Foreign Key)
- FraudKey (Foreign Key)
- Step
- Amount
- OldBalanceOrig
- NewBalanceOrig
- OldBalanceDest
- NewBalanceDest

### Purpose

The Fact table stores transactional data and references the Dimension tables using Foreign Keys.

---

# Dimension Tables

## Dim_TransactionType

This Dimension stores all unique transaction types.

### Columns

- TransactionTypeKey (Primary Key)
- TransactionType

### Purpose

Instead of storing transaction names millions of times inside the Fact table, the system stores only a TransactionTypeKey.

This reduces data redundancy and improves storage efficiency.

---

## Dim_Fraud

This Dimension stores fraud information.

### Columns

- FraudKey (Primary Key)
- IsFraud
- IsFlaggedFraud

### Purpose

Fraud information is separated from the Fact table to improve normalization and simplify analytical reporting.

---

# Relationships

The Fact table connects to both Dimension tables through Foreign Keys.

- TransactionTypeKey → Dim_TransactionType
- FraudKey → Dim_Fraud

These relationships maintain referential integrity and enable efficient joins during reporting.

---

# Benefits of the Star Schema

- Reduces data redundancy
- Improves query performance
- Simplifies analytical reporting
- Supports Power BI dashboards
- Enables scalable data warehouse design
- Makes business data easier to understand

---

# Conclusion

The Star Schema provides a clean and efficient analytical data model for the Enterprise FinTech Payment Intelligence Platform. By separating descriptive information into Dimension tables and storing transactional measures in the Fact table, the database becomes optimized for reporting, dashboarding, and business intelligence applications.