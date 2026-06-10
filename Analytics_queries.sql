/* Total Revenue */
SELECT
    SUM(p.price * od.quantity) AS total_revenue
FROM Order_Details od
JOIN Products p
ON od.product_id = p.product_id;

/* Revenue by Customer */
SELECT
    c.customer_name,
    SUM(p.price * od.quantity) AS revenue
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Products p
    ON od.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC;

/* Top Selling Products */
SELECT
    p.product_name,
    SUM(od.quantity) AS total_units_sold
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC;

/* Revenue By Category */
SELECT
    p.category,
    SUM(p.price * od.quantity) AS revenue
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
GROUP BY p.category
ORDER BY revenue DESC;

/* Customer Ranking */
SELECT
    c.customer_name,
    SUM(p.price * od.quantity) AS revenue,
    RANK() OVER (
        ORDER BY SUM(p.price * od.quantity) DESC
    ) AS customer_rank
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Products p
    ON od.product_id = p.product_id
GROUP BY c.customer_name;


WITH CustomerRevenue AS (
    SELECT
        c.customer_name,
        SUM(p.price * od.quantity) AS revenue
    FROM Customers c
    JOIN Orders o
        ON c.customer_id = o.customer_id
    JOIN Order_Details od
        ON o.order_id = od.order_id
    JOIN Producta
)

SELECT *
FROM CustomerRevenue
WHERE revenue > 10000;

/* Include Customers with No Orders */
SELECT
    c.customer_name,
    COALESCE(SUM(p.price * od.quantity), 0) AS revenue
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
LEFT JOIN Order_Details od
    ON o.order_id = od.order_id
LEFT JOIN Products p
    ON od.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC;

/* Monthly Sales Trend */
SELECT
    MONTH(o.order_date) AS month_no,
    SUM(p.price * od.quantity) AS revenue
FROM Orders o
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Products p
    ON od.product_id = p.product_id
GROUP BY MONTH(o.order_date)
ORDER BY month_no;

/* Customer Ranking */
SELECT
    c.customer_name,
    SUM(p.price * od.quantity) AS revenue,
    RANK() OVER (
        ORDER BY SUM(p.price * od.quantity) DESC
    ) AS customer_rank
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Products p
    ON od.product_id = p.product_id
GROUP BY c.customer_name;

/* CTE */
WITH CustomerRevenue AS (
    SELECT
        c.customer_name,
        SUM(p.price * od.quantity) AS revenue
    FROM Customers c
    JOIN Orders o
        ON c.customer_id = o.customer_id
    JOIN Order_Details od
        ON o.order_id = od.order_id
    JOIN Products p
        ON od.product_id = p.product_id
    GROUP BY c.customer_name
)

SELECT *
FROM CustomerRevenue
WHERE revenue > 10000;

/* Top Product in each Category */
WITH ProductSales AS (
    SELECT
        p.category,
        p.product_name,
        SUM(od.quantity) AS total_sold,
        RANK() OVER(
            PARTITION BY p.category
            ORDER BY SUM(od.quantity) DESC
        ) AS product_rank
    FROM Products p
    JOIN Order_Details od
        ON p.product_id = od.product_id
    GROUP BY p.category, p.product_name
)

SELECT *
FROM ProductSales
WHERE product_rank = 1;
