<div align="center">

  # 🔍 Top Fraud Contributors Investigation
  ## Business Case Study 02

  ![Case Study](https://img.shields.io/badge/Case_Study-Fraud_Contributors-blue?style=for-the-badge)
  ![Focus](https://img.shields.io/badge/Focus-Account_Risk_Analysis-success?style=for-the-badge)
  ![Domain](https://img.shields.io/badge/Domain-FinTech%20Payments-orange?style=for-the-badge)
  ![Role](https://img.shields.io/badge/Role-Business%20Analyst-purple?style=for-the-badge)

</div>

<br>

# 📑 Executive Summary

Fraudulent activities are often concentrated among a relatively small number of accounts. Identifying these high-risk accounts enables organizations to prioritize investigations, strengthen fraud monitoring, and reduce financial exposure.

This investigation identifies the source accounts responsible for the highest fraudulent transaction values within the PaySim dataset.

---

# ⚠️ Business Problem

The fraud investigation team needs to determine which source accounts contribute the largest financial losses through fraudulent transactions.

Identifying these accounts enables faster investigations and supports proactive fraud prevention.

---

# 🏢 Background

Financial fraud is rarely distributed evenly across all customer accounts. Certain accounts may repeatedly participate in fraudulent activities or generate unusually large fraudulent transaction values.

Analyzing these accounts helps organizations allocate fraud investigation resources more effectively.

---

# 🎯 Business Objective

The objectives of this investigation are to:
- Identify the top fraud-contributing source accounts.
- Measure the total fraud amount associated with each account.
- Rank high-risk accounts based on financial impact.
- Recommend actions for enhanced account monitoring.

---

# 💻 SQL Investigation

**Reference**

~~~text
06_SQL_Business_Case_Studies.sql

Case Study 2
Top Fraud Contributors
~~~

The SQL analysis calculated:
- Total Fraud Transactions
- Total Fraud Amount
- Fraud Ranking

The investigation ranked source accounts according to the total fraudulent transaction value.

---

# 🤖 Machine Learning Findings

The fraud prediction model assigns higher fraud probabilities to suspicious transaction patterns.

Combining account rankings with machine learning predictions enables fraud analysts to prioritize investigations more efficiently.

---

# 📊 Product Analytics Findings

Relevant KPIs include:
- Fraud Transactions
- Fraud Amount
- High-Value Fraud Transactions
- High-Risk Accounts

These KPIs help monitor accounts contributing the highest fraud exposure.

---

# 🔍 Root Cause Analysis

The investigation indicates that a small number of accounts contribute disproportionately to total fraud losses.

Possible contributing factors include:
- Repeated fraudulent activity.
- High-value transaction behavior.
- Abnormal transaction frequency.
- Elevated fraud risk patterns.

---

# 💡 Business Recommendation

Recommended actions include:
- Continuously monitor high-risk accounts.
- Introduce additional verification for high-risk accounts.
- Automatically flag repeated suspicious activity.
- Prioritize manual investigations for top-ranked accounts.
- Monitor account activity using executive dashboards.

---

# 💎 Expected Business Impact

Implementing these recommendations can:
- Reduce fraud-related financial losses.
- Improve investigation efficiency.
- Enhance fraud monitoring.
- Strengthen account-level risk management.
- Improve operational decision-making.

---

# 🔄 Project Alignment

This investigation integrates multiple project components.

| Phase | Contribution |
| :--- | :--- |
| **SQL Analytics** | Account ranking and fraud analysis |
| **Machine Learning** | Fraud prediction |
| **Product Analytics** | Business recommendations |
| **Power BI** | High-risk account dashboards |

---

# 🚫 Limitations

This investigation is based on the simulated PaySim dataset.

The dataset does not include:
- Customer identity verification.
- Account ownership information.
- Geographic location.
- Device fingerprints.
- Historical customer profiles.

Therefore, the analysis focuses only on transactional behavior.

---

# 🏁 Conclusion

The Top Fraud Contributors Investigation demonstrates how account-level analytics can identify the most significant contributors to fraudulent activity. By combining SQL analytics, machine learning, and business recommendations, organizations can improve fraud prevention and prioritize investigative resources more effectively.