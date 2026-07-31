# Business Intelligence (Power BI)

## Overview

This phase transforms the processed payment transaction data into interactive executive dashboards that provide business insights, fraud monitoring, and machine learning explainability.

The dashboard enables business users to monitor transaction performance, investigate fraud patterns, and understand how the deployed machine learning model makes fraud detection decisions.

---

## Objectives

- Build executive-level dashboards
- Monitor payment performance
- Analyze fraudulent transactions
- Present key business KPIs
- Visualize machine learning insights
- Improve decision-making through interactive reporting

---

## Dashboard Pages

### 1. Executive Dashboard

Provides a high-level overview of platform performance.

Key Metrics

- Total Transactions
- Total Transaction Value
- Average Transaction Value
- Fraud Rate
- Fraud Transactions
- High Value Transactions
- Total Source Accounts
- Total Destination Accounts

Visualizations

- Daily Transaction Volume
- Daily Fraud Trend
- Transaction Distribution
- Fraud by Transaction Type

---

### 2. Fraud Analytics

Provides detailed fraud investigation capabilities.

Includes

- Fraud Amount
- Fraud Transactions
- Global Fraud Rate
- High Value Fraud
- Fraud Trend
- Fraud by Transaction Type
- Fraud by Period of Day
- High Value Analysis
- Source Account Analysis
- Fraud Transaction Table
- Business Risk Insights

---

### 3. Explainable AI & Model Insights

Presents the machine learning model in business language.

Includes

- Champion Model
- Precision
- Recall
- ROC AUC
- Feature Importance
- SHAP Insights
- AI Prediction Example
- Model Recommendations

---

## Data Model

The dashboard follows a Star Schema consisting of:

- Fact_PaymentTransactions
- Dim_Time
- Dim_TransactionType
- Dim_SourceAccount
- Dim_DestinationAccount
- Dim_Fraud

Additional Tables

- Measures
- ML_Feature_Importance
- SHAP_Local_Explanation

---

## Tools Used

- Microsoft Power BI
- DAX
- Power Query
- Star Schema Data Modeling

---

## Deliverables

- Interactive Power BI Dashboard (.pbix)
- Executive Dashboard
- Fraud Analytics Dashboard
- Explainable AI Dashboard