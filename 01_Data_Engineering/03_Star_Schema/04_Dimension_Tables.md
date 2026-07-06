# Dimension Tables

## Overview

Dimension Tables provide descriptive attributes that give business context to the transactional data stored in the Fact Table.

In the Enterprise FinTech Payment Intelligence Platform, three Dimension Tables are used to support payment analytics, fraud analysis, and business intelligence reporting.

Each Dimension Table is connected to the Fact_PaymentTransactions table through a foreign key, forming a Star Schema.

---

# Dimension Tables

| Dimension | Primary Key | Purpose |
|------------|-------------|---------|
| Dim_Time | TimeKey | Stores transaction time information |
| Dim_TransactionType | TransactionTypeKey | Stores payment transaction types |
| Dim_Fraud | FraudKey | Stores fraud classifications |

---

# 1. Dim_Time

## Purpose

The **Dim_Time** table stores unique transaction time steps from the PaySim dataset.

Although the PaySim dataset does not contain calendar dates, the **Step** column represents hourly intervals in the payment simulation.

This dimension enables time-based analysis without storing duplicate values in the Fact Table.

---

## Table Structure

| Column | Data Type | Description |
|----------|-----------|-------------|
| TimeKey | INT | Surrogate Primary Key |
| Step | INT | Hourly transaction step |

---

## Business Applications

The Time Dimension supports:

- Transaction trends over time
- Peak transaction hour analysis
- Fraud trend analysis
- Time-series reporting
- Executive dashboards

---

# 2. Dim_TransactionType

## Purpose

The **Dim_TransactionType** table stores the unique payment transaction types available in the PaySim dataset.

This dimension enables business users to analyze transaction behaviour across different payment methods.

---

## Table Structure

| Column | Data Type | Description |
|----------|-----------|-------------|
| TransactionTypeKey | INT | Surrogate Primary Key |
| TransactionType | VARCHAR(20) | Payment transaction type |

---

## Available Transaction Types

- CASH_IN
- CASH_OUT
- DEBIT
- PAYMENT
- TRANSFER

---

## Business Applications

The Transaction Type Dimension supports:

- Payment method analysis
- Transaction segmentation
- Fraud comparison by payment type
- Business KPI calculations
- Executive reporting

---

# 3. Dim_Fraud

## Purpose

The **Dim_Fraud** table stores fraud-related classifications for each transaction.

It separates fraud attributes from the Fact Table and supports fraud analytics and machine learning.

---

## Table Structure

| Column | Data Type | Description |
|----------|-----------|-------------|
| FraudKey | INT | Surrogate Primary Key |
| IsFraud | BIT | Indicates whether the transaction is fraudulent |
| IsFlaggedFraud | BIT | Indicates whether the transaction was flagged as suspicious |

---

## Business Applications

The Fraud Dimension supports:

- Fraud trend analysis
- Fraud rate calculation
- Fraud dashboards
- Fraud investigation
- Machine learning model development

---

# Relationship with Fact Table

Each Dimension Table has a one-to-many relationship with the Fact Table.

```text
Dim_Time
     │
     │
Dim_TransactionType ───── Fact_PaymentTransactions ───── Dim_Fraud
```

Each transaction stored in the Fact Table references one record from each Dimension Table through foreign keys.

---

# Why These Dimensions Were Selected

The PaySim dataset provides a limited number of descriptive attributes suitable for dimensional modeling.

The selected dimensions were chosen because they:

- Eliminate repeated values
- Simplify analytical queries
- Improve reporting performance
- Support business KPI calculations
- Provide a clean Star Schema design

This approach keeps the data warehouse simple, scalable, and optimized for analytical workloads.

---

# Benefits of Dimension Tables

Using Dimension Tables provides several advantages:

- Reduces data redundancy
- Simplifies SQL joins
- Improves dashboard performance
- Enhances readability
- Supports scalable business reporting
- Enables efficient analytical processing

---

# Conclusion

The Dimension Tables provide the descriptive context required for enterprise payment analytics.

Together with the Fact_PaymentTransactions table, they form a clean and efficient Star Schema that supports SQL analytics, Power BI dashboards, fraud detection, and machine learning throughout the project.