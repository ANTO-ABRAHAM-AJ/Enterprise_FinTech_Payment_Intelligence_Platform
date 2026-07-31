# Enterprise FinTech Payment Intelligence Platform

## North Star Metric

### What is a North Star Metric?
A North Star Metric (NSM) is the single most important metric that reflects the core value delivered by a product to its users and the business. It aligns product teams around a common objective and guides product strategy, feature development, and business decisions.

For a payment platform, the ideal North Star Metric should represent secure, reliable, and efficient transaction processing.

### Choosing the North Star Metric
Because this project is based on the PaySim dataset, not all standard payment platform metrics can be calculated directly. Metrics such as Transaction Success Rate (TSR) or Authorization Rate require production payment gateway data that is not available in the simulated environment.

To ensure the project remains technically accurate and aligned with the available data, the selected North Star Metric is:

**Fraud Loss Prevention**

### Definition
**Fraud Loss Prevention** represents the platform's ability to identify and prevent fraudulent financial transactions before they result in actual financial loss. 

This metric aligns directly with the primary business objective of the project: improving fraud detection while supporting safer payment operations.

### Why this North Star Metric?
This project focuses heavily on fraud analytics and machine learning for risk detection. Selecting Fraud Loss Prevention as the North Star Metric provides several strategic advantages:
* **Direct Alignment:** Perfectly maps to the features and labels within the PaySim dataset.
* **Use Case Support:** Validates the necessity of the machine learning classification models.
* **Business Value:** Reflects a core priority for real-world FinTech companies—protecting capital.
* **Cross-Functional Unification:** Connects data engineering, SQL analytics, machine learning, and business intelligence into a single, measurable objective.

### Supporting Metrics
The North Star Metric is monitored using a hierarchy of supporting KPIs:
* **Fraud Rate (%)**
* **Total Fraud Transactions**
* **Total Fraud Amount ($)**
* **High-Value Fraud Transactions**
* **Average Transaction Value (ATV)**
* **Total Transaction Volume**
* **Total Transaction Value ($)**

These metrics help explain underlying changes in fraud risk and support operational decision-making at the dashboard level.

### Business Impact
Improving Fraud Loss Prevention helps organizations:
* Reduce direct financial losses.
* Strengthen customer trust and brand reputation.
* Improve operational efficiency by minimizing manual review backlogs.
* Enhance predictive fraud monitoring capabilities.
* Support the scalable growth of digital payment platforms without proportional risk scaling.

### Project Alignment
This North Star Metric acts as the spine of the entire project lifecycle:
* **Phase 2 (Data Analytics):** SQL analytics measures historical fraud patterns and transaction behavior.
* **Phase 4 (Machine Learning):** Classification algorithms predict and intercept potentially fraudulent transactions.
* **Phase 5 (Business Intelligence):** Power BI dashboards monitor aggregate fraud-related KPIs.
* **Phase 6 (Product Analytics):** Business metrics evaluate product decisions and feature trade-offs.
* **Phase 7 (Business Case Studies):** Deep-dive investigations into specific fraud scenarios to recommend preventative actions.

### Limitations
The PaySim dataset is a simulated payment environment and does not include real payment authorization outcomes, chargebacks, customer satisfaction scores, or transaction success statuses. Therefore, the selected North Star Metric deliberately focuses on fraud prevention rather than broader payment platform health and user retention metrics.