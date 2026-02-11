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
