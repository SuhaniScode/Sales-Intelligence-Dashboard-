-- 1. View combined data (Sales + Customer + Product)
SELECT 
s."Order ID",
s."Order Date",
c."Customer Name",
c.Region,
p."Product Name",
p.Category,
s.Sales,
s.Profit
FROM sales s
JOIN customer c 
ON s."Customer ID" = c."Customer ID"
JOIN product p 
ON s."Product ID" = p."Product ID"
LIMIT 10;


-- 2. Total Sales by Category
SELECT 
p.Category,
SUM(s.Sales) AS total_sales
FROM sales s
JOIN product p 
ON s."Product ID" = p."Product ID"
GROUP BY p.Category
ORDER BY total_sales DESC;


-- 3. Total Profit by Region
SELECT 
c.Region,
SUM(s.Profit) AS total_profit
FROM sales s
JOIN customer c 
ON s."Customer ID" = c."Customer ID"
GROUP BY c.Region
ORDER BY total_profit DESC;


-- 4. Profit vs Loss Analysis
SELECT 
CASE 
WHEN s.Profit < 0 THEN 'Loss'
ELSE 'Profit'
END AS profit_type,
COUNT(*) AS count_orders
FROM sales s
GROUP BY profit_type;


-- 5.Top 10 Customers by Sales
SELECT 
c."Customer Name",
SUM(s.Sales) AS total_spent
FROM sales s
JOIN customer c 
ON s."Customer ID" = c."Customer ID"
GROUP BY c."Customer Name"
ORDER BY total_spent DESC
LIMIT 10;
