<div align="center">

  # 📊 Enterprise FinTech Payment Intelligence Platform
  ## Phase 5 – Business Intelligence (Power BI)

  ![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-yellow?style=for-the-badge&logo=powerbi&logoColor=white)
  ![DAX](https://img.shields.io/badge/DAX-Measures-blue?style=for-the-badge)
  ![Star Schema](https://img.shields.io/badge/Data_Model-Star_Schema-success?style=for-the-badge)
  ![Explainable AI](https://img.shields.io/badge/Explainable_AI-SHAP-orange?style=for-the-badge)
  ![Status](https://img.shields.io/badge/Phase-Completed-brightgreen?style=for-the-badge)

</div>

<br>

# 📖 Overview

This phase transforms the Enterprise FinTech Payment Intelligence Platform into a complete enterprise Business Intelligence solution using Microsoft Power BI.

The solution combines descriptive analytics, fraud monitoring, executive reporting, and machine learning explainability into a unified reporting platform. It follows enterprise Power BI development best practices by implementing a Star Schema semantic model, reusable DAX measures, interactive dashboards, and AI-powered insights.

---

# 🏛️ Solution Architecture

~~~text
SQL Server Data Warehouse
            │
            ▼
Enterprise Star Schema
            │
            ▼
Power BI Semantic Model
            │
            ▼
Interactive Business Dashboards
            │
 ┌──────────┼──────────┐
 │          │          │
 ▼          ▼          ▼
Executive  Fraud     Explainable AI
Dashboard Analytics & ML Insights
~~~

---

# 📊 Business Intelligence Deliverables

## 👔 Executive Dashboard
Designed for business executives to monitor overall payment platform performance.

### **Key Highlights**
- Total Transactions
- Total Transaction Value
- Average Transaction Value
- Fraud Rate
- Fraud Transactions
- High Value Transactions
- Daily Transaction Trend
- Fraud Trend
- Transaction Type Distribution
- Executive Business Insights

---

## 🔍 Fraud Analytics Dashboard
Designed for fraud operations teams to investigate suspicious transactions.

### **Key Highlights**
- Fraud Transactions
- Fraud Amount
- High Value Fraud Detection
- Fraud by Transaction Type
- Fraud by Time of Day
- Fraud Investigation Tables
- Operational Recommendations

---

## 🤖 Explainable AI & Model Insights Dashboard
Designed for Risk Analytics and Machine Learning teams.

### **Key Highlights**
- Champion Model (Random Forest)
- ML Precision
- ML Recall
- ROC-AUC
- Feature Importance
- SHAP Explainability
- AI Prediction Card
- Model Recommendation

---

# 📐 Enterprise Data Model

The analytical solution is built using an enterprise Star Schema.

### **Fact Table**
- `Fact_PaymentTransactions`

### **Dimension Tables**
- `Dim_Time`
- `Dim_TransactionType`
- `Dim_SourceAccount`
- `Dim_DestinationAccount`
- `Dim_Fraud`

### **Machine Learning Tables**
- `ML_Feature_Importance`
- `SHAP_Local_Explanation`

> 💡 **Note:** The Machine Learning tables remain intentionally disconnected from the analytical model because they support Explainable AI visualizations only.

---

# 🛠️ Technologies Used

- Microsoft Power BI
- DAX
- SQL Server
- Star Schema Data Modeling
- Python
- Random Forest
- SHAP Explainability
- Machine Learning

---

# 📂 Repository Structure

~~~text
05_Business_Intelligence/
│
├── Enterprise_FinTech_Dashboard.pbix
├── README.md
├── 01_Dashboard_Results.md
├── 02_DAX_Measures.md
│
└── images/
    ├── bi_01_executive_dashboard.png
    ├── bi_02_fraud_analytics_dashboard.png
    ├── bi_03_explainable_ai_dashboard.png
    └── bi_04_data_model.png
~~~

---

# 💡 Key Business Outcomes

- Built an enterprise-grade Business Intelligence solution for payment analytics and fraud monitoring.
- Designed a scalable Star Schema semantic model following Power BI best practices.
- Developed reusable DAX measures for executive KPIs and fraud analytics.
- Delivered three interactive dashboards tailored for executives, fraud analysts, and AI stakeholders.
- Integrated Explainable AI using Random Forest model performance metrics and SHAP feature importance.
- Enabled data-driven decision-making through interactive visual analytics and enterprise reporting.

---

# 🏁 Conclusion

This Business Intelligence layer transforms enterprise payment transaction data into actionable insights by combining executive reporting, operational fraud analytics, and Explainable AI within a single Power BI solution. The project demonstrates an end-to-end enterprise BI workflow—from semantic data modeling and DAX development to interactive dashboard design and machine learning integration.