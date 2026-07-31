# Business KPIs

---

# Overview

Key Performance Indicators (KPIs) are measurable metrics used to evaluate the health, performance, and efficiency of a payment system. They help business leaders, fraud analysts, risk teams, and operations teams monitor payment activities, identify potential issues, and make data-driven decisions.

The Enterprise FinTech Payment Intelligence Platform tracks a comprehensive set of business and technical KPIs to monitor payment performance and fraud detection effectiveness.

---

# Business KPIs

## 1. Total Transactions

### Definition

The total number of payment transactions processed during a selected period.

### Formula

```text
Total Transactions = COUNT(Transaction ID)
```

### Business Importance

- Measures platform activity
- Indicates business growth
- Helps estimate infrastructure demand
- Supports operational planning

### Dashboard Usage

Displayed as a KPI card on the Executive Dashboard.

---

## 2. Total Transaction Value

### Definition

The total monetary value of all processed transactions.

### Formula

```text
Total Transaction Value = SUM(Transaction Amount)
```

### Business Importance

- Measures business revenue flow
- Tracks payment volume
- Identifies seasonal demand
- Assists financial reporting

### Dashboard Usage

Executive Dashboard KPI.

---

## 3. Average Transaction Value

### Definition

The average amount processed per transaction.

### Formula

```text
Average Transaction Value =
Total Transaction Value / Total Transactions
```

### Business Importance

- Understands customer spending patterns
- Detects unusually large transactions
- Supports pricing and marketing analysis

### Dashboard Usage

Executive Dashboard.

---

## 4. Fraud Transactions

### Definition

The number of transactions identified as fraudulent.

### Formula

```text
Fraud Transactions =
COUNT(Fraudulent Transactions)
```

### Business Importance

- Indicates fraud activity
- Supports investigation workload estimation
- Helps monitor fraud trends

### Dashboard Usage

Fraud Analytics Dashboard.

---

## 5. Fraud Rate

### Definition

Percentage of total transactions that are classified as fraudulent.

### Formula

```text
Fraud Rate (%) =
(Fraud Transactions / Total Transactions) × 100
```

### Business Importance

- Measures payment security
- Tracks fraud trends over time
- Evaluates fraud prevention strategies

### Dashboard Usage

Executive Dashboard and Fraud Analytics Dashboard.

---

## 6. Fraud Loss

### Definition

Total financial value associated with fraudulent transactions.

### Formula

```text
Fraud Loss =
SUM(Fraudulent Transaction Amount)
```

### Business Importance

- Measures financial impact
- Supports executive reporting
- Estimates operational risk

### Dashboard Usage

Fraud Analytics Dashboard.

---

## 7. High-Value Transactions

### Definition

Number of transactions exceeding the predefined high-value threshold.

### Formula

```text
High-Value Transactions =
COUNT(Transaction Amount > Threshold)
```

### Business Importance

- Identifies large financial transfers
- Enables focused monitoring
- Reduces financial exposure

### Dashboard Usage

Executive Dashboard and Fraud Dashboard.

---

## 8. High-Value Fraud Transactions

### Definition

Fraudulent transactions classified as high-value.

### Formula

```text
COUNT(
Fraud = Yes
AND
Amount > Threshold
)
```

### Business Importance

- Identifies critical fraud cases
- Prioritizes investigations
- Supports enterprise risk management

### Dashboard Usage

Fraud Analytics Dashboard.

---

## 9. Fraud by Transaction Type

### Definition

Distribution of fraud across different transaction categories.

### Example Categories

- Cash In
- Cash Out
- Transfer
- Payment
- Debit

### Business Importance

- Identifies vulnerable payment channels
- Supports fraud prevention policies
- Improves payment security

### Dashboard Usage

Fraud Analytics Dashboard.

---

## 10. Fraud by Period of Day

### Definition

Distribution of fraud based on the time at which transactions occur.

Example:

- Morning
- Afternoon
- Evening
- Night

### Business Importance

- Detects fraud timing patterns
- Supports operational staffing
- Improves fraud monitoring

### Dashboard Usage

Fraud Analytics Dashboard.

---

## 11. Daily Transaction Volume

### Definition

Number of transactions processed each day.

### Formula

```text
COUNT(Transaction ID)
GROUP BY Day
```

### Business Importance

- Identifies traffic trends
- Detects unusual activity
- Supports infrastructure planning

### Dashboard Usage

Executive Dashboard.

---

## 12. Daily Transaction Value

### Definition

Total payment amount processed each day.

### Formula

```text
SUM(Transaction Amount)
GROUP BY Day
```

### Business Importance

- Monitors business growth
- Detects seasonal patterns
- Supports financial forecasting

### Dashboard Usage

Executive Dashboard.

---

# Machine Learning KPIs

The platform also tracks model performance using standard machine learning evaluation metrics.

---

## 13. Precision

### Definition

Precision measures how many transactions predicted as fraudulent were actually fraudulent.

### Formula

```text
Precision =
TP / (TP + FP)
```

### Business Importance

Higher precision reduces false fraud alerts and minimizes unnecessary investigations.

---

## 14. Recall

### Definition

Recall measures how many actual fraudulent transactions were successfully detected.

### Formula

```text
Recall =
TP / (TP + FN)
```

### Business Importance

Higher recall ensures fewer fraud cases are missed.

---

## 15. F1 Score

### Definition

The harmonic mean of Precision and Recall.

### Formula

```text
F1 =
2 ×
(Precision × Recall)
/ (Precision + Recall)
```

### Business Importance

Provides balanced evaluation when fraud classes are highly imbalanced.

---

## 16. ROC-AUC

### Definition

Measures the model's ability to distinguish fraudulent and legitimate transactions.

### Business Importance

Higher ROC-AUC indicates better classification performance.

---

# Explainable AI KPIs

The Explainable AI Dashboard presents additional model insights.

---

## Champion Model

Displays the selected production model after evaluation.

Current Champion:

**Random Forest**

---

## Feature Importance

Ranks input variables according to their influence on fraud prediction.

Business users can understand:

- Most influential features
- Driver variables
- Prediction logic

---

## Prediction Explanation

Displays why a transaction was predicted as fraudulent using SHAP values.

This improves:

- Transparency
- Analyst confidence
- Regulatory compliance

---

# KPI Summary Table

| KPI | Business Purpose |
|------|------------------|
| Total Transactions | Measure platform activity |
| Total Transaction Value | Measure payment volume |
| Average Transaction Value | Analyze customer spending |
| Fraud Transactions | Monitor fraud activity |
| Fraud Rate | Measure payment security |
| Fraud Loss | Estimate financial impact |
| High-Value Transactions | Monitor critical payments |
| High-Value Fraud | Prioritize investigations |
| Fraud by Transaction Type | Identify vulnerable channels |
| Fraud by Period | Detect temporal fraud patterns |
| Daily Transaction Volume | Monitor operational activity |
| Daily Transaction Value | Track business growth |
| Precision | Reduce false positives |
| Recall | Detect more fraud cases |
| F1 Score | Balance precision and recall |
| ROC-AUC | Evaluate model discrimination |
| Champion Model | Production model selection |
| Feature Importance | Explain prediction drivers |

---

# Conclusion

The KPIs defined in this project provide a comprehensive view of payment performance, fraud activity, and machine learning effectiveness.

By combining operational metrics with predictive analytics and explainable AI, the Enterprise FinTech Payment Intelligence Platform enables stakeholders to monitor business performance, investigate fraudulent transactions, evaluate model quality, and make informed decisions based on reliable, data-driven insights.