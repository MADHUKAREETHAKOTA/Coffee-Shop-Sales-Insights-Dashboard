-- Active: 1749535200680@@127.0.0.1@3306@coffee_shop_sales
use Coffee_Shop_Sales;

SELECT * FROM `coffee_sales`;

DESC `coffee_sales`;

UPDATE `coffee_sales`
SET date = STR_TO_DATE(date, '%d-%m-%Y')
WHERE STR_TO_DATE(date, '%d-%m-%Y') IS NOT NULL;

SELECT * FROM `coffee_sales`
WHERE STR_TO_DATE(date, '%d-%m-%Y') IS NULL;

ALTER TABLE `coffee_sales`
MODIFY COLUMN `Date` DATE;


-- Add Year and Month fields
SELECT 
  *,
  YEAR(STR_TO_DATE(DATE, '%Y-%m-%d')) AS year,
  MONTH(STR_TO_DATE(DATE, '%Y-%m-%d')) AS Month
FROM `coffee_sales`;


-- Total Revenue and Total Profit
SELECT 
  ROUND(SUM(REVENUE),2) AS Total_revenue,
  ROUND(SUM(`PROFIT MARGIN`),2) AS Total_profit
FROM `coffee_sales`;


-- Average transaction value
SELECT 
  ROUND(AVG(REVENUE),2) AS Avg_transaction_value
FROM `coffee_sales`;


-- Revenue by City
SELECT City, ROUND(SUM(REVENUE),2) AS City_revenue
FROM `coffee_sales`
GROUP BY City
ORDER BY City_revenue DESC;


-- Profit by Branch
SELECT Branch, ROUND(SUM(`PROFIT MARGIN`),2) AS Branch_profit
FROM `coffee_sales`
GROUP BY Branch
ORDER BY Branch_profit DESC;


-- Top 5 Products by Revenue
SELECT `PRODUCT ID`, ROUND(SUM(REVENUE),2) AS Total_revenue
FROM `coffee_sales`
GROUP BY `PRODUCT ID`
ORDER BY Total_revenue DESC
LIMIT 5;


-- Most sold product categories
SELECT `PRODUCT CATEGORY`, SUM(`QTY SOLD`) AS Total_qty
FROM `coffee_sales`
GROUP BY `PRODUCT CATEGORY`
ORDER BY Total_qty DESC;


-- Monthly Revenue Trend
SELECT 
  YEAR(STR_TO_DATE(DATE, '%Y-%m-%d')) AS year,
  MONTH(STR_TO_DATE(DATE, '%Y-%m-%d')) AS month,
  ROUND(SUM(REVENUE),2) AS Monthly_revenue
FROM `coffee_sales`
GROUP BY year, month
ORDER BY year, month;
