import pandas as pd
from sqlalchemy import create_engine
import urllib

# CSV file path
csv_path = r"C:\Users\ANTO ABRAHAM AJ\Downloads\Enterprise_FinTech_Payment_Intelligence_Platform\01_Data_Engineering\01_Dataset\paysim_raw.csv"

# SQL Server connection
params = urllib.parse.quote_plus(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=localhost;"
    "DATABASE=Enterprise_FinTech_Payment_Intelligence;"
    "Trusted_Connection=yes;"
)

engine = create_engine(f"mssql+pyodbc:///?odbc_connect={params}")

print("Starting import...")

chunk_size = 1000
first_chunk = True
total_rows = 0

for chunk in pd.read_csv(csv_path, chunksize=chunk_size):

    chunk.to_sql(
        name="payment_transactions_raw",
        con=engine,
        if_exists="replace" if first_chunk else "append",
        index=False,
        method=None
    )

    total_rows += len(chunk)
    print(f"{total_rows:,} rows imported...")

    first_chunk = False

print("\nImport completed successfully!")
print(f"Total rows imported: {total_rows:,}")