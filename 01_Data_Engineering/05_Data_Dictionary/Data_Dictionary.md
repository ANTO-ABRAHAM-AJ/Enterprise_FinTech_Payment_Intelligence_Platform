# Enterprise Data Dictionary
**Database:** `Enterprise_FinTech_Payment_Intelligence`
**Architecture:** Star Schema (Version 1)

---

## 1. Fact Table: `Fact_PaymentTransactions`
The core ledger table containing all transactional volumes and financial balances.

| Column Name | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| `TransactionID` | BIGINT | PK | Unique surrogate key generated for each transaction. |
| `TimeKey` | INT | FK | Links to `Dim_Time` to establish when the transaction occurred. |
| `TransactionTypeKey` | INT | FK | Links to `Dim_TransactionType` to establish the method of transfer. |
| `FraudKey` | INT | FK | Links to `Dim_Fraud` to establish the risk classification. |
| `SourceAccount` | VARCHAR(50) | Indexed | The alphanumeric ID of the customer initiating the transaction. |
| `DestinationAccount` | VARCHAR(50) | Indexed | The alphanumeric ID of the recipient (Customer or Merchant). |
| `Amount` | DECIMAL(18,2) | Indexed | The total monetary value transferred in the local currency. |
| `OldBalanceOrig` | DECIMAL(18,2) | - | The sender's account balance *before* the transaction. |
| `NewBalanceOrig` | DECIMAL(18,2) | - | The sender's account balance *after* the transaction. |
| `OldBalanceDest` | DECIMAL(18,2) | - | The receiver's account balance *before* the transaction. |
| `NewBalanceDest` | DECIMAL(18,2) | - | The receiver's account balance *after* the transaction. |

---

## 2. Dimension Table: `Dim_Time`
Contains the temporal mapping for time-series analytics.

| Column Name | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| `TimeKey` | INT | PK | Surrogate key for the time dimension. |
| `Step` | INT | Unique | Maps 1 hour of time in the real world (e.g., Step 1 to 744 represents 30 days). |

---

## 3. Dimension Table: `Dim_TransactionType`
Categorizes the mechanism of the money movement.

| Column Name | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| `TransactionTypeKey` | INT | PK | Surrogate key for the transaction category. |
| `TransactionType` | VARCHAR(20) | Unique | The type of transfer (`CASH_IN`, `CASH_OUT`, `DEBIT`, `PAYMENT`, `TRANSFER`). |

---

## 4. Dimension Table: `Dim_Fraud`
Isolates the risk and compliance classification.

| Column Name | Data Type | Key | Description |
| :--- | :--- | :--- | :--- |
| `FraudKey` | INT | PK | Surrogate key for the fraud profile. |
| `IsFraud` | BIT | - | 1 = Actual Fraudulent Transaction, 0 = Legitimate Transaction. |
| `IsFlaggedFraud` | BIT | - | 1 = Flagged by legacy business rules (usually for massive transfers), 0 = Not Flagged. |