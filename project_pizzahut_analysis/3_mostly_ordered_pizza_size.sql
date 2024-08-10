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

/*Analysis and Trends
Large (L) Pizzas are the Most Popular:
The data shows that the large size is the most commonly ordered, with 18,526 orders. This indicates a strong preference for larger pizzas among customers.
Medium (M) and Small (S) Sizes are Also Popular:
Medium and small sizes follow closely, with 15,385 and 14,137 orders respectively. This suggests that while large pizzas are the most popular, medium and small sizes are also in high demand.
Low Demand for Extra-Large (XL) and Double Extra-Large (XXL) Pizzas:
Extra-large and double extra-large pizzas have significantly fewer orders, with only 544 and 28 orders respectively. This indicates that these sizes are less popular among customers

Result:
[
  {
    "size": "L",
    "count": "18526"
  },
  {
    "size": "M",
    "count": "15385"
  },
  {
    "size": "S",
    "count": "14137"
  },
  {
    "size": "XL",
    "count": "544"
  },
  {
    "size": "XXL",
    "count": "28"
  }
]
*/    