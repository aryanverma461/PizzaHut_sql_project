/* Analyze the cumulative revenue generated over time*/

WITH sales AS 
    (SELECT
    orders.date AS day,
    SUM(pizzas.price*order_details.quantity) AS revenue
FROM
    orders
INNER JOIN
    order_details ON 
     orders.order_id=order_details.order_id
INNER JOIN
    pizzas ON
        order_details.pizza_id=pizzas.pizza_id  
GROUP BY
    orders.date )
SELECT day,
    SUM(revenue) OVER (ORDER BY day)
     AS
      comulative_total_revenue
FROM 
  sales