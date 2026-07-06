# Star Schema Overview

## Overview

The Enterprise FinTech Payment Intelligence Platform follows a **Star Schema** data warehouse design to organize payment transaction data for efficient analytical processing.

A Star Schema is a dimensional modeling technique widely used in enterprise data warehouses because it simplifies SQL queries, improves reporting performance, and provides an intuitive structure for business intelligence tools such as Power BI.

In this project, the Star Schema is designed using the PaySim dataset while preserving the transaction-level details required for payment analytics, fraud analysis, and machine learning.

---

# Why Star Schema?

The Star Schema was selected because it provides several advantages for analytical workloads.

- Simplifies SQL query development
- Improves query performance
- Reduces complex joins
- Optimizes Power BI dashboards
- Supports scalable business reporting
- Enables efficient KPI calculations

Unlike highly normalized transactional databases, a Star Schema is optimized for **read-heavy analytical workloads** rather than transactional operations.

---

# Star Schema Structure

The data warehouse consists of one central Fact Table connected to multiple Dimension Tables.

```text
                  Dim_Time
                     │
                     │
Dim_TransactionType ─────── Fact_PaymentTransactions ─────── Dim_Fraud
```

---

# Fact Table

## Fact_PaymentTransactions

The Fact Table stores every payment transaction from the PaySim dataset.

It contains:

- Transaction Amount
- Account Balances
- Source Account
- Destination Account
- Foreign Keys to Dimensions

The Fact Table serves as the central table for all analytical queries throughout the project.

---

# Dimension Tables

## Dim_Time

Stores unique transaction time steps.

Purpose:

- Time-based analysis
- Daily transaction trends
- Peak transaction periods

---

## Dim_TransactionType

Stores unique payment transaction types.

Values include:

- CASH_IN
- CASH_OUT
- DEBIT
- PAYMENT
- TRANSFER

Purpose:

- Payment method analysis
- Transaction segmentation
- Business KPI calculations

---

## Dim_Fraud

Stores fraud classifications.

Attributes:

- IsFraud
- IsFlaggedFraud

Purpose:

- Fraud analytics
- Fraud dashboards
- Machine learning labels

---

# Why This Design Fits the PaySim Dataset

The PaySim dataset is a synthetic mobile payment dataset containing more than **6.3 million transactions**.

Although the dataset does not include merchant, customer demographic, or geographic information, it contains sufficient transactional attributes to support a dimensional model.

The selected Star Schema captures the most important analytical dimensions available in the dataset while maintaining a simple and efficient structure.

Source and destination account identifiers are retained in the Fact Table because creating a separate Account Dimension would introduce unnecessary complexity without providing significant analytical benefits for this dataset.

---

# Business Benefits

This Star Schema enables efficient analysis of:

- Transaction Volume
- Payment Trends
- Fraud Detection
- Transaction Type Distribution
- Time-Based Analytics
- Customer Payment Behaviour
- High-Value Transactions

The structure also provides a strong foundation for Power BI dashboards and machine learning workflows.

---

# Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- Star Schema Data Modeling

---

# Conclusion

The Star Schema provides a scalable, easy-to-understand, and analytics-focused data model for the Enterprise FinTech Payment Intelligence Platform.

This design serves as the foundation for SQL analytics, fraud detection, business intelligence dashboards, and machine learning developed in the subsequent phases of the project.