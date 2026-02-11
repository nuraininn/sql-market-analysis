# SQL - Market Analysis

## Business Problem 1
The board requested a monthly sales report for 2024 to evaluate revenue performance.

## Dataset
Transaction data from transaction_detail table.

## Approach
- Extract month from transaction_date
- Calculate total transactions
- Sum total_paid as total revenue
- Filter year 2024
- Group and order by month

## SQL Query
SELECT
  extract(month from transaction_date) as bulan_2024,
  COUNT(DISTINCT transaction_id) AS total_transaksi,
  round(sum(total_paid),2) AS total_penjualan,
  FROM `finpro23.transaction_detail`
WHERE EXTRACT(YEAR FROM DATE(transaction_date)) = 2024
GROUP BY bulan_2024
ORDER BY bulan_2024;

## Key Insights
- Sales peaked in May and December.
- Low seasons occurred in Feb–Mar and Jun–Jul.
- Revenue growth is strongly seasonal.

## Recommendations
- Prepare structured campaigns 6–8 weeks before peak months.
- Optimize safety stock for top SKUs in May and December.
- Run targeted promotions during low seasons to stabilize revenue.
