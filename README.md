<div align="center">

# 🏦 Enterprise FinTech Payment Intelligence Platform
**End-to-End Payment Analytics, Fraud Detection, Business Intelligence & Product Analytics Platform**

![Domain](https://img.shields.io/badge/Domain-FinTech%20Payments-blue?style=for-the-badge)
![Tech Stack](https://img.shields.io/badge/Tech-SQL%20%7C%20Python%20%7C%20Power%20BI-orange?style=for-the-badge)
![Focus](https://img.shields.io/badge/Focus-Fraud%20Detection%20%26%20Analytics-success?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

</div>

<br>

# 📌 Project Overview

The **Enterprise FinTech Payment Intelligence Platform** is an end-to-end analytics and fraud intelligence solution designed to demonstrate how modern FinTech organizations can transform large-scale payment transaction data into actionable business insights.

The platform combines:

- **Enterprise Data Engineering**
- **SQL Analytics & Advanced SQL**
- **Machine Learning & Explainable AI (SHAP)**
- **Business Intelligence (Power BI)**
- **Product Analytics & Business Case Studies**

The project uses the **PaySim simulated financial transaction dataset** to investigate fraudulent payment behavior, identify high-risk transaction patterns, develop and evaluate machine learning fraud detection models, build executive Power BI dashboards, and translate analytical findings into product and business recommendations.

The overall objective is to demonstrate how technical analytics can be connected to **business decision-making, fraud prevention, operational monitoring, and product strategy**.

---

# ⚠️ Business Problem

Digital payment platforms process millions of transactions across different transaction types, accounts, and operational periods. As payment ecosystems scale, organizations face challenges such as:

- Increasing transaction volumes
- Fraudulent transaction activity
- High-value financial exposure
- Abnormal account behavior
- Difficulty prioritizing fraud investigations
- Balancing fraud prevention with customer experience

Traditional analytical approaches may identify *what* happened but do not always provide a complete framework for solving the problem.

This project addresses that gap through an integrated enterprise analytics workflow:

> **Understanding the problem ➔ Analyzing behavior ➔ Predicting risk ➔ Communicating insights ➔ Making product decisions**

---

# 🎯 Project Objectives

The primary objectives of the platform are to:

- Build an enterprise analytical foundation for payment transactions.
- Analyze payment and fraud behavior using SQL.
- Engineer meaningful fraud detection features.
- Develop, compare, and select a champion machine learning model.
- Explain model predictions using SHAP.
- Build interactive Power BI dashboards with reusable DAX measures.
- Translate analytical findings into product recommendations.
- Prioritize product initiatives using business impact vs. effort.
- Perform business-focused fraud case studies.

---

# 🌟 North Star Metric — Fraud Loss Prevention

The project uses **Fraud Loss Prevention** as its strategic North Star Metric.

It represents the platform's overarching objective of identifying and reducing fraudulent financial activity while supporting secure and efficient payment operations.

### ⚠️ Measurement Note

Because PaySim is a simulated historical dataset and does not contain intervention outcomes, actual **fraud losses prevented** cannot be directly measured.

Therefore, the project uses measurable supporting metrics as proxies for fraud exposure and detection performance.

### Supporting Metrics

- Fraud Rate
- Fraud Transactions
- Fraud Amount
- High-Value Fraud Transactions
- Total Transaction Value
- Average Transaction Value
- Transaction Type Distribution
- Transaction Frequency
- High-Risk Account Activity

---

# 🔄 End-to-End Project Architecture

```text
                     BUSINESS PROBLEM
                            │
                            ▼
                    DATA ENGINEERING
                            │
                            ▼
                      SQL ANALYTICS
                            │
                            ▼
                      ADVANCED SQL
                            │
                            ▼
                   MACHINE LEARNING
                            │
                            ▼
                EXPLAINABLE AI (SHAP)
                            │
                            ▼
                 BUSINESS INTELLIGENCE
                            │
                            ▼
                   PRODUCT ANALYTICS
                            │
                            ▼
                 BUSINESS CASE STUDIES
                            │
                            ▼
                    BUSINESS DECISIONS
```

---

# 🏗️ Project Phases

## 00 — Business Context

Defines the overall business problem, objectives, scope, proposed solution, North Star Metric, KPI framework, and expected business value.

## 01 — Data Engineering

Builds the enterprise data foundation required for payment and fraud analytics.

### Key Activities
- Data ingestion
- Data validation and cleaning
- SQL Server database creation
- Staging and transformation
- Kimball Star Schema design
- Enterprise Data Dictionary

### Outcome

A structured enterprise data layer capable of supporting downstream SQL analytics, machine learning, and business intelligence.

## 02 — SQL Analytics

Uses SQL to analyze:

- Payment behavior
- Fraud activity
- Transaction patterns
- Account-level activity
- Financial exposure
- Operational trends

### Outcome

Business-focused analytical insights derived from the enterprise payment dataset.

## 03 — Advanced SQL

Applies advanced SQL Server techniques to solve complex analytical and reporting problems.

### Key Techniques
- Views
- Stored Procedures
- User Defined Functions
- Window Functions
- Common Table Expressions
- CASE Expressions
- EXISTS / NOT EXISTS
- UNION ALL
- CROSS APPLY
- Running Totals
- Moving Averages
- Ranking Functions

### Outcome

Reusable and scalable analytical SQL components supporting business reporting and downstream decision-making.

## 04 — Machine Learning & Explainable AI

Develops the predictive fraud detection layer of the platform.

### Machine Learning Workflow

```text
Data Preparation
      │
      ▼
Exploratory Data Analysis
      │
      ▼
Feature Engineering
      │
      ▼
Data Preprocessing
      │
      ▼
Train-Test Split
      │
      ▼
Feature Scaling
      │
      ▼
SMOTE Class Balancing
      │
      ▼
Model Training
      │
      ▼
Model Evaluation
      │
      ▼
Champion Model Selection
      │
      ▼
SHAP Explainability
      │
      ▼
Deployment Preparation
```

### Models Evaluated
- Logistic Regression
- Random Forest
- XGBoost

### 🏆 Champion Model

**Random Forest**

Random Forest was selected based on the overall evaluation of:

- Precision
- Recall
- F1 Score
- ROC-AUC
- False-positive performance
- Operational suitability

### Model Performance

| Metric | Random Forest |
|---|---|
| Precision | 95.72% |
| Recall | 99.45% |
| F1 Score | 97.55% |
| ROC-AUC | 99.88% |

### Explainable AI

SHAP (SHapley Additive exPlanations) was used to provide:

- Global feature importance
- Local transaction-level explanations
- Business interpretation of model predictions

### Deployment Artifacts
- `Champion_Fraud_Model.pkl`
- `Scaler.pkl`
- `Feature_List.pkl`
- `model_metadata.json`

## 05 — Business Intelligence (Power BI)

Transforms analytical and machine learning outputs into interactive Power BI dashboards using an enterprise Star Schema semantic model.

### 📊 Executive Dashboard

Provides an executive-level overview of:

- Total Transactions
- Total Transaction Value
- Average Transaction Value
- Fraud Rate
- Fraud Transactions
- High-Value Transactions
- Transaction Trends
- Transaction Type Distribution

### 🔍 Fraud Analytics Dashboard

Provides operational fraud analysis including:

- Fraud Transactions
- Fraud Amount
- High-Value Fraud Transactions
- Fraud by Transaction Type
- Fraud by Time of Day
- Fraud Investigation Insights

### 🤖 Explainable AI & Model Insights Dashboard

Provides visibility into:

- Champion Model
- ML Precision
- ML Recall
- ROC-AUC
- Feature Importance
- SHAP Insights
- Model Recommendations

### 🏛️ Semantic Model

**Fact Table**
- `Fact_PaymentTransactions`

**Dimension Tables**
- `Dim_Time`
- `Dim_TransactionType`
- `Dim_SourceAccount`
- `Dim_DestinationAccount`
- `Dim_Fraud`

**Machine Learning Tables**
- `ML_Feature_Importance`
- `SHAP_Local_Explanation`

The machine learning tables remain intentionally disconnected from the core analytical model because they support Explainable AI and model-insight visualizations.

## 06 — Product Analytics

Converts analytical findings into product strategy and business decisions.

### Key Components
- Business Problem Definition
- North Star Metric
- KPI Tree
- Product Metrics
- Product Recommendations
- Feature Prioritization
- Experiment Design
- Business Impact Analysis

### Product Analytics Workflow

```text
Business Problem
        │
        ▼
North Star Metric
        │
        ▼
KPI Tree
        │
        ▼
Product Metrics
        │
        ▼
Product Recommendations
        │
        ▼
Feature Prioritization
        │
        ▼
Experiment Design
        │
        ▼
Business Impact Analysis
```

## 07 — Business Case Studies

Applies the platform to practical fraud investigation scenarios.

### Case Studies
- Fraud Spike Investigation
- Top Fraud Contributors Investigation
- Suspicious High-Value Accounts Investigation
- Transaction Velocity Analysis
- Fraud Hotspot Detection
- Customer Activity Segmentation
- Running Fraud Amount Analysis
- Transaction Type Risk Ranking

Each case study follows:

```text
Business Problem
      ↓
SQL Investigation
      ↓
Machine Learning Insights
      ↓
Product Analytics
      ↓
Root Cause Analysis
      ↓
Business Recommendation
      ↓
Business Impact
```

---

# 💡 Key Product Recommendations

Based on the analytical findings, the platform recommends:

### 1. 🛡️ High-Value Transaction Monitoring

Introduce enhanced monitoring for transactions with high financial exposure.

### 2. ⚖️ Risk-Based Transaction Verification

Use transaction risk levels to determine the appropriate verification process:

```text
Low Risk
   ↓
Standard Processing

Medium Risk
   ↓
Additional Monitoring

High Risk
   ↓
Identity Verification / Manual Review
```

### 3. 🤖 Machine Learning Fraud Detection

Use the Random Forest model as the primary predictive fraud detection component alongside complementary business rules.

### 4. 📊 Interactive Fraud Monitoring

Provide operations and business teams with continuous visibility into fraud trends, transaction activity, and high-risk patterns through Power BI dashboards.

### 5. 🔍 High-Risk Account Monitoring

Monitor accounts exhibiting unusual transaction frequency, transaction values, or other elevated-risk behavioral patterns.

---

# 🚀 Feature Prioritization

The project uses an Impact vs. Effort framework.

| Feature | Impact | Effort | Priority |
|---|---|---|---|
| High-Value Transaction Monitoring | High | Low | High |
| Machine Learning Fraud Detection | High | High | High |
| Executive Power BI Dashboard | High | Medium | High |
| Automated Fraud Risk Alerts | High | Medium | High |
| High-Risk Account Monitoring | Medium | Low | Medium |
| Transaction Trend Analytics | Medium | Low | Medium |
| Payment Type Analytics | Medium | Low | Medium |
| Business Recommendation Engine | Medium | Medium | Medium |

---

# 🧪 Experimentation

A conceptual Risk-Based Transaction Verification experiment was designed to demonstrate how a production FinTech organization could validate a fraud prevention feature.

**Control Group**

Existing transaction verification process.

**Treatment Group**

Risk-based verification based on estimated transaction risk.

### Primary Metrics
- Fraud Rate
- Fraud Amount
- High-Value Fraud Transactions

### Secondary Metrics
- Total Fraud Transactions
- Transaction Value at Risk
- Percentage of High-Risk Transactions Reviewed

> **Note:** This experiment is conceptual because the PaySim dataset does not contain customer-level experimentation, approval outcomes, or user experience data.

---

# 💎 Business Value

The platform demonstrates how enterprise analytics can support:

### 🛡️ Fraud Prevention
- Identify suspicious transaction patterns.
- Reduce potential fraud exposure.
- Prioritize high-risk investigations.

### ⚙️ Operational Efficiency
- Reduce manual analytical effort.
- Improve fraud investigation prioritization.
- Provide centralized monitoring.

### 👔 Executive Decision Support
- Monitor business KPIs.
- Understand fraud exposure.
- Support data-driven strategic decisions.

### 💡 Product Decision Support
- Convert analytical findings into product recommendations.
- Prioritize high-impact initiatives.
- Design structured experiments.

### 🔍 Explainable AI
- Improve model transparency.
- Support fraud analyst investigation.
- Provide business interpretation of model predictions.

---

# 🛠️ Technology Stack

| Category | Technologies |
|---|---|
| Database & Data Engineering | Microsoft SQL Server, SSMS, T-SQL |
| Data Modeling | Kimball Star Schema |
| Analytics | SQL, Advanced SQL |
| Machine Learning | Python, Pandas, NumPy, Scikit-learn, XGBoost |
| Explainable AI | SHAP |
| Model Persistence | Joblib |
| Business Intelligence | Microsoft Power BI, DAX |
| Development | Jupyter Notebook |
| Documentation | Markdown |
| Version Control | Git, GitHub |

---

# 📂 Repository Structure

```text
Enterprise_FinTech_Payment_Intelligence_Platform/
│
├── README.md
│
├── 00_Business_Context/
│
├── 01_Data_Engineering/
│
├── 02_SQL_Analytics/
│
├── 03_Advanced_SQL/
│
├── 04_Machine_Learning/
│
├── 05_Business_Intelligence/
│
├── 06_Product_Analytics/
│
├── 07_Business_Case_Studies/
│
└── 08_Presentation/
    └── Planned for interview preparation
```

---

# 📊 Dataset

The project uses the PaySim Mobile Money Transactions dataset.

### Dataset Characteristics
- Approximately 6.3 million transactions
- Synthetic financial transaction data
- Multiple transaction types
- Fraud labels
- Account balance information
- Transaction timestamps represented through simulation steps

### Primary Target Variable

`isFraud`

| Value | Meaning |
|---|---|
| 0 | Legitimate Transaction |
| 1 | Fraudulent Transaction |

The original and intermediate datasets are intentionally excluded from GitHub where appropriate because of their large file sizes.

The complete preprocessing and feature engineering workflows are documented through the project notebooks so the analytical datasets can be reproduced from the source data.

---

# ⚠️ Dataset & Project Limitations

This project uses the synthetic PaySim financial transaction dataset. Therefore, it does not represent a production payment infrastructure.

The dataset does not contain:

- Real customer identities
- Live payment gateway responses
- Transaction authorization outcomes
- Chargebacks
- Refund processing
- Customer retention information
- Customer satisfaction information
- Device fingerprints
- IP intelligence
- Geographic transaction data

Therefore, production metrics such as:

- Transaction Success Rate
- Authorization Rate
- Payment Failure Rate
- Chargeback Rate
- Refund Rate
- Customer Lifetime Value
- Customer Retention

are outside the scope of this implementation.

The project intentionally maintains transparency about these limitations.

---

# 🔮 Future Enhancements

Future versions of the platform could extend the solution with:

### ⚡ Real-Time Processing
- Apache Kafka
- Spark Streaming
- Real-time event processing

### 🚀 Production Deployment
- REST API
- FastAPI
- Cloud infrastructure
- Real-time fraud scoring

### 🧠 Advanced Fraud Intelligence
- Device fingerprinting
- Geolocation analytics
- Behavioral fraud detection
- Graph-based fraud detection
- Graph Neural Networks

### 🔄 MLOps
- Automated model retraining
- Model drift detection
- Continuous model monitoring
- Automated deployment pipelines

---

# 🏁 Final Outcome

The Enterprise FinTech Payment Intelligence Platform demonstrates a complete end-to-end enterprise analytics workflow.

The project connects:

```text
Business Context
      ↓
Data Engineering
      ↓
SQL Analytics
      ↓
Advanced SQL
      ↓
Machine Learning
      ↓
Explainable AI
      ↓
Business Intelligence
      ↓
Product Analytics
      ↓
Business Case Studies
      ↓
Business Decision-Making
```

The final solution demonstrates how technical capabilities such as SQL, Python, Machine Learning, SHAP, and Power BI can be integrated with Business Analysis and Product Analytics to address practical FinTech fraud and payment intelligence challenges.

It provides a structured foundation for:

- Fraud Detection
- Risk Monitoring
- Payment Analytics
- Executive Reporting
- Product Decision-Making
- Business Intelligence
- Explainable AI

---

# 📌 Project Status

**Status: ✅ Completed**

### Completed Phases
- ✅ 00 — Business Context
- ✅ 01 — Data Engineering
- ✅ 02 — SQL Analytics
- ✅ 03 — Advanced SQL
- ✅ 04 — Machine Learning
- ✅ 05 — Business Intelligence
- ✅ 06 — Product Analytics
- ✅ 07 — Business Case Studies

### Planned Later
- ⏳ 08 — Presentation / Interview Preparation

---

<div align="center">

## 🚀 Enterprise FinTech Payment Intelligence Platform

**From Transaction Data → Fraud Intelligence → Business Decisions**

<br>

*Business Analysis • Product Analytics • Data Analytics • SQL • Machine Learning • Power BI • FinTech • Explainable AI*

</div>