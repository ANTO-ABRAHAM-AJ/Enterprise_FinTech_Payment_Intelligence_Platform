# Entity Relationship Diagram

This folder contains the Entity Relationship (ER) Diagram for the Enterprise FinTech Payment Intelligence Platform.

## Contents

- **01_ER_Diagram.png** – Visual representation of the database entities and relationships.
- **02_ER_Diagram_Explanation.md** – Detailed explanation of the entities, keys, and relationships.

## Database Tables

- Fact_PaymentTransactions
- Dim_TransactionType
- Dim_Fraud

## Relationships

- Dim_TransactionType (1) → Fact_PaymentTransactions (Many)
- Dim_Fraud (1) → Fact_PaymentTransactions (Many)

The ER Diagram documents the logical database design and shows how the tables are connected using Primary Keys and Foreign Keys.