# Business KPIs

# Overview

Key Performance Indicators (KPIs) are measurable business metrics used to evaluate the health, reliability, efficiency, and financial performance of digital payment platforms.

These KPIs enable business teams to monitor operational performance, identify bottlenecks, detect fraud, improve customer experience, and support strategic decision-making.

The following KPIs will be analyzed throughout this project.

---

# 1. Transaction Success Rate (TSR)

## Category

Operational KPI

## Definition

The percentage of payment transactions completed successfully.

## Formula

```text
TSR = (Successful Transactions / Total Transactions) × 100
```

## Business Importance

- Measures payment reliability
- Indicates overall platform health
- Reflects customer payment experience
- Primary KPI for payment operations

---

# 2. Transaction Failure Rate (TFR)

## Category

Operational KPI

## Definition

The percentage of payment transactions that fail.

## Formula

```text
TFR = (Failed Transactions / Total Transactions) × 100
```

## Business Importance

- Identifies operational issues
- Detects payment bottlenecks
- Measures customer payment friction

---

# 3. Authorization Rate

## Category

Operational KPI

## Definition

The percentage of authorization requests approved by issuing banks.

## Formula

```text
Authorization Rate =
(Authorized Transactions / Authorization Requests) × 100
```

## Business Importance

- Measures bank approval performance
- Detects authorization failures
- Improves payment approval rates

---

# 4. Settlement Rate

## Category

Operational KPI

## Definition

The percentage of authorized transactions successfully settled.

## Formula

```text
Settlement Rate =
(Settled Transactions / Authorized Transactions) × 100
```

## Business Importance

- Tracks payment completion
- Measures settlement efficiency
- Identifies settlement issues

---

# 5. Gateway Success Rate

## Category

Operational KPI

## Definition

Measures successful transactions processed by each payment gateway.

## Formula

```text
Gateway Success Rate =
(Successful Gateway Transactions / Total Gateway Transactions) × 100
```

## Business Importance

- Compare gateway performance
- Detect gateway outages
- Optimize payment routing

---

# 6. Processor Success Rate

## Category

Operational KPI

## Definition

Measures successful transactions processed by each payment processor.

## Formula

```text
Processor Success Rate =
(Successful Processor Transactions / Total Processor Transactions) × 100
```

## Business Importance

- Detect processor failures
- Measure processor efficiency
- Improve routing decisions

---

# 7. Average Processing Time

## Category

Performance KPI

## Definition

Average time required to complete a payment transaction.

## Formula

```text
Average Processing Time =
Total Processing Time / Total Transactions
```

## Business Importance

- Measures platform responsiveness
- Detects latency issues
- Improves customer experience

---

# 8. Refund Rate

## Category

Customer KPI

## Definition

Percentage of completed transactions that result in refunds.

## Formula

```text
Refund Rate =
(Refunded Transactions / Total Transactions) × 100
```

## Business Importance

- Measures refund frequency
- Indicates product or payment issues
- Tracks customer satisfaction

---

# 9. Average Refund Time

## Category

Customer KPI

## Definition

Average time required to complete customer refunds.

## Formula

```text
Average Refund Time =
Total Refund Processing Time / Total Refunds
```

## Business Importance

- Measures refund efficiency
- Improves customer experience
- Reduces customer complaints

---

# 10. Chargeback Rate

## Category

Risk KPI

## Definition

Percentage of completed transactions disputed by customers.

## Formula

```text
Chargeback Rate =
(Chargebacks / Total Transactions) × 100
```

## Business Importance

- Measures payment disputes
- Indicates fraud exposure
- Increases operational costs

---

# 11. Fraud Rate

## Category

Risk KPI

## Definition

Percentage of transactions identified as fraudulent.

## Formula

```text
Fraud Rate =
(Fraudulent Transactions / Total Transactions) × 100
```

## Business Importance

- Measures fraud exposure
- Supports fraud prevention
- Tracks platform security

---

# 12. False Positive Rate

## Category

Machine Learning KPI

## Definition

Percentage of genuine transactions incorrectly classified as fraudulent.

## Formula

```text
False Positive Rate =
(False Positives / Actual Genuine Transactions) × 100
```

## Business Importance

- Protects genuine customers
- Reduces unnecessary payment declines
- Improves customer experience

---

# 13. False Negative Rate

## Category

Machine Learning KPI

## Definition

Percentage of fraudulent transactions incorrectly classified as genuine.

## Formula

```text
False Negative Rate =
(False Negatives / Actual Fraudulent Transactions) × 100
```

## Business Importance

- Measures fraud detection effectiveness
- Reduces fraud-related financial losses
- Improves model performance

---

# 14. Customer Payment Success Rate

## Category

Customer KPI

## Definition

Percentage of customers whose payment succeeds on the first attempt.

## Formula

```text
Customer Payment Success Rate =
(Customers with Successful First Payment / Total Customers) × 100
```

## Business Importance

- Improves customer experience
- Reduces payment retries
- Increases customer trust

---

# 15. Revenue Leakage

## Category

Financial KPI

## Definition

Estimated revenue lost due to payment failures, fraud, refunds, chargebacks, and operational inefficiencies.

## Business Importance

- Quantifies financial impact
- Supports investment decisions
- Prioritizes operational improvements

---

# KPI Summary

| KPI | Category | Business Purpose |
|------|----------|------------------|
| Transaction Success Rate | Operational | Measure payment reliability |
| Transaction Failure Rate | Operational | Identify payment failures |
| Authorization Rate | Operational | Measure bank approval performance |
| Settlement Rate | Operational | Monitor settlement efficiency |
| Gateway Success Rate | Operational | Compare gateway performance |
| Processor Success Rate | Operational | Monitor processor health |
| Average Processing Time | Performance | Measure transaction latency |
| Refund Rate | Customer | Track refund performance |
| Average Refund Time | Customer | Improve refund experience |
| Chargeback Rate | Risk | Monitor payment disputes |
| Fraud Rate | Risk | Detect fraud trends |
| False Positive Rate | Machine Learning | Protect genuine customers |
| False Negative Rate | Machine Learning | Improve fraud detection quality |
| Customer Payment Success Rate | Customer | Improve payment experience |
| Revenue Leakage | Financial | Measure business impact |

---

# KPI Framework

The KPIs defined in this document form the foundation of the analytics platform. These metrics will be calculated using SQL Server, visualized in Power BI dashboards, analyzed through Root Cause Analysis (RCA), and used to generate business recommendations throughout the project.

Together, they provide a comprehensive view of payment reliability, operational efficiency, fraud risk, customer experience, and overall business performance.