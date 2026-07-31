# Running Fraud Amount Analysis

## Executive Summary

Monitoring fraud losses over time enables organizations to identify emerging trends, evaluate the effectiveness of fraud prevention strategies, and estimate cumulative financial exposure.

This investigation analyzes the cumulative fraud amount throughout the observation period to understand how financial losses evolve over time.

---

# Business Problem

The fraud management team needs to monitor how financial losses accumulate over time due to fraudulent transactions.

Understanding cumulative fraud trends supports strategic planning and helps prioritize fraud prevention initiatives.

---

# Background

Individual fraudulent transactions provide valuable operational insights, but cumulative fraud losses offer a broader business perspective.

Tracking the running fraud amount enables organizations to evaluate long-term fraud exposure and identify periods requiring additional operational attention.

---

# Business Objective

The objectives of this investigation are to:

- Measure daily fraud losses.
- Calculate cumulative fraud losses over time.
- Identify periods of accelerated fraud growth.
- Support executive fraud monitoring.

---

# SQL Investigation

**Reference**

```
29_SQL_Business_Case_Studies.sql

Case Study 7
Running Fraud Amount
```

The SQL analysis calculated:

- Daily Fraud Amount
- Running (Cumulative) Fraud Amount

using SQL Window Functions to monitor fraud growth across the observation period.

---

# Machine Learning Findings

Machine learning predictions help identify potentially fraudulent transactions before cumulative losses continue to increase.

Combining predictive models with cumulative fraud monitoring strengthens fraud prevention strategies.

---

# Product Analytics Findings

Relevant KPIs include:

- Fraud Amount
- Running Fraud Amount
- Fraud Rate
- High-Value Fraud Transactions

These metrics help product teams monitor fraud exposure and evaluate fraud prevention performance.

---

# Root Cause Analysis

The investigation demonstrates that fraud losses accumulate progressively over time.

Periods with increasing cumulative fraud may indicate:

- Increased fraud activity.
- Operational monitoring gaps.
- High-value fraudulent transactions.
- Emerging fraud patterns.

Continuous monitoring is essential to minimize long-term financial exposure.

---

# Business Recommendation

Recommended actions include:

- Monitor cumulative fraud losses through executive dashboards.
- Configure alerts for rapid increases in fraud losses.
- Combine cumulative fraud monitoring with machine learning predictions.
- Review fraud trends regularly to identify emerging risks.
- Prioritize investigations during periods of accelerated fraud growth.

---

# Expected Business Impact

Implementing these recommendations can:

- Reduce long-term financial losses.
- Improve executive visibility.
- Support proactive fraud prevention.
- Strengthen operational planning.
- Improve business decision-making.

---

# Project Alignment

This investigation integrates multiple project phases.

| Phase | Contribution |
|--------|--------------|
| SQL Analytics | Running fraud analysis |
| Machine Learning | Fraud prediction |
| Product Analytics | Business recommendations |
| Power BI | Fraud trend dashboards |

---

# Limitations

This investigation is based on the simulated PaySim dataset.

The dataset does not include:

- Actual financial recovery.
- Chargeback processing.
- Insurance claims.
- Customer reimbursement information.
- Fraud investigation timelines.

Therefore, cumulative fraud represents estimated financial exposure rather than confirmed business losses.

---

# Conclusion

The Running Fraud Amount Analysis demonstrates how cumulative fraud monitoring supports strategic fraud management. By integrating SQL analytics, machine learning, and business intelligence, organizations can better understand fraud trends, reduce financial exposure, and improve long-term operational planning.