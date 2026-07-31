# Experiment Design

## Overview

Experiment design is a structured approach used to evaluate whether a new product feature or business initiative improves key performance metrics. Product teams commonly use controlled experiments, such as A/B testing, to validate product decisions before full-scale deployment.

Since the PaySim dataset contains historical simulated payment transactions, this project presents a conceptual experiment design rather than a real production A/B test.

---

# Business Problem

High-value transactions contribute significantly to financial risk when fraudulent activity occurs.

Current transaction processing treats all transactions using the same verification process, regardless of transaction amount or fraud risk.

The business objective is to evaluate whether introducing additional verification for high-risk transactions can reduce fraud while maintaining operational efficiency.

---

# Proposed Feature

Introduce **Risk-Based Transaction Verification**.

Instead of verifying every transaction equally:

- Low-Risk Transactions
  - Standard Processing

- Medium-Risk Transactions
  - Additional Monitoring

- High-Risk Transactions
  - Additional Identity Verification or Manual Review

---

# Experiment Objective

Determine whether risk-based verification reduces fraudulent transactions while minimizing unnecessary customer friction.

---

# Hypothesis

### Null Hypothesis (H₀)

Risk-based transaction verification does not significantly reduce fraudulent transactions compared to the existing process.

### Alternative Hypothesis (H₁)

Risk-based transaction verification reduces fraudulent transactions and improves fraud prevention performance.

---

# Experiment Groups

## Control Group

Current transaction verification process.

No additional fraud verification.

---

## Treatment Group

Risk-based transaction verification enabled.

High-risk transactions receive additional verification before approval.

---

# Success Metrics

The experiment will be evaluated using the following metrics:

- Fraud Rate
- Fraud Transactions
- Fraud Amount
- High-Value Fraud Transactions
- Total Transaction Value at Risk

---

# Expected Outcomes

If successful, the experiment should:

- Reduce fraudulent transactions.
- Reduce financial losses.
- Improve fraud detection.
- Strengthen customer trust.
- Improve operational decision-making.

---

# Business Risks

Potential challenges include:

- Increased verification time.
- Additional operational workload.
- False positives affecting legitimate customers.
- Increased customer friction for high-risk transactions.

These risks should be monitored before full deployment.

---

# Project Alignment

This experiment supports multiple phases of the project.

| Project Phase | Contribution |
|---------------|-------------|
| SQL Analytics | Fraud metrics |
| Machine Learning | Fraud prediction |
| Power BI | Performance monitoring |
| Product Analytics | Product decision-making |
| Business Case Studies | Business validation |

---

# Limitations

This experiment is conceptual.

The PaySim dataset does not contain:

- Customer feedback
- Transaction approval outcomes
- User behavior
- Production payment gateway responses

Therefore, no real experimental results are calculated within this project.

---

# Conclusion

The proposed experiment demonstrates how product teams can evaluate new fraud prevention strategies before production deployment. Although the experiment is conceptual, it follows industry-standard experimentation principles and aligns with the project's fraud detection objectives.