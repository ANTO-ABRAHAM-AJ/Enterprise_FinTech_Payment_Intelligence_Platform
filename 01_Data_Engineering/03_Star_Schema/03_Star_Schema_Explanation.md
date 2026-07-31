# Star Schema Explanation

---

# Objective

The Star Schema organizes enterprise payment transaction data into a centralized Fact table surrounded by multiple Dimension tables.

This dimensional model is designed to optimize analytical workloads by reducing query complexity, improving aggregation performance, and supporting business intelligence reporting.

The implementation follows the Kimball dimensional modeling methodology, which is widely adopted in enterprise data warehouse solutions.

---

# Fact Table

## Fact_PaymentTransactions

The Fact table stores the measurable business events occurring within the payment platform.

Each record represents a single payment transaction and contains both financial measures and foreign key references to the associated dimensions.

### Measures

- Amount
- OldBalanceOrig
- NewBalanceOrig
- OldBalanceDest
- NewBalanceDest

### Foreign Keys

- TimeKey
- TransactionTypeKey
- FraudKey
- SourceAccountKey
- DestinationAccountKey

---

# Fact Table Grain

The grain of the **Fact_PaymentTransactions** table is **one row per payment transaction**.

Each transaction represents a unique financial event processed within the payment platform.

Maintaining this level of granularity enables:

- Accurate KPI calculations
- Reliable fraud analysis
- Transaction-level reporting
- Flexible business intelligence
- Consistent machine learning feature extraction

---

# Dimension Tables

## Dim_Time

Stores time-related information derived from the simulation step.

### Attributes

- Step
- HourOfSimulation
- DayNumber
- PeriodOfDay

Business Usage

- Daily transaction trends
- Time-based filtering
- Fraud trend analysis
- Executive reporting

---

## Dim_TransactionType

Stores payment transaction categories.

Examples include:

- PAYMENT
- CASH_OUT
- CASH_IN
- TRANSFER
- DEBIT

Business Usage

- Transaction segmentation
- Payment channel analysis
- Fraud analysis by transaction type

---

## Dim_Fraud

Stores fraud classifications.

### Attributes

- IsFraud
- IsFlaggedFraud

Business Usage

- Fraud reporting
- Fraud KPIs
- Fraud dashboard filters
- Machine learning evaluation

---

## Dim_SourceAccount

Stores unique sender account identifiers.

Business Usage

- Customer behavior analysis
- Sender profiling
- Fraud investigation

---

## Dim_DestinationAccount

Stores unique receiver account identifiers.

Business Usage

- Recipient analysis
- Network investigation
- Suspicious account monitoring

---

# Relationship Cardinality

Each Dimension table has a **one-to-many (1:N)** relationship with the Fact table.

| Dimension | Relationship |
|------------|--------------|
| Dim_Time | 1 → Many |
| Dim_TransactionType | 1 → Many |
| Dim_Fraud | 1 → Many |
| Dim_SourceAccount | 1 → Many |
| Dim_DestinationAccount | 1 → Many |

This relationship model minimizes redundancy while enabling efficient analytical queries.

---

# Design Decisions

Several design decisions were made while developing the warehouse.

## Kimball Star Schema

A Star Schema was selected because the primary objective of this project is analytical reporting rather than transaction processing.

Compared with a Snowflake Schema, the Star Schema provides:

- Simpler SQL queries
- Faster aggregations
- Better dashboard performance
- Easier maintenance

---

## Surrogate Keys

Each dimension uses surrogate integer keys instead of natural business keys.

Benefits include:

- Faster joins
- Improved referential integrity
- Simplified indexing
- Better scalability

---

## Separate Account Dimensions

The sender and receiver accounts are stored in separate dimensions.

This enables independent analysis of:

- Sender behavior
- Receiver behavior
- Money movement
- Fraud investigation
- Account profiling

---

## Time Dimension

Time-related attributes are separated into a dedicated Time dimension.

This supports:

- Daily reporting
- Time-series analysis
- Trend visualization
- Period-based filtering

---

## Fraud Dimension

Fraud information is stored in a dedicated dimension to simplify:

- Fraud reporting
- KPI calculation
- Dashboard filtering
- Machine learning evaluation

---

# Benefits

The implemented Star Schema provides several business and technical advantages.

Business Benefits

- Faster business reporting
- Better fraud visibility
- Improved operational monitoring
- Consistent KPI calculations
- Simplified dashboard development

Technical Benefits

- Reduced data redundancy
- High query performance
- Optimized SQL joins
- Efficient indexing
- Scalable warehouse design

---

# Integration with the Project

The Star Schema serves as the central analytical data warehouse for the Enterprise FinTech Payment Intelligence Platform.

It directly supports:

- SQL Analytics
- Advanced SQL Reporting
- Power BI Dashboards
- Fraud Analytics
- Business KPI Calculation
- Machine Learning Feature Engineering
- Explainable AI

Every analytical component in this project retrieves data from this dimensional model, ensuring consistency across all phases of the platform.

---

# Conclusion

The Star Schema establishes a scalable, high-performance analytical foundation for the Enterprise FinTech Payment Intelligence Platform.

By organizing payment transactions into a centralized Fact table and descriptive Dimension tables, the warehouse enables efficient SQL analytics, reliable business reporting, interactive Power BI dashboards, and machine learning workflows.

The dimensional model follows enterprise best practices and provides a robust architecture for payment intelligence and fraud detection solutions.