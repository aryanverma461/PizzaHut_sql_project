/*Calculated the total revenue generated from the pizza
      sales   */
SELECT
    SUM(order_details.quantity*pizzas.price) AS SUM
FROM
     order_details
INNER JOIN pizzas 
    ON 
    order_details.pizza_id = pizzas.pizza_id

/*Calculated the total revenue generated from the pizza
      sales by each order_quantity  */

SELECT
    order_details.quantity,
    -- pizzas.price,
    SUM(order_details.quantity*pizzas.price) AS SUM
FROM
     order_details
INNER JOIN pizzas 
    ON 
    order_details.pizza_id = pizzas.pizza_id
GROUP BY order_details.quantity
ORDER BY
        sum DESC