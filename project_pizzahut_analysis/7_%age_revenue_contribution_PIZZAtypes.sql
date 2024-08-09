/* Calculate the percentage contribution of each 
       pizza types to total revenue */

SELECT
    pizza_types.category,
    -- order_details.quantity,
    -- pizzas.price,
    SUM(pizzas.price*order_details.quantity) AS total_revenue,
   ROUND((( 
    (SUM(pizzas.price*order_details.quantity))
    /
        817860.05)*100),2) AS percent
FROM
    pizza_types
LEFT JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
LEFT JOIN
    order_details ON
        pizzas.pizza_id=order_details.pizza_id
GROUP BY
    pizza_types.category
ORDER BY
    total_revenue DESC        

-- TOTAL SUM OF REVENUE = 817860.05    