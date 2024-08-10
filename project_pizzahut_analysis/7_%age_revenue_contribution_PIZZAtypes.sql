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

/*
Analysis and Trends
Classic Pizzas Lead in Revenue:
Classic pizzas contribute the most to total revenue, accounting for 26.91%. This indicates a strong preference for traditional pizza options among customers.
Close Competition Among Categories:
The revenue contributions of Supreme, Chicken, and Veggie pizzas are quite close, with percentages of 25.46%, 23.96%, and 23.68% respectively. This suggests a balanced demand across different pizza categories.
Diverse Preferences:
The relatively even distribution of revenue among the four categories indicates that customers enjoy a variety of pizza types, from classic to specialty options

Result:
[
  {
    "category": "Classic",
    "total_revenue": "220053.10",
    "percent": "26.91"
  },
  {
    "category": "Supreme",
    "total_revenue": "208197.00",
    "percent": "25.46"
  },
  {
    "category": "Chicken",
    "total_revenue": "195919.50",
    "percent": "23.96"
  },
  {
    "category": "Veggie",
    "total_revenue": "193690.45",
    "percent": "23.68"
  }
]
*/