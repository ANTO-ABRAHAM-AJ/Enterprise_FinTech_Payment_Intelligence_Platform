<div align="center">

  # 📐 DAX Measures & Semantic Model

  ![Phase](https://img.shields.io/badge/Phase-05%20DAX%20Measures-blue?style=for-the-badge)
  ![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
  ![Tool](https://img.shields.io/badge/Tool-Power%20BI-yellow?style=for-the-badge&logo=powerbi&logoColor=white)
  ![Language](https://img.shields.io/badge/Language-DAX-orange?style=for-the-badge)

</div>

<br>

# Enterprise FinTech Payment Intelligence Platform

## 📖 Overview

This document summarizes the DAX measures used throughout the Power BI semantic model.

The measures provide reusable business logic for executive reporting, fraud analytics, and machine learning performance monitoring while maintaining a clean enterprise-grade data model.

---

## 🏛️ Semantic Model Architecture

### 📊 Fact Table
- `Fact_PaymentTransactions`

### 📐 Dimension Tables
- `Dim_Time`
- `Dim_TransactionType`
- `Dim_SourceAccount`
- `Dim_DestinationAccount`
- `Dim_Fraud`

### 🤖 Machine Learning Tables
- `ML_Feature_Importance`
- `SHAP_Local_Explanation`

---

## 📈 Executive KPI Measures

These measures power the Executive Dashboard and provide a high-level overview of platform performance:
- **Total Transactions**
- **Total Transaction Value**
- **Average Transaction Value**
- **Fraud Transactions**
- **Fraud Rate %**
- **Global Fraud Rate**
- **High Value Transactions**
- **Total Source Accounts**
- **Total Destination Accounts**

---

## 🧠 Machine Learning KPI Measures

These measures expose the production fraud detection model performance directly inside Power BI for business stakeholders:
- **ML Champion Model**
- **ML Precision**
- **ML Recall**
- **ML ROC AUC**

---

## 💼 Business Purpose

The DAX measures enable:
- Executive KPI monitoring
- Fraud detection analytics
- Financial transaction monitoring
- Customer and account insights
- Machine Learning model reporting
- Explainable AI dashboard integration

The semantic model is designed to provide reusable calculations, improve report performance, and support enterprise-scale analytical dashboards.

---

## ⚙️ Enterprise Design Highlights

- **Centralized Measures Table** for reusable business calculations.
- **Star Schema** semantic model optimization.
- **Clear Separation** of Facts, Dimensions, and Measures.
- **Machine Learning Metrics** integrated directly into Power BI.
- **Explainable AI Support** using SHAP feature importance.
- **High Performance** optimized for scalable business intelligence reporting.

---

## 📦 Deliverables

- Executive KPI Measures
- Fraud Analytics Measures
- Machine Learning Performance Measures
- Enterprise Semantic Model
- Power BI Dashboard Integration

---

## ✅ Status

**Status:** Completed