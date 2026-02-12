SELECT
  p.category,
  SUM(IF(EXTRACT(YEAR FROM o.order_date) = 2020, o.quantity, 0)) AS `2020`,
  SUM(IF(EXTRACT(YEAR FROM o.order_date) = 2021, o.quantity, 0)) AS `2021`,
  SUM(IF(EXTRACT(YEAR FROM o.order_date) = 2022, o.quantity, 0)) AS `2022`,
  SUM(IF(EXTRACT(YEAR FROM o.order_date) = 2023, o.quantity, 0)) AS `2023`,
  SUM(IF(EXTRACT(YEAR FROM o.order_date) = 2024, o.quantity, 0)) AS `2024`,
FROM `finpro23.order_detail` AS o
JOIN `finpro23.product_detail` AS p
  ON o.sku_id = p.sku_id
WHERE 
  EXTRACT(YEAR FROM o.order_date) BETWEEN 2020 AND 2024
  and o.is_valid = 1
GROUP BY p.category
ORDER BY `2020` desc;