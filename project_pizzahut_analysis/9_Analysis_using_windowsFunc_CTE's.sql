/* USING_MATHOD 1>> Deterrmine the top 3 most ordred pizza types
       based on revenue for each pizza category */

WITH ranked_pizzas AS (
    SELECT
        pizza_types.category AS categories,
        pizza_types.name AS names,
        SUM(pizzas.price * order_details.quantity) AS revenue,
        ROW_NUMBER() OVER (PARTITION BY pizza_types.category ORDER BY SUM(pizzas.price * order_details.quantity) DESC) AS rank
    FROM
        pizza_types
    INNER JOIN
        pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
    INNER JOIN
        order_details ON pizzas.pizza_id = order_details.pizza_id
    GROUP BY
        pizza_types.category,
        pizza_types.name
)
SELECT
    categories,
    names,
    revenue
FROM
    ranked_pizzas
WHERE
    rank <= 3
ORDER BY
    categories,
    revenue DESC;

/* USING_MATHOD 2>> Deterrmine the top 3 most ordred pizza types
       based on revenue for each pizza category */

SELECT 
    names,
    revenue
FROM
(SELECT categories,
        names,
        revenue,
        rank() OVER (PARTITION BY categories ORDER BY revenue desc)
     AS rank  
FROM       
(SELECT
    pizza_types.category as categories,
    pizza_types.name as names,
    SUM(pizzas.price*order_details.quantity) AS revenue
FROM
    pizza_types
INNER JOIN
    pizzas ON
     pizza_types.pizza_type_id=pizzas.pizza_type_id
INNER JOIN
    order_details ON
        pizzas.pizza_id=order_details.pizza_id
GROUP BY categories,
    names
ORDER BY category, revenue DESC) AS s) AS b
WHERE
    rank<=3


/*
Analysis and Trends

Chicken Pizzas:
The Thai Chicken Pizza leads the category with a revenue of ₹43,434.25, followed closely by The Barbecue Chicken Pizza and The California Chicken Pizza. This indicates a strong preference for chicken-based pizzas with unique flavors.
Classic Pizzas:
The Classic Deluxe Pizza is the top performer in the Classic category, generating ₹38,180.50 in revenue. The Hawaiian Pizza and The Pepperoni Pizza also contribute significantly, showing a preference for traditional and well-loved pizza options.
Supreme Pizzas:
The Spicy Italian Pizza tops the Supreme category with ₹34,831.25 in revenue, followed by The Italian Supreme Pizza and The Sicilian Pizza. Customers seem to enjoy pizzas with rich and diverse toppings.
Veggie Pizzas:
The Four Cheese Pizza is the most popular in the Veggie category, with a revenue of ₹32,265.70. The Mexicana Pizza and The Five Cheese Pizza also perform well, indicating a demand for flavorful vegetarian options.

Result:
[
  {
    "categories": "Chicken",
    "names": "The Thai Chicken Pizza",
    "revenue": "43434.25"
  },
  {
    "categories": "Chicken",
    "names": "The Barbecue Chicken Pizza",
    "revenue": "42768.00"
  },
  {
    "categories": "Chicken",
    "names": "The California Chicken Pizza",
    "revenue": "41409.50"
  },
  {
    "categories": "Classic",
    "names": "The Classic Deluxe Pizza",
    "revenue": "38180.5"
  },
  {
    "categories": "Classic",
    "names": "The Hawaiian Pizza",
    "revenue": "32273.25"
  },
  {
    "categories": "Classic",
    "names": "The Pepperoni Pizza",
    "revenue": "30161.75"
  },
  {
    "categories": "Supreme",
    "names": "The Spicy Italian Pizza",
    "revenue": "34831.25"
  },
  {
    "categories": "Supreme",
    "names": "The Italian Supreme Pizza",
    "revenue": "33476.75"
  },
  {
    "categories": "Supreme",
    "names": "The Sicilian Pizza",
    "revenue": "30940.50"
  },
  {
    "categories": "Veggie",
    "names": "The Four Cheese Pizza",
    "revenue": "32265.70"
  },
  {
    "categories": "Veggie",
    "names": "The Mexicana Pizza",
    "revenue": "26780.75"
  },
  {
    "categories": "Veggie",
    "names": "The Five Cheese Pizza",
    "revenue": "26066.5"
  }
]
*/    