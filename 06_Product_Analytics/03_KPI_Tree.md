# KPI Tree

## Overview

A Key Performance Indicator (KPI) Tree is a hierarchical framework that breaks down a high-level business objective into measurable operational metrics. It helps organizations understand how business performance is influenced by different analytical and operational factors.

For the Enterprise FinTech Payment Intelligence Platform, the KPI Tree is centered around the project's North Star Metric: **Fraud Loss Prevention**.

---

# Enterprise KPI Tree

```
North Star Metric
Fraud Loss Prevention
│
├── Fraud Detection Performance
│   ├── Fraud Rate
│   ├── Fraud Transactions
│   ├── Fraud Amount
│   └── High-Value Fraud Transactions
│
├── Payment Activity
│   ├── Total Transactions
│   ├── Total Transaction Value
│   ├── Average Transaction Value
│   └── Transaction Type Distribution
│
├── Time-Based Monitoring
│   ├── Daily Transaction Trends
│   ├── Hourly Transaction Trends
│   ├── Peak Transaction Hours
│   └── Period of Day Analysis
│
└── Account Risk Monitoring
    ├── High-Value Accounts
    ├── Transaction Frequency
    ├── Top Source Accounts
    └── Top Destination Accounts
```

---

# KPI Categories

## 1. Fraud Detection Performance

These KPIs evaluate the platform's ability to identify fraudulent activities and estimate the financial impact of fraud.

### Metrics

- Fraud Rate
- Fraud Transactions
- Fraud Amount
- High-Value Fraud Transactions

### Business Purpose

These metrics help identify fraud patterns, monitor financial risk, and evaluate the effectiveness of fraud detection strategies.

---

## 2. Payment Activity

These KPIs measure the overall payment volume and transaction behavior across the platform.

### Metrics

- Total Transactions
- Total Transaction Value
- Average Transaction Value
- Transaction Type Distribution

### Business Purpose

These metrics provide insights into transaction growth, customer payment behavior, and platform usage.

---

## 3. Time-Based Monitoring

These KPIs analyze how transaction activity changes over time.

### Metrics

- Daily Transaction Trends
- Hourly Transaction Trends
- Peak Transaction Hours
- Period of Day Analysis

### Business Purpose

These metrics help identify operational peaks, transaction patterns, and periods requiring enhanced fraud monitoring.

---

## 4. Account Risk Monitoring

These KPIs identify accounts that require additional attention due to unusually high transaction values or transaction frequency.

### Metrics

- High-Value Accounts
- Transaction Frequency
- Top Source Accounts
- Top Destination Accounts

### Business Purpose

These metrics support risk monitoring, anomaly detection, and investigation of potentially suspicious accounts.

---

# Business Value

The KPI Tree provides a structured framework for monitoring payment platform performance and fraud risk.

It enables stakeholders to:

- Monitor operational performance.
- Identify emerging fraud patterns.
- Support data-driven product decisions.
- Improve fraud monitoring capabilities.
- Align business objectives with measurable KPIs.

---

# Project Alignment

This KPI framework is implemented throughout the project.

| Project Phase | Contribution |
|---------------|-------------|
| Phase 2 – SQL Analytics | Calculates business KPIs |
| Phase 4 – Machine Learning | Predicts fraudulent transactions |
| Phase 5 – Power BI | Visualizes KPI performance |
| Phase 6 – Product Analytics | Supports product decision-making |
| Phase 7 – Business Case Studies | Uses KPIs for business investigations |

---

# Limitations

The KPI Tree is designed using only metrics supported by the PaySim dataset.

Metrics such as Transaction Success Rate (TSR), Authorization Rate, Chargeback Rate, Refund Rate, and Customer Retention require production payment system data and are therefore outside the scope of this project.

---

# Conclusion

The KPI Tree connects the project's North Star Metric with measurable operational KPIs. It provides a structured approach for monitoring payment performance, fraud risk, and business outcomes while supporting informed product and business decisions.