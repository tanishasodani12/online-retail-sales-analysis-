CREATE DATABASE retail_analytics;
   USE retail_analytics;



drop table onlineretail;
CREATE TABLE onlineretail (
    InvoiceNo VARCHAR(50),
    StockCode VARCHAR(50),
    Description VARCHAR(500),
    Quantity INT,
    InvoiceDate VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(50),
    Country VARCHAR(100),
    TotalSales DECIMAL(10,2)
);



SELECT COUNT(*) FROM onlineretail;
SELECT * FROM onlineretail limit 10 ;

-- total_quantity per prodcut
SELECT 
    Description AS Product_name, 
    SUM(Quantity) AS Total_quantity
FROM onlineretail
GROUP BY Description
ORDER BY total_quantity DESC
LIMIT 10;

-- Total Revenue per prodcut
SELECT 
    Description AS product_name, 
    SUM(TotalSales) AS total_revenue
FROM onlineretail
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;
 
 -- total_sale by time 
 
			-- check date
			SELECT 
				InvoiceDate,
				LENGTH(InvoiceDate) AS date_length,
				STR_TO_DATE(TRIM(InvoiceDate), '%m-%d-%Y %H:%i') AS parsed_date
			FROM onlineretail 
			LIMIT 10;

SELECT 
    HOUR(
        COALESCE(
            STR_TO_DATE(InvoiceDate, '%m-%d-%Y %H:%i'),
            STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'),
            STR_TO_DATE(InvoiceDate, '%c/%e/%Y %k:%i')
        )
    ) AS hour_of_day,
    SUM(TotalSales) AS total_sales_per_hour
FROM onlineretail
GROUP BY hour_of_day
ORDER BY hour_of_day ASC;

-- day sale 

SELECT 
    DAYNAME(
        COALESCE(
            STR_TO_DATE(InvoiceDate, '%m-%d-%Y %H:%i'),
            STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'),
            STR_TO_DATE(InvoiceDate, '%c/%e/%Y %k:%i')
        )
    ) AS day_of_week,
    SUM(TotalSales) AS total_sales_per_day
FROM onlineretail
GROUP BY day_of_week
ORDER BY FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');