# SQL - Ecommerce Sales & Performance Analysis

## Project Overview
This project analyzes e-commerce transactional data from 2020–2024 to generate business insights that support:
- Inventory planning (restock strategy)
- Sales performance monitoring
- Customer onboarding optimization
- Revenue tracking & seasonality analysis

All analyses were performed using Google BigQuery (SQL) and documented as case-based business scenarios.

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

## 3.1 Total distinct orders & total revenue per month

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

## 3.2 MoM revenue growth vs same month in 2023
## Approach 
CTE – revenue_per_month: Calculated total distinct orders and total revenue per month, year, and channel type by:
- Extracting month and year from order_date
- Counting distinct order_id
- Summing after_discount
- Filtering valid transactions (is_valid = 1)
- Filtering years 2023 and 2024
- Grouping by channel, month, and year

CTE – pivot_years: Transformed row-based data into column format (pivot):
- Converted month number into month name
- Separated revenue and orders for 2023 and 2024 using CASE statements
- Used MAX() to ensure one value per group
- Used COALESCE(..., 0) to handle missing values

Main Query
- Calculated revenue growth percentage: Prevented division by zero when revenue_2023 = 0 and applied growth formula: (revenue_2024 - revenue_2023) / revenue_2023 * 100
- Rounded results to two decimal places
- Ordered by channel and month

## Key Insights
- Offline Store showed the strongest spikes (Jan +407%, Dec +638%).
- Website performed strongly mid-year and Q4.
- App Store experienced significant mid-year declines (down to -82%).
- Growth was highly seasonal — strong at the beginning and end of the year, weaker mid-year.

Business Insights
- Revenue growth is volatile and season-driven.
- Channel performance varies significantly by month.
- High order volume does not always translate into high revenue growth.

## Recommendations
- Prioritize high-growth channels (Offline & Website).
- Investigate decline drivers in App Store.
- Adjust budget allocation based on channel performance.
- Apply seasonal, adaptive promotion strategies.

## Business Problem 4
Evaluate the effectiveness of organic traffic channels by analyzing:
- Total organic events per channel
- Total unique converted orders
- Conversion rate (%)
Period: Jan 1 – Dec 31, 2024

## 4.1 Total organic events per channel

## Approach
- Filtered organic events from funnel_detail (2024)
- Counted total events per channel_source
- Counted unique converted order_id
- Calculated conversion rate = orders ÷ events × 100%
- Grouped by channel_source

## Key Insights
- Website recorded the highest organic events (29,062) → strongest organic traffic driver.
- App Store followed closely (27,717) → high growth potential.
- Play Store remained competitive (26,165) with solid performance.
- Overall, organic acquisition is well distributed across channels, with Website leading.

Business Insights
- Website serves as the strongest organic acquisition engine.
- App Store shows potential to close the gap with optimization.
- Conversion effectiveness, not just traffic volume, should be prioritized.

## Recommendations
- High Priority: Use Website as benchmark (analyze landing pages, CTAs, SEO strategy).
- Medium–High Priority: Run A/B tests on App Store listing & onboarding flow.
- Medium Priority: Identify funnel drop-off points in Play Store and optimize per stage.
- Ongoing: Apply cross-channel best practices and implement continuous experiment reviews.
  
## 4.2 Organic Orders Conversion Analysis (2024)

## Approach
- Count distinct order_id → total converted orders
- Filter only organic events
- Exclude null order_id values
- Aggregate results for 2024

## Key Insights
- Total converted organic orders: 1,817
- Compared to total organic events (~26K–29K per channel), the conversion rate is relatively low.
- Significant drop-off likely occurs across funnel stages (Visit → Add to Cart → Purchase).

Business Insights
- High organic traffic does not necessarily translate into high conversions.
- Funnel inefficiencies may exist at mid-to-late stages.
- Optimization should focus on improving conversion efficiency rather than traffic volume alone.

## Recommendations
Funnel Optimization
- Analyze drop-off rates per funnel stage
- Run A/B testing on landing pages and CTAs

SEO & Content Strategy
- Improve keyword targeting and product content clarity
- Enhance product descriptions and persuasive elements
- Implement remarketing strategies (cart reminders, email, push notifications)

Checkout Experience
- Simplify checkout flow
- Review available payment methods to reduce transaction friction

## 4.3 Organic Conversion Rate by Channel

