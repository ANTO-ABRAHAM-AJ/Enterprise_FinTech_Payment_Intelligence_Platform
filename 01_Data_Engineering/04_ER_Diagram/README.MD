# Enterprise Relationship (ER) Diagram

## Overview

The Entity Relationship (ER) Diagram illustrates the logical database design of the **Enterprise FinTech Payment Intelligence Platform**. It defines the relationships between the central fact table and supporting dimension tables, ensuring referential integrity and efficient analytical querying.

The database follows a **Kimball Star Schema** design, where a single fact table stores transaction measures and multiple dimension tables provide descriptive business context.

---

## Database Architecture

The ER model consists of:

- **1 Fact Table**
- **5 Dimension Tables**
- **5 Foreign Key Relationships**

The fact table references each dimension table through surrogate keys, creating one-to-many relationships that support scalable analytical workloads.

---

## Tables Included

### Fact Table

- Fact_PaymentTransactions

### Dimension Tables

- Dim_Time
- Dim_TransactionType
- Dim_Fraud
- Dim_SourceAccount
- Dim_DestinationAccount

---

## Relationship Summary

| Parent Table | Child Table | Relationship |
|--------------|-------------|--------------|
| Dim_Time | Fact_PaymentTransactions | One-to-Many |
| Dim_TransactionType | Fact_PaymentTransactions | One-to-Many |
| Dim_Fraud | Fact_PaymentTransactions | One-to-Many |
| Dim_SourceAccount | Fact_PaymentTransactions | One-to-Many |
| Dim_DestinationAccount | Fact_PaymentTransactions | One-to-Many |

---

## Design Principles

The ER model was designed using the following principles:

- Kimball Dimensional Modeling
- Surrogate Keys for Dimensions
- Referential Integrity using Foreign Keys
- Separation of Facts and Dimensions
- Optimized for OLAP and Business Intelligence workloads

---

## Purpose

The ER Diagram serves as the logical blueprint of the analytical database and supports:

- SQL Analytics
- Fraud Detection Analysis
- Payment Intelligence Reporting
- Power BI Dashboards
- Machine Learning Feature Engineering

---

## Files

| File | Description |
|------|-------------|
| `01_ER_Diagram.png` | Enterprise Entity Relationship Diagram |
| `README.md` | ER Diagram documentation |

---

**Status:** Phase 1 Complete