CREATE DATABASE IF NOT EXISTS retail_inventory;
USE retail_inventory;

DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory(
	date Date,
    store_id VARCHAR(30),
    product_id VARCHAR(30),
    category VARCHAR(50),
    region VARCHAR(50),
    inventory_level INT,
    units_sold INT,
    units_ordered INT,
    demand_forecast DECIMAL(10,2),
    price DECIMAL(10,2),
    discount INT,
    weather_condition VARCHAR(30),
    holiday_promotion TINYINT,
    competitor_pricing DECIMAL(10,2),
    seasonality VARCHAR(30)
);

select count(*) from inventory;

# Monthly Sales Trend

SELECT DATE_FORMAT(date,'%Y-%m') as Month,
	sum(units_sold) as total_units_sold
    FROM inventory
    GROUP BY Month
    ORDER BY Month
    ;
    
# Low Stock Risk

SELECT store_id,
       COUNT(*) AS low_stock_risk_days
FROM inventory
WHERE inventory_level <= units_sold * 1.1
GROUP BY store_id
ORDER BY low_stock_risk_days DESC
LIMIT 10;

# Inventory Turnpver

SELECT product_id,
	ROUND(SUM(units_sold)/NULLIF(AVG(inventory_level),0),2) as inventory_turnover
    FROM inventory
    GROUP BY product_id
    ORDER BY inventory_turnover DESC
    LIMIT 10;
    
# Forecast Accuracy

SELECT 
	ROUND(AVG(ABS(units_sold-demand_forecast)/NULLIF(units_sold,0)*100),2) as error_prct
    from inventory;
    
# Effects of Discount

Select discount,
	avg(units_sold) as average_units_sold,
    avg(price) as average_price
    from inventory	
    GROUP BY discount
    ORDER BY discount;
