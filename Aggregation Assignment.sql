USE ecommerce;
 
SELECT *
FROM orders;

-- REGION PERFORMANCE

-- TOTAL SALES PER Region
SELECT Region, sum(Sales) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- TOTAL PROFIT PER EACH Region
SELECT Region, sum(Profit) AS Total_Profit
FROM orders
GROUP BY Region
ORDER BY Total_Profit DESC;
-- INSIGHT: The company should prioritize the western region as it has the highest amount of profit as compared to the other regions.

-- SHIPPING MODE ANALYSIS

-- Number of orders
SELECT `Ship mode`, COUNT(`Order ID`) AS number_of_orders
FROM orders
GROUP BY `Ship mode`
ORDER BY number_of_orders DESC;

-- Average sales per order for each shipping mode
SELECT `Ship mode`, AVG(`Sales`) AS avg_sales_per_order
FROM orders
GROUP BY `Ship mode`
ORDER BY avg_sales_per_order DESC;
-- INSIGHT:The standard class shipping method is the most popular and it generates the highest average order value


-- Customer Segment Insight
SELECT `Segment`, SUM(`Profit`) AS Total_profit
FROM orders
GROUP BY `Segment`
ORDER BY Total_profit DESC;

-- Average Discount for each customer segment
SELECT  `Segment`, AVG(`Discount`) AS AVG_Discount
FROM orders
GROUP BY `Segment`
ORDER BY AVG_Discount DESC;
-- INSIGHT:The higher the discount, the higher the profit.


-- Loss making sub-categories
SELECT `Sub-category`, sum(`profit`) AS Total_profits
FROM orders
GROUP BY `Sub-category`
HAVING sum(`profit`) <0
ORDER BY Total_profits DESC;
-- INSIGHT: The Tables sub-category are loosing money and the business should consider adding the amount of tables.


-- Top 5 states by sales
SELECT `State`, sum(`sales`) AS Total_sales
FROM orders
GROUP BY `State`
ORDER BY Total_sales DESC
LIMIT 5;
-- INSIGHT: The California and New york state have the highest revenue and the regional managers should focus on the total sales


-- High discount category
SELECT `Category`, avg(`Discount`) AS Avg_Discount
FROM orders
GROUP BY `Category`
Having avg(`Discount`) >0.15
ORDER BY Avg_Discount DESC;
-- INSIGHT: The Furniture Category has high discount and its hurting profitability.


