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