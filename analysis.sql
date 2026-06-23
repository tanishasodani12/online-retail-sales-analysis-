-- ================================================
-- Online Retail Sales Analysis
-- Business Questions answered using SQL
-- ================================================

-- Question 1: How has monthly revenue trended over the year?
SELECT
    YEAR(COALESCE(
        STR_TO_DATE(InvoiceDate, '%m-%d-%Y %H:%i'),
        STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'),
        STR_TO_DATE(InvoiceDate, '%c/%e/%Y %k:%i')
    )) AS sale_year,
    MONTH(COALESCE(
        STR_TO_DATE(InvoiceDate, '%m-%d-%Y %H:%i'),
        STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'),
        STR_TO_DATE(InvoiceDate, '%c/%e/%Y %k:%i')
    )) AS sale_month,
    ROUND(SUM(TotalSales), 2) AS monthly_revenue
FROM online_retail
WHERE Quantity > 0
GROUP BY sale_year, sale_month
ORDER BY sale_year, sale_month;

-- Question 2: Which products drive the most revenue?
SELECT
    Description AS product_name,
    ROUND(SUM(TotalSales), 2) AS total_revenue,
    SUM(Quantity) AS units_sold
FROM online_retail
WHERE Quantity > 0
AND Description IS NOT NULL
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;

-- Question 3: Who are the highest-value customers?
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    ROUND(SUM(TotalSales), 2) AS total_revenue,
    ROUND(AVG(TotalSales), 2) AS avg_order_value
FROM online_retail
WHERE CustomerID IS NOT NULL
AND Quantity > 0
GROUP BY CustomerID
ORDER BY total_revenue DESC
LIMIT 10;

-- Question 4: Which countries generate the most revenue?
SELECT
    Country,
    ROUND(SUM(TotalSales), 2) AS total_revenue,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM online_retail
WHERE Quantity > 0
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 15;

-- Question 5a: What time of day has the highest sales?
SELECT
    HOUR(COALESCE(
        STR_TO_DATE(InvoiceDate, '%m-%d-%Y %H:%i'),
        STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'),
        STR_TO_DATE(InvoiceDate, '%c/%e/%Y %k:%i')
    )) AS hour_of_day,
    ROUND(SUM(TotalSales), 2) AS total_sales
FROM online_retail
WHERE Quantity > 0
GROUP BY hour_of_day
ORDER BY hour_of_day ASC;

-- Question 5b: Which day of the week has the highest sales?
SELECT
    DAYNAME(COALESCE(
        STR_TO_DATE(InvoiceDate, '%m-%d-%Y %H:%i'),
        STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'),
        STR_TO_DATE(InvoiceDate, '%c/%e/%Y %k:%i')
    )) AS day_of_week,
    ROUND(SUM(TotalSales), 2) AS total_sales
FROM online_retail
WHERE Quantity > 0
GROUP BY day_of_week
ORDER BY FIELD(day_of_week,
    'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');
