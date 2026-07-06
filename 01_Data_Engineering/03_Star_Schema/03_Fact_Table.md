# Fact Table

## Overview

The **Fact_PaymentTransactions** table is the central table of the Enterprise FinTech Payment Intelligence Platform.

It stores every payment transaction from the PaySim dataset and serves as the foundation for payment analytics, fraud detection, business intelligence, and machine learning.

Each row in the Fact Table represents one individual payment transaction.

---

# Purpose

The Fact Table is designed to:

- Store transaction-level payment data
- Support enterprise payment analytics
- Enable fraud detection
- Calculate business KPIs
- Power Power BI dashboards
- Provide input for machine learning models

---

# Table Structure

| Column | Data Type | Description |
|----------|-----------|-------------|
| TransactionID | BIGINT | Unique identifier for each transaction |
| TimeKey | INT | Foreign Key referencing Dim_Time |
| TransactionTypeKey | INT | Foreign Key referencing Dim_TransactionType |
| FraudKey | INT | Foreign Key referencing Dim_Fraud |
| SourceAccount | VARCHAR | Customer initiating the transaction |
| DestinationAccount | VARCHAR | Recipient of the transaction |
| Amount | DECIMAL(18,2) | Transaction amount |
| OldBalanceOrig | DECIMAL(18,2) | Sender balance before transaction |
| NewBalanceOrig | DECIMAL(18,2) | Sender balance after transaction |
| OldBalanceDest | DECIMAL(18,2) | Receiver balance before transaction |
| NewBalanceDest | DECIMAL(18,2) | Receiver balance after transaction |

---

# Primary Key

| Key | Description |
|------|-------------|
| TransactionID | Uniquely identifies every payment transaction |

---

# Foreign Keys

| Foreign Key | References |
|--------------|------------|
| TimeKey | Dim_Time |
| TransactionTypeKey | Dim_TransactionType |
| FraudKey | Dim_Fraud |

These foreign keys establish the relationships between the Fact Table and the Dimension Tables, forming the Star Schema.

---

# Measures

The Fact Table contains the following numerical measures used for analytics.

- Amount
- OldBalanceOrig
- NewBalanceOrig
- OldBalanceDest
- NewBalanceDest

These measures are aggregated throughout the project to calculate payment KPIs and support business reporting.

---

# Business Applications

The Fact Table supports analysis such as:

- Transaction Volume Analysis
- High-Value Transaction Analysis
- Payment Trend Analysis
- Fraud Detection
- Customer Payment Behaviour
- Balance Movement Analysis
- Transaction Type Analysis
- Time-Series Analysis

---

# Why Account IDs Remain in the Fact Table

The PaySim dataset contains source and destination account identifiers for every transaction.

Instead of creating a separate Account Dimension, these account identifiers are retained in the Fact Table because:

- They are directly associated with each transaction.
- The dataset does not provide additional customer attributes.
- This approach keeps the schema simple while supporting behavioural analysis.

---

# Relationships

The Fact Table is connected to three Dimension Tables.

```text
Dim_Time
      │
      │
Dim_TransactionType ─── Fact_PaymentTransactions ─── Dim_Fraud
```

This design enables efficient joins while minimizing redundancy.

---

# Business Value

The Fact Table serves as the analytical foundation for the entire platform.

It enables business users to:

- Monitor transaction performance
- Detect fraudulent activities
- Analyze payment behaviour
- Measure operational KPIs
- Generate executive dashboards
- Train fraud prediction models

---

# Conclusion

The **Fact_PaymentTransactions** table is the core component of the Enterprise FinTech Payment Intelligence Platform. By storing transaction-level data and linking it to multiple dimensions, it provides a scalable foundation for analytics, reporting, and machine learning throughout the project.