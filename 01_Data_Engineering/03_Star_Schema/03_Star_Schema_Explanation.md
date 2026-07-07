# Star Schema Explanation

## Objective

The Star Schema organizes transactional payment data into one central Fact table surrounded by multiple Dimension tables.

This structure minimizes redundancy and improves analytical query performance.

---

## Fact Table

Fact_PaymentTransactions stores all measurable business events.

Measures include:

- Amount
- OldBalanceOrig
- NewBalanceOrig
- OldBalanceDest
- NewBalanceDest

Foreign Keys:

- TimeKey
- TransactionTypeKey
- FraudKey
- SourceAccountKey
- DestinationAccountKey

---

## Dimension Tables

### Dim_Time

Stores simulation time information.

Attributes

- Step
- HourOfSimulation
- DayNumber
- PeriodOfDay

---

### Dim_TransactionType

Stores transaction categories.

Examples

- PAYMENT
- CASH_OUT
- TRANSFER
- DEBIT
- CASH_IN

---

### Dim_Fraud

Stores fraud classifications.

Fields

- IsFraud
- IsFlaggedFraud

---

### Dim_SourceAccount

Stores unique sender accounts.

---

### Dim_DestinationAccount

Stores unique receiver accounts.

---

## Benefits

- Reduced redundancy
- Faster aggregations
- Better Power BI performance
- Easier business reporting
- Supports enterprise analytical workloads