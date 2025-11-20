SELECT * 
FROM orders;

-- STRING Functions
-- (1) UPPER () and LOWER()

 SELECT
    `Customer Name`,
    UPPER(`Customer Name`) AS Customer_Name
FROM orders;

-- Lower
SELECT
    `Customer Name`,
    LOWER(`Customer Name`) AS Customer_Name
FROM orders;    

-- TRIM
SELECT
    `Customer Name`,
    TRIM(`Customer Name`) AS Customer_Name
FROM orders;

-- CONCAT()
SELECT
    `Customer Name`,
  CONCAT(City,"-", State) AS Location
FROM orders;

-- LEFT AND RIGHT()
SELECT
  `Product Name`,
  LEFT(`Product Name`, 15) AS Short_Product_Name
  FROM orders
  LIMIT 5;

  SELECT
  `Postal Code`,
  RIGHT(`Postal Code`,4) AS Last_Four_Digits
  FROM orders
  LIMIT 5;

  -- REPLACE()
  SELECT DISTINCT Category,
  REPLACE(Category,`Office Supplies`, `Office Stationery`) AS New_Category
  FROM orders;

  -- DATE FUNCTIONS
  -- YEAR()
  -- Sales per Year
 SELECT DISTINCT YEAR(`Order Date`) AS `Year`,
 SUM(Sales) AS Total_Sales
 FROM orders
 GROUP BY YEAR(`Order Date`);

-- MONTH
 SELECT
Order_Date,
MONTH(`Order_Date`) AS Month_Number
FROM orders
LIMIT 5;

-- MONTHNAME
SELECT
Order_Date,
MONTHNAME(`Order_Date`) AS Month_Name
FROM orders
LIMIT 5;

-- DAY
SELECT
Order_Date,
DAY(`Order_Date`) AS Day_Of_Month
FROM orders
LIMIT 5;

-- WEEKDAY
SELECT
CASE
WHEN WEEKDAY(Order_Date) = 0 THEN 'Monday'
WHEN WEEKDAY(Order_Date) = 1 THEN 'Tuesday'
WHEN WEEKDAY(Order_Date) = 2 THEN 'Wednesday'
WHEN WEEKDAY(Order_Date) = 3 THEN 'Thursday'
WHEN WEEKDAY(Order_Date) = 4 THEN 'Friday'
WHEN WEEKDAY(Order_Date) = 5 THEN 'Saturday'
WHEN WEEKDAY(Order_Date) = 6 THEN 'Sunday'
END AS Day_Name,
COUNT(Order_ID) AS Order_Count
FROM orders
GROUP BY WEEKDAY(Order_Date)
ORDER BY WEEKDAY(Order_Date);

-- WEEK
SELECT
YEAR(Order_Date) AS Year,
WEEK(Order_Date) AS Week,
ROUND(SUM(Sales), 2) AS Weekly_Sales
FROM orders
GROUP BY YEAR(Order_Date), WEEK(Order_Date)
ORDER BY Year, Week;

-- DATEDIFF()
SELECT
Order_ID,
Customer_Name,
Order_Date,
Ship_Date,
DATEDIFF(Ship_Date, Order_Date) AS Days_To_Ship
FROM orders
WHERE DATEDIFF(Ship_Date, Order_Date) > 5
ORDER BY Days_To_Ship DESC;



