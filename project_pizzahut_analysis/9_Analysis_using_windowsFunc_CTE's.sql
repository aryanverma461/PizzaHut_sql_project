/* USING_MATHOD 1>> Deterrmine the top 3 most ordred pizza types
       based on revenue for each pizza category */

WITH ranked_pizzas AS (
    SELECT
        pizza_types.category AS categories,
        pizza_types.name AS names,
        SUM(pizzas.price * order_details.quantity) AS revenue,
        ROW_NUMBER() OVER (PARTITION BY pizza_types.category ORDER BY SUM(pizzas.price * order_details.quantity) DESC) AS rank
    FROM
        pizza_types
    INNER JOIN
        pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
    INNER JOIN
        order_details ON pizzas.pizza_id = order_details.pizza_id
    GROUP BY
        pizza_types.category,
        pizza_types.name
)
SELECT
    categories,
    names,
    revenue
FROM
    ranked_pizzas
WHERE
    rank <= 3
ORDER BY
    categories,
    revenue DESC;

/* USING_MATHOD 2>> Deterrmine the top 3 most ordred pizza types
       based on revenue for each pizza category */

SELECT 
    names,
    revenue
FROM
(SELECT categories,
        names,
        revenue,
        rank() OVER (PARTITION BY categories ORDER BY revenue desc)
     AS rank  
FROM       
(SELECT
    pizza_types.category as categories,
    pizza_types.name as names,
    SUM(pizzas.price*order_details.quantity) AS revenue
FROM
    pizza_types
INNER JOIN
    pizzas ON
     pizza_types.pizza_type_id=pizzas.pizza_type_id
INNER JOIN
    order_details ON
        pizzas.pizza_id=order_details.pizza_id
GROUP BY categories,
    names
ORDER BY category, revenue DESC) AS s) AS b
WHERE
    rank<=3