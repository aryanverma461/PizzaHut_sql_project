/* Identify the highest prized pizza */

SELECT 
    pizza_types.name AS pizza_name,
    MAX(pizzas.price) AS max_price
FROM
    pizza_types
INNER JOIN
    pizzas ON
   pizza_types.pizza_type_id = pizzas.pizza_type_id 
GROUP BY
    pizza_name
ORDER BY max_price DESC 
LIMIT 1 