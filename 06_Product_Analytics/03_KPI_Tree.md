# KPI Tree

## Enterprise FinTech Payment Intelligence Platform

---

# Overview

A Key Performance Indicator (KPI) Tree is a hierarchical framework that connects an organization's strategic objective with measurable operational metrics. Rather than monitoring isolated KPIs, a KPI Tree demonstrates how day-to-day business performance contributes to long-term product success.

For the Enterprise FinTech Payment Intelligence Platform, every business metric ultimately contributes to the project's North Star Metric:

## **Fraud Loss Prevention**

---

# Enterprise KPI Tree

```
North Star Metric
Fraud Loss Prevention
│
├── Fraud Performance
│   ├── Fraud Rate
│   ├── Fraud Transactions
│   ├── Fraud Amount
│   └── High-Value Fraud Transactions
│
├── Payment Performance
│   ├── Total Transactions
│   ├── Total Transaction Value
│   ├── Average Transaction Value
│   └── Transaction Type Distribution
│
├── Operational Performance
│   ├── Daily Transaction Volume
│   ├── Hourly Transaction Activity
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

## 1. Fraud Performance

### Objective

Measure how effectively the platform detects and prevents fraudulent financial activity.

### KPIs

- Fraud Rate
- Fraud Transactions
- Fraud Amount
- High-Value Fraud Transactions

### Business Impact

These metrics directly measure fraud exposure and evaluate whether fraud prevention initiatives are successfully reducing financial risk.

---

## 2. Payment Performance

### Objective

Monitor the overall health, scale, and activity of the payment platform.

### KPIs

- Total Transactions
- Total Transaction Value
- Average Transaction Value
- Transaction Type Distribution

### Business Impact

These KPIs help organizations understand platform usage, payment behavior, and transaction growth.

---

## 3. Operational Performance

### Objective

Analyze transaction activity across different time periods to improve operational planning and fraud monitoring.

### KPIs

- Daily Transaction Volume
- Hourly Transaction Activity
- Peak Transaction Hours
- Period of Day Analysis

### Business Impact

Operational metrics help identify traffic spikes, transaction patterns, and periods that require additional fraud monitoring resources.

---

## 4. Account Risk Monitoring

### Objective

Identify accounts exhibiting unusual transaction behavior that may indicate elevated fraud risk.

### KPIs

- High-Value Accounts
- Transaction Frequency
- Top Source Accounts
- Top Destination Accounts

### Business Impact

Supports proactive fraud investigation by highlighting accounts that require additional monitoring.

---

# KPI Relationship

Each KPI category contributes toward improving the project's North Star Metric.

```
Operational Activity
        │
        ▼
Business KPIs
        │
        ▼
Fraud Monitoring
        │
        ▼
Fraud Loss Prevention
```

This hierarchy enables business stakeholders to understand how operational performance influences fraud prevention outcomes.

---

# Business Value

The KPI Tree enables organizations to:

- Align operational metrics with strategic objectives.
- Monitor fraud exposure using measurable indicators.
- Improve executive visibility into payment platform performance.
- Support data-driven product and business decisions.
- Prioritize operational improvements based on KPI performance.

---

# Project Alignment

| Project Phase | Contribution |
|---------------|--------------|
| Business Context | Defines business objectives |
| Data Engineering | Creates the analytical foundation |
| SQL Analytics | Calculates enterprise KPIs |
| Advanced SQL | Builds reusable reporting objects |
| Machine Learning | Predicts fraudulent transactions |
| Business Intelligence | Visualizes KPI performance |
| Product Analytics | Converts KPIs into product decisions |
| Business Case Studies | Applies KPIs to real business scenarios |

---

# Limitations

The KPI Tree is built entirely using metrics supported by the PaySim dataset.

The following enterprise payment metrics are intentionally excluded because they require production payment infrastructure:

- Transaction Success Rate (TSR)
- Authorization Rate
- Payment Failure Rate
- Chargeback Rate
- Refund Rate
- Customer Retention
- Customer Lifetime Value (CLV)

---

# Conclusion

The KPI Tree provides a structured framework that connects operational activities with strategic business objectives. By organizing payment, fraud, operational, and account risk metrics around the North Star Metric, the platform enables business stakeholders to monitor performance, identify emerging risks, and support informed product decisions.