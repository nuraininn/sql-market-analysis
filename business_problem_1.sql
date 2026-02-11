SELECT
  extract(month from transaction_date) as bulan_2024,
  COUNT(DISTINCT transaction_id) AS total_transaksi,
  round(sum(total_paid),2) AS total_penjualan,
  FROM `finpro23.transaction_detail`
WHERE EXTRACT(YEAR FROM DATE(transaction_date)) = 2024
GROUP BY bulan_2024
ORDER BY bulan_2024;