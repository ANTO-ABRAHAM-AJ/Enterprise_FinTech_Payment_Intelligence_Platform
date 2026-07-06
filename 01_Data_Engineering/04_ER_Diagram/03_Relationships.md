# Table Relationships

## Overview

The Enterprise FinTech Payment Intelligence Platform follows a dimensional data warehouse design in which the central Fact Table is connected to multiple Dimension Tables through primary key and foreign key relationships.

These relationships ensure data integrity while enabling efficient analytical queries and business reporting.

---

# Relationship Overview

The data warehouse contains one Fact Table and three Dimension Tables.

```text
                    Dim_Time
                       │
                       │
                       │
Dim_TransactionType ───┼──── Fact_PaymentTransactions ──── Dim_Fraud
```

The Fact Table references each Dimension Table using foreign keys.

---

# Relationship 1

## Dim_Time → Fact_PaymentTransactions

### Relationship Type

**One-to-Many (1:M)**

### Primary Key

TimeKey

### Foreign Key

TimeKey

### Description

Each record in the **Dim_Time** table represents a unique transaction time step.

A single time step may be associated with thousands or even millions of payment transactions.

This relationship enables time-based analysis such as:

- Transaction trends
- Peak transaction periods
- Fraud trends over time
- Executive reporting

---

# Relationship 2

## Dim_TransactionType → Fact_PaymentTransactions

### Relationship Type

**One-to-Many (1:M)**

### Primary Key

TransactionTypeKey

### Foreign Key

TransactionTypeKey

### Description

Each payment transaction belongs to one transaction type.

Multiple transactions can share the same transaction type.

Examples include:

- PAYMENT
- TRANSFER
- CASH_IN
- CASH_OUT
- DEBIT

This relationship enables:

- Payment method analysis
- Transaction segmentation
- Payment type KPIs
- Business reporting

---

# Relationship 3

## Dim_Fraud → Fact_PaymentTransactions

### Relationship Type

**One-to-Many (1:M)**

### Primary Key

FraudKey

### Foreign Key

FraudKey

### Description

Each payment transaction is assigned one fraud classification.

Multiple transactions may share the same fraud category.

The Fraud Dimension enables:

- Fraud detection
- Fraud trend analysis
- Fraud dashboards
- Machine learning model development

---

# Referential Integrity

The database enforces referential integrity using foreign key constraints.

This ensures that every foreign key value stored in the Fact Table references an existing record in its corresponding Dimension Table.

Benefits include:

- Prevents orphan records
- Maintains data consistency
- Improves data quality
- Supports reliable analytics

---

# Relationship Summary

| Parent Table | Child Table | Relationship | Foreign Key |
|---------------|-------------|--------------|-------------|
| Dim_Time | Fact_PaymentTransactions | One-to-Many | TimeKey |
| Dim_TransactionType | Fact_PaymentTransactions | One-to-Many | TransactionTypeKey |
| Dim_Fraud | Fact_PaymentTransactions | One-to-Many | FraudKey |

---

# Why One-to-Many Relationships?

One-to-Many relationships reduce data redundancy by storing descriptive information only once in the Dimension Tables while allowing the Fact Table to reference those values repeatedly.

This approach improves:

- Query performance
- Storage efficiency
- Data consistency
- Scalability
- Business reporting

---

# Conclusion

The relationships defined in the Enterprise FinTech Payment Intelligence Platform establish a clean and scalable dimensional model.

By connecting the Fact Table with multiple Dimension Tables through primary and foreign keys, the data warehouse supports efficient SQL analytics, fraud detection, business intelligence, and machine learning while maintaining data integrity.