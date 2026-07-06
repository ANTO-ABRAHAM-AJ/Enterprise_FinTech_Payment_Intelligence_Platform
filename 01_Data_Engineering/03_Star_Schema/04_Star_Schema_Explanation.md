# Star Schema Explanation

## Overview

The Enterprise FinTech Payment Intelligence Platform follows a **Star Schema** data warehouse architecture.

A Star Schema consists of a single central Fact Table connected to multiple Dimension Tables through primary key and foreign key relationships.

This design is optimized for analytical workloads, enabling faster SQL queries, simplified reporting, and efficient dashboard development.

---

# Star Schema Architecture

```text
                    +------------------+
                    |     Dim_Time     |
                    +------------------+
                    | TimeKey (PK)     |
                    | Step             |
                    +------------------+
                           |
                           |
                           |
+----------------------+   |   +----------------------+
| Dim_TransactionType  |---+---| Fact_PaymentTransactions |
+----------------------+       +---------------------------+
| TransactionTypeKey PK|       | TransactionID (PK)        |
| TransactionType      |       | TimeKey (FK)             |
+----------------------+       | TransactionTypeKey (FK)  |
                               | FraudKey (FK)            |
+----------------------+       | SourceAccount            |
|      Dim_Fraud       |-------| DestinationAccount       |
+----------------------+       | Amount                  |
| FraudKey (PK)        |       | OldBalanceOrig          |
| IsFraud              |       | NewBalanceOrig          |
| IsFlaggedFraud       |       | OldBalanceDest          |
+----------------------+       | NewBalanceDest          |
                               +--------------------------+
```

---

# Fact Table

The **Fact_PaymentTransactions** table is the central table of the data warehouse.

It stores every payment transaction and contains measurable business values such as transaction amount and account balances.

Every analytical query in this project starts from the Fact Table.

---

# Dimension Tables

The Fact Table is connected to three Dimension Tables.

## Dim_Time

Provides the transaction time reference using the PaySim **Step** value.

Supports:

- Transaction trends
- Peak hour analysis
- Time-series reporting

---

## Dim_TransactionType

Stores the unique payment transaction types.

Supports:

- Payment method analysis
- Transaction segmentation
- Business KPI reporting

---

## Dim_Fraud

Stores fraud classifications.

Supports:

- Fraud analytics
- Fraud investigation
- Machine learning labels
- Fraud dashboards

---

# Relationships

The data warehouse follows a **One-to-Many** relationship model.

| Parent Table | Child Table | Relationship |
|---------------|-------------|--------------|
| Dim_Time | Fact_PaymentTransactions | One-to-Many |
| Dim_TransactionType | Fact_PaymentTransactions | One-to-Many |
| Dim_Fraud | Fact_PaymentTransactions | One-to-Many |

Each transaction references one record from each Dimension Table through foreign keys.

---

# Why Star Schema Instead of Normalized Tables?

The Star Schema was selected because analytical systems prioritize fast data retrieval rather than transaction processing.

Advantages include:

- Simplified SQL queries
- Fewer joins
- Faster aggregations
- Better Power BI performance
- Efficient KPI calculations
- Improved readability

This design is widely used in enterprise data warehouses and business intelligence solutions.

---

# Why This Design Fits the PaySim Dataset

The PaySim dataset contains over **6.3 million payment transactions** with transaction-level information.

The dataset provides limited descriptive attributes, making a lightweight Star Schema the most appropriate design.

The selected dimensions represent the most important analytical perspectives available:

- Time
- Transaction Type
- Fraud Classification

Source and destination account identifiers remain in the Fact Table because the dataset does not contain additional customer attributes required to build a meaningful Account Dimension.

---

# Business Benefits

The Star Schema enables efficient analysis of:

- Transaction Volume
- Payment Trends
- Fraud Detection
- Transaction Type Distribution
- High-Value Transactions
- Customer Payment Behaviour
- Time-Based Analytics

It also serves as the foundation for:

- SQL Analytics
- Power BI Dashboards
- Fraud Analytics
- Machine Learning

---

# Design Principles

The Star Schema was designed following these principles:

- Simplicity
- Scalability
- Data Integrity
- Readability
- Performance Optimization
- Business-Oriented Modeling

The schema avoids unnecessary complexity while providing a strong foundation for enterprise analytics.

---

# Conclusion

The Star Schema provides a clean, scalable, and analytics-oriented data model for the Enterprise FinTech Payment Intelligence Platform.

Its dimensional design simplifies SQL development, improves reporting performance, and supports advanced analytics, making it well suited for enterprise payment intelligence and fraud detection use cases.