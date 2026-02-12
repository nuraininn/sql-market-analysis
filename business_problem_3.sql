-- Business Problem 3.1
SELECT
  extract(month from order_date) as month_2024,  
  channel_type,
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(after_discount) AS total_revenue
FROM `finpro23.order_detail`
WHERE is_valid = 1
  AND EXTRACT(YEAR FROM order_date) = 2024
GROUP BY month_2024, channel_type
ORDER BY month_2024, channel_type;

-- Business Problem 3.2
with revenue_per_month as(
  select
    channel_type,
    extract(month from order_date) AS month,
    extract(year from order_date) AS year,
    count(distinct order_id) as orders,
    sum(after_discount) as revenue
  from `finpro23.order_detail`
  where
    extract(YEAR from order_date) in (2023, 2024)
    and is_valid = 1
  group by 1,2,3
  ),
pivot_years as(
  SELECT
    channel_type,
    month,
    FORMAT_DATE('%B', DATE(2024, month, 1)) AS month_name,
    coalesce(max(case when year = 2023 then orders end), 0) as orders_2023,
    coalesce(max(case when year = 2023 then revenue end), 0) as revenue_2023,
    coalesce(max(case when year = 2024 then orders end), 0) as orders_2024,
    coalesce(max(case when year = 2024 then revenue end), 0) as revenue_2024,
  FROM revenue_per_month
  GROUP BY channel_type, month
)
SELECT
  channel_type,
  month_name,
  orders_2023,
  revenue_2023,
  orders_2024,
  revenue_2024,
  round(
    case
      when revenue_2023 = 0 then null
      else (revenue_2024 - revenue_2023) / revenue_2023 * 100
    end, 2
) as pct_growth_2024_vs_2023
from pivot_years
order by channel_type, month;