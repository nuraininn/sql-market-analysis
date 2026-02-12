-- Business Problem 4.1
SELECT 
  channel_source,
  COUNT(*) AS total_events
FROM `finpro23.funnel_detail`
WHERE event = 'Organic'
  AND DATE(funnel_date) BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY channel_source
ORDER BY total_events DESC;

-- Business Problem 4.2
SELECT 
  COUNT(DISTINCT order_id) AS total_orders
FROM `finpro23.funnel_detail`
WHERE event = 'Organic'
  AND DATE(funnel_date) BETWEEN '2024-01-01' AND '2024-12-31'
  AND order_id IS NOT NULL;

-- Business Problem 4.3
SELECT 
  channel_source,
  COUNT(*) AS total_events,
  COUNT(DISTINCT order_id) AS total_orders,
  SAFE_DIVIDE
    (COUNT(DISTINCT order_id), 
    COUNT(*)) * 100 AS conversion_rate_pct
FROM `finpro23.funnel_detail`
WHERE event = 'Organic'
  AND DATE(funnel_date) BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY channel_source
ORDER BY conversion_rate_pct DESC;