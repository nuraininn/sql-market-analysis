-- Business Problem 5.1
WITH regist_date AS (
  SELECT 
    customer_id, 
    DATE_TRUNC(registration_date, MONTH) AS reg_date, 
    registration_channel
  FROM `finpro23.customer_detail`
  WHERE EXTRACT(YEAR FROM registration_date) = 2024
),
first_date AS (
  SELECT customer_id, MIN(order_date) AS first_order
  FROM `finpro23.order_detail`
  WHERE is_valid = 1
  GROUP BY customer_id
)
SELECT 
  reg_date, 
  registration_channel, 
  COUNT(r.customer_id) as new_customers
FROM regist_date AS r
JOIN first_date AS f ON r.customer_id = f.customer_id
GROUP BY reg_date, registration_channel
ORDER BY reg_date ASC;

-- Business Problem 5.2
WITH regist_date AS (
  SELECT
    customer_id,
    registration_channel,
    DATE_TRUNC(registration_date, MONTH) AS reg_date,   
    registration_date
  FROM `finpro23.customer_detail`
  WHERE EXTRACT(YEAR FROM registration_date) = 2024     
),
first_date AS (
  SELECT
    customer_id,
    MIN(CAST(order_date AS DATE)) AS first_order   
  FROM `finpro23.order_detail`
  WHERE is_valid = 1                             
  GROUP BY customer_id
)
SELECT
  extract(month from r.reg_date) as bulan_reg,        
  r.registration_channel,                           
  ROUND(AVG(DATE_DIFF(CAST(f.first_order AS DATE), r.reg_date, DAY)), 2)
    AS avg_days_to_first_order        
FROM regist_date r
JOIN first_date f
  ON r.customer_id = f.customer_id            
GROUP BY r.reg_date, r.registration_channel
ORDER BY r.reg_date, r.registration_channel;  