import pandas as pd
from sqlalchemy import create_engine

INPUT_CSV = "data/sales_data.csv"
OUTPUT_CLEAN_CSV = "data/sales_data_clean.csv"
DB_PATH = "data/sales.db"

def main():
    df = pd.read_csv(INPUT_CSV)

    # Transform
    df["order_date"] = pd.to_datetime(df["order_date"], errors="coerce")
    df = df.dropna(subset=["order_date"])
    df = df[df["quantity"] > 0]
    df = df[df["unit_price"] > 0]

    df["revenue"] = df["quantity"] * df["unit_price"]
    df["year_month"] = df["order_date"].dt.to_period("M").astype(str)

    for col in ["product", "category", "region"]:
        df[col] = df[col].astype(str).str.strip()

    # Load (Clean CSV)
    df.to_csv(OUTPUT_CLEAN_CSV, index=False)
    print(f"✅ Clean CSV saved: {OUTPUT_CLEAN_CSV} ({len(df)} rows)")

    # Load (SQLite)
    engine = create_engine(f"sqlite:///{DB_PATH}")
    df.to_sql("sales", engine, if_exists="replace", index=False)
    print(f"✅ SQLite DB saved: {DB_PATH} (table: sales)")

if __name__ == "__main__":
    main()
