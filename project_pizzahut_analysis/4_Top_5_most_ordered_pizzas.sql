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

/*Insights = The Classic Deluxe Pizza is the most ordered, with 2,453 orders. This suggests that customers enjoy a pizza with a variety of toppings, 
likely including a mix of meats and vegetables.
The Barbecue Chicken Pizza and The Hawaiian Pizza follow closely, indicating a preference for unique and flavorful combinations

Result:
[
  {
    "name": "The Classic Deluxe Pizza",
    "sum": "2453"
  },
  {
    "name": "The Barbecue Chicken Pizza",
    "sum": "2432"
  },
  {
    "name": "The Hawaiian Pizza",
    "sum": "2422"
  },
  {
    "name": "The Pepperoni Pizza",
    "sum": "2418"
  },
  {
    "name": "The Thai Chicken Pizza",
    "sum": "2371"
  }
]*/    