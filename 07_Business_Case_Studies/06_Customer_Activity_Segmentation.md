# Customer Activity Segmentation

## Executive Summary

Customer activity segmentation categorizes accounts based on transaction frequency to better understand payment behavior and operational workload. Segmenting accounts enables organizations to prioritize monitoring efforts, allocate resources efficiently, and identify unusual activity patterns.

This investigation classifies source accounts into different activity levels using transaction frequency observed within the PaySim dataset.

---

# Business Problem

Payment platforms process transactions from accounts with varying levels of activity.

The fraud operations team needs to identify highly active accounts that may require additional monitoring while understanding the distribution of customer activity across the platform.

---

# Background

Not every customer interacts with the payment platform in the same way.

Some accounts process only a few transactions, while others perform hundreds of transactions over the same period.

Understanding these activity patterns supports fraud monitoring, operational planning, and business decision-making.

---

# Business Objective

The objectives of this investigation are to:

- Segment accounts based on transaction frequency.
- Identify high-activity accounts.
- Understand customer activity distribution.
- Support operational planning and fraud monitoring.

---

# SQL Investigation

**Reference**

```
29_SQL_Business_Case_Studies.sql

Case Study 6
Customer Activity Segmentation
```

The SQL analysis classified accounts into:

- High Activity
- Medium Activity
- Low Activity

based on the total number of transactions performed by each source account.

---

# Machine Learning Findings

Customer activity level can be incorporated as an additional feature for fraud prediction models.

When combined with transaction amount and fraud probability, activity segmentation helps improve risk assessment.

---

# Product Analytics Findings

Relevant KPIs include:

- Transaction Frequency
- Total Transactions
- High Activity Accounts
- Customer Activity Distribution

These KPIs help product teams understand platform usage and operational workload.

---

# Root Cause Analysis

The investigation shows that customer activity is unevenly distributed across the platform.

Possible contributing factors include:

- Different customer usage patterns.
- Business versus personal payment behavior.
- Automated payment activity.
- High-volume transaction processing.

High activity alone should not be interpreted as suspicious behavior but should be monitored alongside other risk indicators.

---

# Business Recommendation

Recommended actions include:

- Continuously monitor high-activity accounts.
- Combine activity segmentation with fraud risk scores.
- Prioritize monitoring for high-activity accounts processing unusually large transactions.
- Review activity distribution periodically to detect emerging behavioral changes.
- Display customer activity segments within executive dashboards.

---

# Expected Business Impact

Implementing these recommendations can:

- Improve operational visibility.
- Support fraud prevention.
- Enhance resource allocation.
- Strengthen customer risk monitoring.
- Improve analytical decision-making.

---

# Project Alignment

This investigation integrates multiple project phases.

| Phase | Contribution |
|--------|--------------|
| SQL Analytics | Customer activity segmentation |
| Machine Learning | Risk prediction |
| Product Analytics | Business recommendations |
| Power BI | Activity distribution dashboards |

---

# Limitations

This investigation is based on the simulated PaySim dataset.

The dataset does not include:

- Customer demographics.
- Customer lifecycle information.
- Account type.
- Business registration data.
- Customer engagement metrics.

Therefore, segmentation is based solely on transaction frequency.

---

# Conclusion

The Customer Activity Segmentation investigation demonstrates how transaction frequency can be used to classify accounts into meaningful operational groups. Integrating SQL analytics, machine learning, and product analytics enables organizations to better understand platform usage, optimize monitoring strategies, and support data-driven business decisions.