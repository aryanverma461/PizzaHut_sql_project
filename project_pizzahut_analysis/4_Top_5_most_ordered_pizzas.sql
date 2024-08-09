/* List the top 5 most ordered pizza types along with their quantity */

SELECT
    pizza_types.name,
    SUM(order_details.quantity)
FROM
    order_details
INNER JOIN
    pizzas
        ON
        order_details.pizza_id = pizzas.pizza_id
INNER JOIN
    pizza_types
        ON
        pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY
    pizza_types.name        
ORDER BY
    sum DESC
LIMIT
    5;