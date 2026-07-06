# Entity Relationship (ER) Diagram Overview

## Overview

The Entity Relationship (ER) Diagram provides a logical representation of the database structure used in the Enterprise FinTech Payment Intelligence Platform.

It illustrates the entities, their attributes, primary keys, foreign keys, and the relationships between them.

The ER Diagram serves as the blueprint of the database before analytical queries are developed.

---

# Purpose

The ER Diagram was created to:

- Define the database structure
- Identify entities and their attributes
- Establish relationships between tables
- Ensure data integrity using primary and foreign keys
- Support efficient SQL query development
- Provide a clear understanding of the data model

---

# Database Entities

The database consists of four primary entities:

| Entity | Description |
|----------|-------------|
| Fact_PaymentTransactions | Stores all payment transaction records |
| Dim_Time | Stores unique transaction time steps |
| Dim_TransactionType | Stores payment transaction types |
| Dim_Fraud | Stores fraud classifications |

---

# Primary Keys

Each entity contains a unique primary key.

| Table | Primary Key |
|--------|-------------|
| Fact_PaymentTransactions | TransactionID |
| Dim_Time | TimeKey |
| Dim_TransactionType | TransactionTypeKey |
| Dim_Fraud | FraudKey |

---

# Foreign Keys

The Fact Table references each Dimension Table through foreign keys.

| Foreign Key | References |
|--------------|------------|
| TimeKey | Dim_Time |
| TransactionTypeKey | Dim_TransactionType |
| FraudKey | Dim_Fraud |

---

# ER Diagram

> Insert the exported ER Diagram image below.

![ER Diagram](er_diagram.png)

---

# Design Summary

The ER Diagram provides a structured representation of the data warehouse and ensures that relationships between entities are clearly defined before analytical processing.

This design supports data integrity, simplifies SQL development, and forms the foundation for payment analytics, fraud detection, and business intelligence.

---

# Conclusion

The ER Diagram represents the logical design of the Enterprise FinTech Payment Intelligence Platform and provides the structural foundation for the Star Schema implemented in SQL Server.