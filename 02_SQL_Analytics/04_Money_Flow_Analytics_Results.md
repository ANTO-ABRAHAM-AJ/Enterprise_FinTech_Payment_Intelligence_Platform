<div align="center">

  # 💸 Money Flow Analytics Results

  ![Analytics](https://img.shields.io/badge/Analytics-SQL_Reporting-0078D4?style=for-the-badge)
  ![Phase](https://img.shields.io/badge/Phase-Business_Intelligence-success?style=for-the-badge)

</div>

<br>

## 📖 Overview

This document presents the results of the **Money Flow Analytics** module developed for the **Enterprise FinTech Payment Intelligence Platform**.

The analysis focuses on understanding how money moves throughout the payment ecosystem by examining transaction values, sender-receiver relationships, balance changes, cumulative transaction growth, and payment trends over time.

---

## 🚀 KPI 1: Largest Transactions

**🎯 Business Objective:** Identify the highest-value transactions processed by the payment platform.

**📈 SQL Output:**

![KPI 1 - Largest Transactions](images/moneyflow_kpi_01_largest_transactions.png)

**🧠 Business Interpretation:** The largest transaction in the result is approximately **92.45 million**, with the top transactions predominantly belonging to the **TRANSFER** transaction type.

**💡 Key Insight:** The highest-value transactions represent significant individual payment amounts and are predominantly associated with TRANSFER transactions.

**✅ Business Recommendation:** Implement additional verification and risk controls for exceptionally large transactions before authorization.

---

## 📉 KPI 2: Average Balance Movement

**🎯 Business Objective:** Measure the average balance movement across source accounts.

**📈 SQL Output:**

![KPI 2 - Average Balance Movement](images/moneyflow_kpi_02_average_balance_movement.png)

**🧠 Business Interpretation:** The average balance movement is approximately **-21,230**, indicating that the average `NewBalanceOrig` is higher than the average `OldBalanceOrig` across the transactions in the dataset based on the `OldBalanceOrig - NewBalanceOrig` calculation.

**💡 Key Insight:** Balance movement varies across transactions, with the overall average showing a negative balance-change value based on the `OldBalanceOrig - NewBalanceOrig` calculation.

**✅ Business Recommendation:** Monitor significant balance movements at the transaction and account level to identify unusual payment behavior, data inconsistencies, or potentially suspicious activity.

---

## 📤 KPI 3: Total Money Sent by Source Account

**🎯 Business Objective:** Identify the source accounts transferring the highest monetary value.

**📈 SQL Output:**

![KPI 3 - Total Money Sent by Source Account](images/moneyflow_kpi_03_total_money_sent_by_source_account.png)

**🧠 Business Interpretation:** The leading source account transferred more than **92 million**, with several other accounts also processing substantial payment volumes.

**💡 Key Insight:** The results identify a group of source accounts associated with substantial outgoing transaction values.

**✅ Business Recommendation:** Implement enhanced monitoring and relationship management for high-value customers while continuously evaluating transaction risk.

---

## 📥 KPI 4: Total Money Received by Destination Account

**🎯 Business Objective:** Identify destination accounts receiving the largest payment values.

**📈 SQL Output:**

![KPI 4 - Total Money Received by Destination Account](images/moneyflow_kpi_04_total_money_received_by_destination_account.png)

**🧠 Business Interpretation:** The highest-value destination account received over **357 million**, demonstrating substantial monetary inflows through selected destination accounts within the payment ecosystem.

**💡 Key Insight:** The results identify several destination accounts receiving exceptionally large monetary inflows within the payment ecosystem.

**✅ Business Recommendation:** Continuously monitor high-value receiving accounts to support fraud prevention, compliance, and operational stability.

---

## 📈 KPI 5: Running Transaction Value

**🎯 Business Objective:** Measure cumulative transaction value across the simulation period.

**📈 SQL Output:**

![KPI 5 - Running Transaction Value](images/moneyflow_kpi_05_running_transaction_value.png)

**🧠 Business Interpretation:** The cumulative transaction value increases consistently throughout the simulation, reflecting continuous payment activity across all simulation days.

**💡 Key Insight:** The payment platform demonstrates sustained transaction activity throughout the simulation period without significant interruptions in cumulative transaction value.

**✅ Business Recommendation:** Track cumulative transaction value through executive dashboards to monitor business activity and identify unexpected changes in payment volume.

---

## 📊 KPI 6: Daily Average Transaction Value

**🎯 Business Objective:** Measure the average transaction value for each simulation day.

**📈 SQL Output:**

![KPI 6 - Daily Average Transaction Value](images/moneyflow_kpi_06_daily_average_transaction_value.png)

**🧠 Business Interpretation:** Average transaction values fluctuate across simulation days, indicating changes in customer payment behavior and transaction composition over time.

**💡 Key Insight:** Daily average transaction values exhibit variation across the simulation period while remaining within the observed operating range.

**✅ Business Recommendation:** Monitor significant deviations from historical averages to identify unusual transaction behavior or operational anomalies.

---

## 🕒 KPI 7: Transaction Value by Period of Day

**🎯 Business Objective:** Compare transaction activity across different periods of the day.

**📈 SQL Output:**

![KPI 7 - Transaction Value by Period of Day](images/moneyflow_kpi_07_transaction_value_by_period_of_day.png)

**🧠 Business Interpretation:** The **Afternoon** period records both the highest transaction volume and the highest transaction value, while **Night** records the lowest transaction activity and transaction value.

**💡 Key Insight:** Transaction activity varies considerably across periods of the day, with the highest transaction value occurring during the Afternoon period.

**✅ Business Recommendation:** Allocate payment infrastructure and fraud monitoring resources according to peak transaction periods to improve operational efficiency and maintain payment reliability.

---

## 💰 KPI 8: Largest Balance Reductions

**🎯 Business Objective:** Identify transactions causing the largest reductions in source account balances.

**📈 SQL Output:**

![KPI 8 - Largest Balance Reductions](images/moneyflow_kpi_08_largest_balance_reductions.png)

**🧠 Business Interpretation:** Several transactions reduce source account balances by **10 million**, representing the largest balance decreases observed within the dataset.

**💡 Key Insight:** Large balance reductions correspond to high-value transactions that may require additional monitoring.

**✅ Business Recommendation:** Apply enhanced authentication and risk validation for transactions producing exceptionally large balance changes.

---

## 📉 KPI 9: 3-Day Moving Average Transaction Value

**🎯 Business Objective:** Smooth daily transaction trends using a three-day moving average.

**📈 SQL Output:**

![KPI 9 - 3-Day Moving Average Transaction Value](images/moneyflow_kpi_09_three_day_moving_average_transaction_value.png)

**🧠 Business Interpretation:** The 3-day moving average reduces short-term fluctuations and provides a clearer view of underlying transaction-value trends throughout the simulation.

**💡 Key Insight:** The 3-day moving average provides a smoother representation of daily transaction-value trends by reducing short-term fluctuations.

**✅ Business Recommendation:** Incorporate moving-average metrics into executive dashboards to support trend monitoring, operational planning, and identification of unusual changes in transaction value.

---

## 📝 Module Summary

The **Money Flow Analytics** module provides comprehensive visibility into how funds move across the payment platform by analyzing transaction values, account-level money movement, balance changes, cumulative payment activity, and temporal transaction patterns.

These insights support:

- Financial monitoring
- Operational optimization
- Fraud prevention
- Customer behavior analysis
- Transaction risk assessment
- Executive reporting
- Strategic decision-making

The analysis provides a strong analytical foundation for understanding payment flows and identifying significant transaction and account-level patterns within the **Enterprise FinTech Payment Intelligence Platform**.