/*Identify the most common pizza size ordered*/

SELECT 
    pizzas.size,
    count(pizzas.pizza_id)
FROM
    pizzas
JOIN
    order_details
        ON
        pizzas.pizza_id = order_details.pizza_id
GROUP BY
    pizzas.size
ORDER BY
    count DESC    