## Approach
- Counted total rows as total_events
- Counted distinct order_id as total_orders
- Calculated conversion rate: conversion_rate = total_orders / total_events * 100
- Grouped results by channel_source
- Sorted by conversion_rate (descending)

## Key Insights
- Conversion rates are relatively balanced across channels (difference ~0.05%).
- Website generates the highest traffic and order volume, making it the main acquisition driver.
- App-based channels show strong efficiency despite lower traffic, indicating growth potential.
- Similar CR across channels suggests potential funnel bottlenecks beyond acquisition stage.

Business Insights
- Traffic volume ≠ conversion efficiency.
- Optimization should focus on funnel stages and user experience.
- App channels present an opportunity for scalable growth.

## Recommendations
App Optimization
- Improve mobile UX/UI and simplify checkout flow.
- Strengthen App Store Optimization (ASO).
- Launch app-exclusive promotions.

Website Funnel Improvement
- Analyze drop-off points (Add-to-Cart → Checkout).
- Conduct A/B testing for landing and checkout pages.

Cross-Channel Strategy
- Retarget website visitors to mobile apps.
- Align promotional campaigns across channels.

## Business Problem 5
Analyze customer acquisition and onboarding effectiveness in 2024 by measuring:
- Total new customers per registration channel (monthly).
- Average time (in days) from registration to first purchase.

Only customers with at least one valid transaction are included.

## 5.1 Total new customers per registration channel (monthly)

## Approach
CTE 1 – Registration Data
- Filter customers registered in 2024
- Aggregate by month using DATE_TRUNC(registration_date, MONTH)
- Group by registration_channel
CTE 2 – First Purchase Date
- Identify first valid transaction using MIN(order_date)
- Ensure one first purchase date per customer
Main Query
- Join registration and first purchase data via customer_id
- Calculate: Total new customers per month & channel, average days between registration and first purchase
- Sort results chronologically

## Key Findings
- January recorded the highest number of new registrations (30 customers).
- Mobile App is the leading acquisition channel.
- Website ranks second.
- Offline Store contributes the lowest share of new customers.
- Digital channels outperform offline channels in customer acquisition.

Business Insights
- Mobile-based onboarding is highly effective
- Digital acquisition channels should remain the primary growth focus.
- Time-to-first-purchase metric helps evaluate onboarding efficiency.

## Recommendations
Prioritize Mobile App Growth
- Improve UX and onboarding flow
- Leverage push notifications and loyalty programs

Strengthen Website Conversion
- Improve accessibility (e.g., social login options)
- Offer exclusive incentives for new sign-ups

Improve Offline–Online Integration
- Encourage in-store customers to register digitally
- Provide QR-based onboarding in physical stores

Leverage Campaign Periods
- Maximize major promotional events (Ramadan, 9.9, 11.11, 12.12) to boost registrations

## 5.2 – Average Time to First Purchase Analysis 

## Approach
CTE 1 – Registration Data
- Filter customers registered in 2024
- Truncate registration_date to month level
- Group by registration month and channel

CTE 2 – First Purchase Date
- Identify first valid transaction using MIN(order_date)
- Ensure one first purchase date per customer

Main Query
- Join both CTEs using customer_id
- Calculate: avg_days_to_first_purchase = AVG(DATE_DIFF(first_order_date, registration_date, DAY))
- Round results to 2 decimal places
- Display: Registration month (month number), Registration channel, Average days to first purchase
- Sort by month and channel

## Key Insights
The average time to first purchase decreased throughout 2024, indicating improved onboarding effectiveness.

Channel Performance
- Website: Stable and improving performance, Best result in December: 6 days
- Mobile App: Fluctuating performance, Improved significantly in the second half of the year
- Offline Store: Significant anomaly in May and July (~150 days), Indicates possible activation or operational issues

Business Insights
- Onboarding improvements appear effective over time.
- Website onboarding process can serve as a benchmark.
- Offline channel requires investigation due to conversion delays.

## Recommendations
Benchmark Website (December Performance)
- Analyze what drives faster conversion
- Replicate successful onboarding strategies in other channels

Investigate Offline Store Anomaly
- Improve activation flow
- Strengthen customer follow-up
- Offer targeted incentives for first purchase

Optimize Mobile App Onboarding
- Implement push notifications
- Provide first-order promotions
- Improve onboarding UX flow
