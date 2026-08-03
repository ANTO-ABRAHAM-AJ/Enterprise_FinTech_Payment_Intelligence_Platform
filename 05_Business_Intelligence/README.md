# Enterprise FinTech Payment Intelligence Platform
## Phase 5 — Business Intelligence & Executive Dashboards

![Power BI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![DAX](https://img.shields.io/badge/DAX-Measures-blue)
![Star Schema](https://img.shields.io/badge/Data_Model-Star_Schema-success)
![Machine Learning](https://img.shields.io/badge/Explainable_AI-SHAP-orange)
![Status](https://img.shields.io/badge/Phase-Completed-brightgreen)

---

# Overview

This phase transforms the Enterprise FinTech Payment Intelligence Platform into an executive decision-support system using Microsoft Power BI.

The solution combines enterprise payment analytics, fraud intelligence, and machine learning explainability into a unified reporting platform.

Unlike traditional dashboards, this project follows a complete enterprise BI architecture consisting of:

- Star Schema Data Model
- DAX Semantic Layer
- Executive KPI Dashboards
- Fraud Analytics
- Explainable AI Dashboard
- Machine Learning Insights

---

# Architecture

SQL Data Warehouse
        ↓
Star Schema Data Model
        ↓
Power BI Semantic Model
        ↓
Executive Dashboards
        ↓
Fraud Analytics
        ↓
Explainable AI & ML Insights

---

# Dashboards

## Executive Dashboard

Designed for senior management to monitor overall payment platform health.

Key Insights

- Total Transactions
- Total Transaction Value
- Average Transaction Value
- Fraud Rate
- Daily Transaction Volume
- Fraud Trend
- Transaction Type Distribution
- Executive Business Insights

---

## Fraud Analytics Dashboard

Designed for Fraud Operations teams.

Key Insights

- Fraud Transaction Analysis
- Fraud Amount
- High Value Fraud Detection
- Fraud by Transaction Type
- Fraud by Time of Day
- Fraud Investigation Tables
- Operational Recommendations

---

## Explainable AI Dashboard

Designed for Risk Analytics and Machine Learning teams.

Key Insights

- Champion Model (Random Forest)
- ML Precision
- ML Recall
- ROC-AUC
- SHAP Feature Importance
- AI Prediction Card
- Explainable AI Insights

---

# Enterprise Data Model

The solution follows an enterprise Star Schema.

Fact Table

- Fact_PaymentTransactions

Dimension Tables

- Dim_Time
- Dim_TransactionType
- Dim_SourceAccount
- Dim_DestinationAccount
- Dim_Fraud

Machine Learning Tables

- ML_Feature_Importance
- SHAP_Local_Explanation

The Machine Learning tables are intentionally disconnected from the analytical model because they support only Explainable AI visualizations.

---

# Technologies

- Microsoft Power BI
- DAX
- SQL Server
- Star Schema Data Modeling
- Random Forest
- SHAP Explainability
- Python
- Machine Learning

---

# Folder Structure

05_Business_Intelligence
│
├── Enterprise_FinTech_Dashboard.pbix
├── README.md
├── 02_DAX_Measures.md
│
├── images
│   ├── bi_01_executive_dashboard.png
│   ├── bi_02_fraud_analytics_dashboard.png
│   ├── bi_03_explainable_ai_dashboard.png
│   └── bi_04_data_model.png

---

# Business Outcome

This Business Intelligence layer converts enterprise payment data into actionable business intelligence, enabling executives, fraud analysts, and machine learning teams to make faster and more informed decisions from a single reporting platform.