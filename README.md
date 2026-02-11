# SQL - Ecommerce Sales & Performance Analysis (2024)

## Project Overview
This project analyzes sales performance, inventory planning, channel growth, organic funnel effectiveness, and customer onboarding to support strategic decision-making.

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

## Key Insights
- Sales peaked in May and December.
- Low seasons occurred in Feb–Mar and Jun–Jul.
- Revenue growth is strongly seasonal.

## Recommendations
- Prepare structured campaigns 6–8 weeks before peak months.
- Optimize safety stock for top SKUs in May and December.
- Run targeted promotions during low seasons to stabilize revenue.

## Business Problem 2
Analyze yearly sales volume (total quantity sold) per category from 2020 to 2024 to support warehouse restock planning.

## Dataset
Data from order_detail and product_detail table.

## Approach
- Extracted year from order_date
- Aggregated total quantity per category per year
- Joined order_detail with product_detail using sku_id
- Filtered data between 2020–2024
- Grouped by category

## Key Insights
- Most categories show steady year-over-year growth.
- Food & Beverage and Beauty & Personal Care are consistently top-performing categories.
- Certain categories (e.g., Home Decor, Fashion) show seasonal or event-driven spikes.

## Recommendations
- Prioritize stock for top-performing categories.
- Adjust inventory levels based on growth/decline trends.
- Prepare buffer stock to anticipate seasonal demand fluctuations.

## Business Problem 3
Analyze monthly channel performance (Web, App, Offline) in 2024:
1. Total distinct orders & total revenue per month
2. MoM revenue growth vs same month in 2023

## Dataset
Order data from order_detail table.

## Approach
- Extract month from order_date
- Filter is_valid = 1
- Filter year = 2024
- Count distinct order_id → total_orders
- Sum after_discount → total_revenue
- Group by month & channel_type

## Key Insights
Orders
- Website strong in Q2–Q3
- Offline Store strongest in December
- July lowest performance across channels
Revenue
- December highest revenue (Offline ~1.5B)
- February & July low revenue months
- April–May: high volume, lower AOV
- December: high volume & high AOV
Business Insights
- Strong seasonality effect (holiday-driven growth)
- Revenue ≠ Order Volume (AOV fluctuation important)
- Competitive channel dynamics

## Recommendations
- Focus year-end campaign optimization
- Mitigate low-season decline (Feb & Jul)
- Strengthen omnichannel integration
- Monitor AOV alongside order growth
