-- Задание 1: Количество товаров по категориям
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- Задание 2: Общая выручка
SELECT SUM(quantity * price_per_unit) AS total_revenue
FROM order_Items;

-- Задание 3: Количество заказов на клиента
SELECT c.full_name, COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name;

-- Задание 4: Средний чек
SELECT AVG(order_total) AS avg_order_value
FROM (
    SELECT order_id, SUM(quantity * price_per_unit) AS order_total
    FROM order_items
    GROUP BY order_id
);

-- Задание 5: Статус заказов
SELECT status, COUNT(*) AS status_count
FROM orders
GROUP BY status;

-- Задание 6: "Крупные" категории (HAVING)
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
HAVING COUNT(*) > 1;

-- Задание 7: "Лояльные" клиенты (HAVING)
SELECT c.full_name, COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.full_name
HAVING COUNT(o.order_id) > 1;

-- Задание 8 (со звездочкой): Самый продаваемый товар
SELECT p.product_name
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY SUM(oi.quantity) DESC LIMIT 1;
