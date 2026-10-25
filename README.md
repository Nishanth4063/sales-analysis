# Sales Analysis Dashboard (Excel, SQL Server, Power BI)

Analysis of 1,000 sales records, built in four tools and cross-checked so every number matches.

## Tools
- **Excel:** pivot tables, SUMIFS / COUNTIFS, lookups, conditional formatting, charts
- **SQL Server (SSMS):** GROUP BY, HAVING, CASE, CTEs, ROW_NUMBER, JOINs
- **Python (pandas, matplotlib):** same analysis in a notebook, results match the other tools
- **Power BI:** star schema (Sales fact table, Calendar and Sales Reps dimensions), DAX measures, interactive dashboard, drill-through page

## Data
Kaggle sales dataset (1,000 rows, 14 columns, 2023 plus 3 records in Jan 2024). Checked in Power Query: 0 duplicates, 0 empty values.

## Key numbers (all three tools agree)
- Total recorded sales: **5,019,265.23** (average sale about 5,019)
- 1,000 sales, 100 unique products, about 25,000 units sold

## Insights (based on recorded Sales_Amount)
1. **North is the top region** with 1,369,612.51 (27.3% of sales). South is lowest at 1,154,250.86 (23.0%). Sales are fairly balanced across regions.
2. **David is the top sales rep** (1,141,737.36, 22.7%). Charlie is lowest (860,811.48, 17.2%).
3. **Clothing leads categories** (26.2%), but all four categories sit between 23.9% and 26.2%.
4. **Retail and Online are almost even** (51.0% vs 49.0%). Returning and new customers are also even (50.1% vs 49.9%).
5. **Monthly sales in 2023 stay within a narrow range.** Peak is January (476,092.36), low is September (367,837.60).

## Data notes
- Sales_Amount does not equal Unit_Price x Quantity in this dataset (the columns are unrelated), so I report **recorded sales** and do not present price-based profit as real profit.
- Jan 2024 has only 3 records, so the monthly chart is filtered to 2023.
- The Sales Reps "Team" column is practice data I added to demonstrate a dimension table.

## Files
- `Sales_Analysis_Dashboard.pbix` (Power BI report, 2 pages: Sales Overview and Region Detail)
- `load_sales_data.sql` and query scripts
- `Project_1.xlsx` (Excel analysis)
- `sales_analysis.ipynb` and `sales_data.csv` (pandas notebook)
- Screenshots: dashboard, drill-through page, star schema (Model view)
