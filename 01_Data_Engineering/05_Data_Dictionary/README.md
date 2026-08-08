<div align="center">

  # 🕮 Enterprise Data Dictionary

  ![Documentation](https://img.shields.io/badge/Documentation-Metadata-8A2BE2?style=for-the-badge)
  ![Database](https://img.shields.io/badge/Database-SQL_Server-cc292b?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
  ![Architecture](https://img.shields.io/badge/Architecture-Kimball_Star_Schema-success?style=for-the-badge)

</div>

<br>

## 📖 Overview

The **Enterprise Data Dictionary** serves as the central metadata reference for the **Enterprise FinTech Payment Intelligence Platform**. It provides a standardized definition of every table, column, key, and relationship within the analytical data warehouse.

The warehouse is implemented in **Microsoft SQL Server** using the **Kimball Star Schema** methodology, where transactional data is stored in a central Fact table and descriptive business attributes are organized into Dimension tables.

This document ensures consistency across SQL analytics, Power BI dashboards, machine learning workflows, and future enhancements by providing a single source of truth for the database schema.

---

## 🗄️ Database Information

| Attribute | Value |
|-----------|-------|
| **Database Name** | Enterprise_FinTech_Payment_Intelligence |
| **Database Platform** | Microsoft SQL Server |
| **Data Warehouse Model** | Kimball Star Schema |
| **Total Fact Tables** | 1 |
| **Total Dimension Tables** | 5 |
| **Total Tables** | 6 |
| **Primary Keys** | 6 |
| **Foreign Keys** | 5 |

---

## 📐 Database Design Standards

The data warehouse follows several enterprise design principles to ensure scalability, maintainability, and analytical performance.

**Design Principles:**
- Kimball Dimensional Modeling
- Star Schema Architecture
- Surrogate Keys for all Dimension Tables
- Referential Integrity using Foreign Keys
- Atomic Transaction-Level Fact Table
- Optimized for OLAP and Business Intelligence workloads

---

## 📊 Fact Table

### `Fact_PaymentTransactions`

**Business Purpose:**
The `Fact_PaymentTransactions` table is the central table of the analytical warehouse. Each record represents a single payment transaction processed within the digital payment platform. The table stores measurable business facts and references descriptive information through foreign keys to the corresponding dimension tables.

**Business Usage:**
This table supports Business KPI calculation, Fraud detection analysis, Transaction reporting, Executive dashboards, Payment analytics, and Machine learning feature extraction.

**Primary Key:** `TransactionID`
**Referenced Dimensions:** `Dim_Time`, `Dim_TransactionType`, `Dim_Fraud`, `Dim_SourceAccount`, `Dim_DestinationAccount`

**Columns:**
| Column Name | Data Type | Key | Description |
|-------------|-----------|:---:|-------------|
| TransactionID | BIGINT | PK | Unique surrogate identifier assigned to each transaction. |
| TimeKey | INT | FK | References the associated record in the Time dimension. |
| TransactionTypeKey | INT | FK | References the transaction category. |
| FraudKey | INT | FK | References the fraud classification. |
| SourceAccountKey | INT | FK | References the originating account. |
| DestinationAccountKey | INT | FK | References the receiving account. |
| Amount | DECIMAL(18,2) | - | Monetary value of the transaction. |
| OldBalanceOrig | DECIMAL(18,2) | - | Source account balance before the transaction. |
| NewBalanceOrig | DECIMAL(18,2) | - | Source account balance after the transaction. |
| OldBalanceDest | DECIMAL(18,2) | - | Destination account balance before the transaction. |
| NewBalanceDest | DECIMAL(18,2) | - | Destination account balance after the transaction. |

---

## 🏷️ Dimension Tables

### `Dim_Time`
**Business Purpose:** Stores all time-related attributes used for time-series reporting, trend analysis, and dashboard filtering.
**Business Usage:** Supports Daily transaction analysis, Fraud trend reporting, Time-based KPIs, and Executive dashboard filters.
**Primary Key:** `TimeKey`

| Column Name | Data Type | Key | Description |
|-------------|-----------|:---:|-------------|
| TimeKey | INT | PK | Surrogate key for the Time dimension. |
| Step | INT | - | Original simulation step representing one hour. |
| HourOfSimulation | INT | - | Hour within the standardized 24-hour cycle. |
| DayNumber | INT | - | Sequential day number of the simulation. |
| PeriodOfDay | VARCHAR(20) | - | Categorized period of the day (Night, Morning, Afternoon, Evening). |

---

### `Dim_TransactionType`
**Business Purpose:** Stores the different categories of payment transactions processed by the platform.
**Business Usage:** Supports Payment channel analysis, Transaction segmentation, Fraud comparison by transaction type, and Dashboard filtering.
**Primary Key:** `TransactionTypeKey`

| Column Name | Data Type | Key | Description |
|-------------|-----------|:---:|-------------|
| TransactionTypeKey | INT | PK | Surrogate key for the transaction type. |
| TransactionType | VARCHAR(20) | - | Category of transaction (PAYMENT, TRANSFER, CASH_IN, CASH_OUT, DEBIT). |

---

### `Dim_Fraud`
**Business Purpose:** Stores fraud classifications associated with payment transactions.
**Business Usage:** Supports Fraud reporting, Fraud KPIs, Fraud dashboards, and Machine learning evaluation.
**Primary Key:** `FraudKey`

| Column Name | Data Type | Key | Description |
|-------------|-----------|:---:|-------------|
| FraudKey | INT | PK | Surrogate key for the fraud dimension. |
| IsFraud | BIT | - | Indicates whether the transaction is fraudulent (1 = Fraud, 0 = Legitimate). |
| IsFlaggedFraud | BIT | - | Indicates whether the transaction was flagged by legacy fraud detection rules. |

---

### `Dim_SourceAccount`
**Business Purpose:** Stores the unique identifiers of all originating (sender) accounts.
**Business Usage:** Supports Customer behavior analysis, Sender profiling, Fraud investigation, and Transaction tracing.
**Primary Key:** `SourceAccountKey`

| Column Name | Data Type | Key | Description |
|-------------|-----------|:---:|-------------|
| SourceAccountKey | INT | PK | Surrogate key for the source account. |
| SourceAccountID | VARCHAR(50) | - | Original identifier of the sender account. |

---

### `Dim_DestinationAccount`
**Business Purpose:** Stores the unique identifiers of all destination (receiver) accounts.
**Business Usage:** Supports Receiver analysis, Money flow tracking, Network analysis, and Fraud investigation.
**Primary Key:** `DestinationAccountKey`

| Column Name | Data Type | Key | Description |
|-------------|-----------|:---:|-------------|
| DestinationAccountKey | INT | PK | Surrogate key for the destination account. |
| DestinationAccountID | VARCHAR(50) | - | Original identifier of the receiving account. |

---

## 🔗 Relationship Summary

The use of surrogate keys and foreign key relationships ensures referential integrity while enabling efficient analytical queries across the data warehouse.

| Parent Table | Child Table | Relationship |
|--------------|-------------|:---:|
| `Dim_Time` | `Fact_PaymentTransactions` | One-to-Many |
| `Dim_TransactionType` | `Fact_PaymentTransactions` | One-to-Many |
| `Dim_Fraud` | `Fact_PaymentTransactions` | One-to-Many |
| `Dim_SourceAccount` | `Fact_PaymentTransactions` | One-to-Many |
| `Dim_DestinationAccount` | `Fact_PaymentTransactions` | One-to-Many |

---

## 🚀 Integration with the Project

The Enterprise Data Dictionary provides the metadata foundation for every phase of the project. By maintaining a standardized schema definition, the Data Dictionary ensures consistency across all analytical components of the Enterprise FinTech Payment Intelligence Platform.

The warehouse schema directly supports:
- SQL Analytics
- Advanced SQL Reporting
- Business KPI Calculation
- Fraud Detection Analysis
- Power BI Dashboards
- Machine Learning Feature Engineering
- Explainable AI

---

## 📝 Conclusion

| Object | Count |
|---------|:---:|
| **Fact Tables** | 1 |
| **Dimension Tables** | 5 |
| **Total Tables** | 6 |
| **Primary Keys** | 6 |
| **Foreign Keys** | 5 |

The Enterprise Data Dictionary serves as the authoritative reference for the analytical data warehouse powering the Enterprise FinTech Payment Intelligence Platform. 

It documents the purpose, structure, relationships, and business meaning of every table and column, providing a consistent foundation for SQL development, business intelligence reporting, fraud analytics, and machine learning workflows. By combining standardized metadata with a Kimball Star Schema architecture, the platform delivers a scalable, maintainable, and enterprise-ready data warehouse designed for modern payment analytics.
