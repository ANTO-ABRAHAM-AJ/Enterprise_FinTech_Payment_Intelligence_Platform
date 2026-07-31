# Dataset Description

---

# Overview

The Enterprise FinTech Payment Intelligence Platform uses the **PaySim** dataset to simulate real-world mobile payment transactions. PaySim is a synthetic dataset generated from financial transaction patterns and is widely used for fraud detection research, machine learning, and payment analytics.

The dataset represents a realistic digital payment ecosystem, making it suitable for developing and evaluating fraud detection models while preserving user privacy.

---

# Dataset Information

| Attribute | Details |
|-----------|---------|
| Dataset Name | PaySim Mobile Money Transactions |
| Source | Kaggle |
| Domain | FinTech / Digital Payments |
| Format | CSV |
| File Name | `paysim_raw.csv` |
| Records | ~6.3 Million Transactions |
| Features | 11 Columns |
| Target Variable | `isFraud` |

---

# Why This Dataset?

The PaySim dataset was selected because it closely represents real-world financial transaction behavior while avoiding the privacy concerns associated with production banking data.

The dataset provides:

- Large-scale transaction records
- Realistic payment behavior
- Fraud-labelled transactions
- Multiple transaction types
- Financial attributes for analysis
- Suitable class imbalance for fraud detection

These characteristics make it an excellent dataset for demonstrating enterprise payment analytics and machine learning workflows.

---

# Business Context

Every transaction in the dataset represents a financial activity occurring within a digital payment platform.

Typical business operations include:

- Customer fund transfers
- Merchant payments
- Cash deposits
- Cash withdrawals
- Balance updates

The objective is to identify fraudulent transactions while understanding overall payment behavior through analytics and visualization.

---

# Dataset Schema

| Column | Data Type | Description |
|---------|-----------|-------------|
| step | Integer | Time step representing the transaction period (1 step ≈ 1 hour). |
| type | String | Type of transaction (PAYMENT, TRANSFER, CASH_IN, CASH_OUT, DEBIT). |
| amount | Decimal | Amount involved in the transaction. |
| nameOrig | String | Unique identifier of the sender account. |
| oldbalanceOrg | Decimal | Sender's account balance before the transaction. |
| newbalanceOrig | Decimal | Sender's account balance after the transaction. |
| nameDest | String | Unique identifier of the receiver account. |
| oldbalanceDest | Decimal | Receiver's account balance before the transaction. |
| newbalanceDest | Decimal | Receiver's account balance after the transaction. |
| isFraud | Integer | Target variable indicating whether the transaction is fraudulent (1 = Fraud, 0 = Legitimate). |
| isFlaggedFraud | Integer | Indicates transactions automatically flagged by predefined system rules. |

---

# Transaction Types

The dataset contains five transaction categories.

| Transaction Type | Description |
|------------------|-------------|
| CASH_IN | Money deposited into an account. |
| CASH_OUT | Money withdrawn from an account. |
| DEBIT | Debit transaction from an account. |
| PAYMENT | Payment made to a merchant or service. |
| TRANSFER | Money transferred between accounts. |

These transaction types are analyzed throughout the project to identify operational trends and fraud patterns.

---

# Target Variable

The primary prediction target is:

**isFraud**

| Value | Meaning |
|-------|---------|
| 0 | Legitimate Transaction |
| 1 | Fraudulent Transaction |

This binary target is used to train and evaluate machine learning classification models.

---

# Data Quality

The dataset was assessed before analysis to ensure suitability for downstream processing.

The following checks were performed:

- Dataset structure validation
- Data type verification
- Missing value inspection
- Duplicate record detection
- Transaction type validation
- Target class verification

Any preprocessing required for analytics and machine learning is documented in the Data Engineering notebooks.

---

# Project Usage

The dataset is used across multiple stages of the project.

| Project Phase | Usage |
|--------------|-------|
| Data Engineering | Data loading, validation, preprocessing |
| SQL Data Warehouse | Data import and schema design |
| SQL Analytics | Business KPI calculation and reporting |
| Machine Learning | Fraud detection model development |
| Explainable AI | Feature importance and prediction explanations |
| Power BI | Dashboard development and visualization |

---

# Limitations

Although the dataset is highly realistic, it has certain limitations.

- Synthetic rather than real banking transactions.
- Fraud patterns may not represent all real-world scenarios.
- Historical data only; no live streaming transactions.
- Generated for research and educational purposes.

Despite these limitations, the dataset provides a strong foundation for demonstrating enterprise analytics techniques.

---

# Summary

The PaySim dataset provides a scalable and realistic representation of digital payment transactions, making it well suited for enterprise payment analytics and fraud detection.

Within this project, it serves as the primary data source for building the SQL data warehouse, performing business analytics, training machine learning models, implementing Explainable AI, and developing interactive Power BI dashboards.

The dataset enables the project to demonstrate an end-to-end enterprise workflow while maintaining data privacy through the use of synthetic transaction records.