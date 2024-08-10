/*Calculated the total revenue generated from the pizza
      sales   */
SELECT
    SUM(order_details.quantity*pizzas.price) AS SUM
FROM
     order_details
INNER JOIN pizzas 
    ON 
    order_details.pizza_id = pizzas.pizza_id

/* RESULT:
[
  {
    "sum": "817860.05"
  }
]
*/


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

/*Insights generated:
The data indicates that customers are more likely to purchase single pizzas rather 
than multiple pizzas in one order. This could be due to individual dining 
preferences or smaller group sizes.

Result:
[
  {
    "quantity": 1,
    "sum": "786457.10"
  },
  {
    "quantity": 2,
    "sum": "30209.20"
  },
  {
    "quantity": 3,
    "sum": "1014.75"
  },
  {
    "quantity": 4,
    "sum": "179.00"
  }
]
*/