# 🤖 Phase 04 – Machine Learning

![Phase](https://img.shields.io/badge/Phase-04%20Machine%20Learning-blue)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Python](https://img.shields.io/badge/Python-3.11-blue)
![Scikit--Learn](https://img.shields.io/badge/Scikit--Learn-Machine%20Learning-orange)
![XGBoost](https://img.shields.io/badge/XGBoost-Fraud%20Detection-success)
![Champion Model](https://img.shields.io/badge/Champion%20Model-Random%20Forest-darkgreen)
![Explainable AI](https://img.shields.io/badge/Explainable%20AI-SHAP-purple)
![Dataset](https://img.shields.io/badge/Dataset-PaySim-red)

---

# Enterprise FinTech Payment Intelligence Platform

## Overview

This phase focuses on designing, building, evaluating, and preparing a production-ready Machine Learning pipeline for enterprise payment fraud detection.

Using the **PaySim financial transaction dataset**, the pipeline transforms engineered payment features into an explainable fraud detection system capable of identifying highly imbalanced fraudulent transactions while minimizing false positives and maintaining production readiness.

The complete workflow includes feature engineering, data preprocessing, model training, model evaluation, explainable AI (SHAP), deployment preparation, and executive business recommendations.

---

# 🎯 Phase Objectives

The objectives of this phase are to:

- Develop production-quality machine learning datasets.
- Engineer meaningful fraud detection features.
- Prepare balanced datasets for supervised learning.
- Train multiple fraud detection models.
- Compare model performance using business-focused evaluation metrics.
- Interpret model decisions using SHAP Explainable AI.
- Package the winning model for deployment.
- Produce executive business recommendations for enterprise implementation.

---

# 📂 Folder Structure

```text
04_Machine_Learning/
│
├── datasets/
│   ├── clean_ml_dataset.csv
│   ├── feature_engineered_dataset.csv
│   ├── X_train_smote.csv
│   ├── X_test.csv
│   ├── y_train_smote.csv
│   └── y_test.csv
│
├── images/
│
├── models/
│   ├── LogisticRegression_Model.pkl
│   ├── RandomForest_Model.pkl
│   ├── XGBoost_Model.pkl
│   ├── Champion_Fraud_Model.pkl
│   ├── Scaler.pkl
│   ├── Feature_List.pkl
│   └── model_metadata.json
│
├── outputs/
│
├── notebooks/
│   ├── 01_Data_Preparation.ipynb
│   ├── 02_Exploratory_Data_Analysis.ipynb
│   ├── 03_Feature_Engineering.ipynb
│   ├── 04_Data_Preprocessing.ipynb
│   ├── 05_Model_Training.ipynb
│   ├── 06_Model_Evaluation.ipynb
│   ├── 07_Model_Deployment_Preparation.ipynb
│   ├── 08_Model_Explainability_SHAP.ipynb
│   ├── 09_Executive_Business_Recommendations.md
│   └── *_Results.md
│
└── README.md
```

---

# 🔄 Machine Learning Workflow

```text
Clean Dataset
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
      │
      ▼
Executive Business Recommendations
```

---

# 📘 Project Notebooks

| Notebook | Description |
|----------|-------------|
| 01 | Data Preparation |
| 02 | Exploratory Data Analysis |
| 03 | Feature Engineering |
| 04 | Data Preprocessing |
| 05 | Model Training |
| 06 | Model Evaluation |
| 07 | Deployment Preparation |
| 08 | Model Explainability (SHAP) |
| 09 | Executive Business Recommendations |

Each notebook is accompanied by a detailed **Results.md** document containing observations, screenshots, business interpretations, and key deliverables.

---

# 🧠 Machine Learning Models

Three supervised learning models were implemented and compared.

- Logistic Regression
- Random Forest
- XGBoost

Each model was trained using the same balanced training dataset generated through SMOTE to ensure a fair comparison.

---

# 📊 Model Evaluation

Model performance was evaluated using multiple technical and business-focused metrics.

- Accuracy
- Precision
- Recall
- F1 Score
- ROC-AUC
- Confusion Matrix
- Precision-Recall Curve

The comparative analysis identified the most suitable model for enterprise deployment.

---

# 🏆 Champion Model

After evaluating all candidate models, **Random Forest** was selected as the production model because it provided the best balance between:

- Fraud Detection Rate
- Precision
- Recall
- F1 Score
- False Positive Reduction
- Operational Stability
- Production Readiness

The deployment package includes:

- Champion Fraud Model
- StandardScaler
- Feature List
- Model Metadata

---

# 🔍 Explainable AI (SHAP)

To improve model transparency, SHAP (SHapley Additive Explanations) was used to explain model predictions.

The explainability module includes:

- Global Feature Importance
- Local Transaction-Level Explanations
- Business Interpretation of Fraud Predictions

These insights help fraud analysts understand why transactions are classified as fraudulent and support enterprise audit and compliance requirements.

---

# 🚀 Deployment Readiness

The trained model has been packaged into deployment-ready artifacts.

Deployment assets include:

- Champion_Fraud_Model.pkl
- Scaler.pkl
- Feature_List.pkl
- model_metadata.json

The solution is designed for integration into a REST API (e.g., FastAPI) to enable real-time fraud scoring within enterprise payment systems.

---

# 💼 Business Value

The machine learning solution enables organizations to:

- Detect fraudulent transactions in real time.
- Reduce financial losses caused by payment fraud.
- Minimize false positive transaction blocks.
- Improve customer payment experience.
- Support fraud analysts with explainable AI.
- Enable scalable fraud detection for enterprise payment platforms.

---

# 🛠 Technologies Used

- Python
- Pandas
- NumPy
- Scikit-learn
- XGBoost
- SHAP
- Matplotlib
- Joblib
- Jupyter Notebook

---

# 📦 Deliverables

This phase delivers:

- Feature Engineered Dataset
- Preprocessed Machine Learning Dataset
- Three Trained Machine Learning Models
- Champion Random Forest Model
- Performance Evaluation Reports
- SHAP Explainability Analysis
- Deployment Artifacts
- Executive Business Recommendations

---

# ✅ Phase Status

**Status:** Completed

The Machine Learning phase successfully transformed engineered payment transaction data into a production-ready fraud detection solution through advanced feature engineering, supervised learning, explainable AI, deployment preparation, and executive business recommendations.

This phase serves as the core intelligence layer of the **Enterprise FinTech Payment Intelligence Platform**, providing an end-to-end workflow from data preparation to deployment-ready fraud detection.