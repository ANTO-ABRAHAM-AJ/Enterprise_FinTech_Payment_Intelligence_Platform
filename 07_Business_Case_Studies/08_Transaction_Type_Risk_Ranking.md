<div align="center">

  # 🔍 Transaction Type Risk Ranking
  ## Business Case Study 08

  ![Case Study](https://img.shields.io/badge/Case_Study-Risk_Ranking-blue?style=for-the-badge)
  ![Focus](https://img.shields.io/badge/Focus-Transaction_Types-success?style=for-the-badge)
  ![Domain](https://img.shields.io/badge/Domain-FinTech%20Payments-orange?style=for-the-badge)
  ![Role](https://img.shields.io/badge/Role-Business%20Analyst-purple?style=for-the-badge)

</div>

<br>

# 📑 Executive Summary

Different transaction types carry different levels of fraud risk. Understanding which transaction types are most frequently associated with fraudulent activity enables payment platforms to prioritize monitoring, strengthen fraud prevention strategies, and allocate operational resources more effectively.

This investigation ranks transaction types based on fraud occurrence to identify the highest-risk payment categories within the PaySim dataset.

---

# ⚠️ Business Problem

The fraud operations team needs to determine which transaction types present the greatest fraud risk.

Identifying high-risk transaction types enables more effective fraud monitoring and supports targeted risk mitigation strategies.

---

# 🏢 Background

Modern payment platforms support multiple transaction types, each with unique operational characteristics and fraud exposure.

Rather than applying identical fraud monitoring across all transaction types, organizations can improve efficiency by prioritizing transaction types associated with higher fraud activity.

---

# 🎯 Business Objective

The objectives of this investigation are to:
- Rank transaction types by fraud occurrence.
- Identify high-risk transaction categories.
- Support targeted fraud monitoring.
- Improve operational resource allocation.

---

# 💻 SQL Investigation

**Reference**

~~~text
06_SQL_Business_Case_Studies.sql

Case Study 8
Transaction Type Risk Ranking
~~~

The SQL analysis calculated:
- Fraud Transactions by Transaction Type
- Fraud Risk Ranking

using SQL Ranking Functions to identify payment types with the highest fraud concentration.

---

# 🤖 Machine Learning Findings

Machine learning models recognize transaction type as an important predictive feature when identifying fraudulent transactions.

Combining transaction type with additional behavioral features improves fraud prediction performance.

---

# 📊 Product Analytics Findings

Relevant KPIs include:
- Fraud Rate
- Fraud Transactions
- Transaction Type Distribution
- Fraud Amount
- High-Risk Transaction Types

These KPIs help product teams continuously monitor fraud exposure across different payment methods.

---

# 🔍 Root Cause Analysis

The investigation indicates that fraud is concentrated within specific transaction types rather than being evenly distributed across all payment methods.

Possible contributing factors include:
- Transaction characteristics.
- Higher transaction values.
- Operational usage patterns.
- Fraudster preference for particular payment methods.

Further investigation should be performed before implementing permanent operational rules.

---

# 💡 Business Recommendation

Recommended actions include:
- Apply enhanced fraud monitoring for high-risk transaction types.
- Introduce adaptive fraud thresholds based on transaction type.
- Prioritize machine learning risk scoring for high-risk payment categories.
- Continuously review fraud rankings as transaction behavior changes.
- Display transaction type risk rankings within executive dashboards.

---

# 💎 Expected Business Impact

Implementing these recommendations can:
- Improve fraud detection accuracy.
- Reduce financial losses.
- Optimize fraud investigation resources.
- Strengthen operational efficiency.
- Support strategic product decisions.

---

# 🔄 Project Alignment

This investigation integrates multiple project phases.

| Project Phase | Contribution |
| :--- | :--- |
| **SQL Analytics** | Transaction type risk analysis |
| **Machine Learning** | Fraud prediction |
| **Product Analytics** | Product recommendations |
| **Power BI** | Transaction type dashboards |

---

# 🚫 Limitations

This investigation is based on the simulated PaySim dataset.

The dataset does not include:
- Merchant information.
- Payment gateway responses.
- Customer verification status.
- Device intelligence.
- Geographic transaction data.

Therefore, transaction type should be considered as one of several fraud indicators rather than the sole determinant of fraud risk.

---

# 🏁 Conclusion

The Transaction Type Risk Ranking investigation demonstrates how ranking payment methods by fraud occurrence helps organizations prioritize fraud prevention efforts. By integrating SQL analytics, machine learning, product analytics, and business intelligence, payment platforms can improve fraud monitoring, allocate resources efficiently, and support data-driven operational decisions.