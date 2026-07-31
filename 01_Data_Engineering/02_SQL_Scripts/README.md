# SQL Scripts

---

# Overview

This folder contains the SQL Server scripts used to build the Enterprise FinTech Payment Intelligence Platform data warehouse.

The scripts implement a complete data engineering workflow, beginning with database initialization and ending with data validation. Together, they create a production-style analytical environment that supports business intelligence, fraud analytics, machine learning, and reporting.

The SQL scripts follow a structured execution order to ensure data integrity, maintainability, and reproducibility.

---

# SQL Workflow

```
Database Setup
        ↓
Staging Table Creation
        ↓
Data Profiling
        ↓
Star Schema Construction
        ↓
Performance Optimization
        ↓
Data Validation
```

---

# Execution Order

The scripts should be executed in the following sequence.

| Step | Script | Purpose |
|------|--------|---------|
| 1 | `01_Database_Setup.sql` | Creates and initializes the SQL Server database. |
| 2 | `02_Staging_Table.sql` | Creates the staging table from the raw transaction data. |
| 3 | `03_Data_Profiling.sql` | Performs data profiling and quality assessment. |
| 4 | `04_Star_Schema.sql` | Builds the enterprise star schema and loads the warehouse. |
| 5 | `05_Indexes.sql` | Creates indexes to improve analytical query performance. |
| 6 | `06_Validation_Queries.sql` | Executes quality assurance and referential integrity checks. |

---

# SQL Components

## 1. Database Initialization

Creates the SQL Server database and verifies the database environment before data loading begins.

---

## 2. Staging Layer

The staging table stores a working copy of the raw transaction data.

This layer isolates the source data and provides a safe environment for data profiling, validation, and transformation before loading the analytical warehouse.

---

## 3. Data Profiling

The profiling script evaluates the quality of the dataset by checking:

- Dataset structure
- Row count
- Missing values
- Duplicate records
- Transaction type distribution
- Fraud distribution
- Flagged fraud distribution

These checks ensure the dataset is suitable for downstream analytics.

---

## 4. Star Schema

The warehouse follows a Kimball-style star schema.

### Fact Table

- Fact_PaymentTransactions

### Dimension Tables

- Dim_Time
- Dim_TransactionType
- Dim_Fraud
- Dim_SourceAccount
- Dim_DestinationAccount

The schema is designed to support efficient analytical queries while maintaining referential integrity through surrogate keys and foreign key relationships.

---

## 5. Performance Optimization

Non-clustered indexes are created on frequently queried columns, including:

- Time
- Transaction Type
- Fraud
- Source Account
- Destination Account
- Transaction Amount

These indexes improve query performance for business intelligence dashboards and analytical reporting.

---

## 6. Data Validation

The final script validates the completed warehouse by performing:

- Row count verification
- Referential integrity checks
- Orphan record detection
- Financial data validation
- Duplicate transaction validation
- Fraud distribution verification

These quality assurance checks confirm that the warehouse has been successfully populated and is ready for analytics.

---

# Output

After executing all scripts, the project contains:

- SQL Server Database
- Staging Layer
- Enterprise Star Schema
- Optimized Indexes
- Validated Data Warehouse

This warehouse serves as the foundation for SQL analytics, business KPI reporting, machine learning, Explainable AI, and Power BI dashboards.

---

# Technologies

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- Kimball Star Schema
- Relational Data Warehouse Design

---

# Related Project Modules

The SQL warehouse built in this folder supports the following project phases:

- Data Engineering
- Business Analytics
- Machine Learning
- Explainable AI
- Power BI Dashboard Development
- Business Recommendations

---

# Summary

These SQL scripts implement a complete enterprise data warehousing workflow for the Enterprise FinTech Payment Intelligence Platform.

Starting from database initialization through warehouse construction, indexing, and quality validation, the scripts establish a scalable analytical foundation for fraud detection, payment intelligence, business reporting, and advanced analytics.