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

/* Results:
[
  {
    "day": "2015-01-01",
    "comulative_total_revenue": "2713.85"
  },
  {
    "day": "2015-01-02",
    "comulative_total_revenue": "5445.75"
  },
  {
    "day": "2015-01-03",
    "comulative_total_revenue": "8108.15"
  },
  {
    "day": "2015-01-04",
    "comulative_total_revenue": "9863.60"
  },
  {
    "day": "2015-01-05",
    "comulative_total_revenue": "11929.55"
  },
  {
    "day": "2015-01-06",
    "comulative_total_revenue": "14358.50"
  },
  {
    "day": "2015-01-07",
    "comulative_total_revenue": "16560.70"
  },
  {
    "day": "2015-01-08",
    "comulative_total_revenue": "19399.05"
  },
  {
    "day": "2015-01-09",
    "comulative_total_revenue": "21526.40"
  },
  {
    "day": "2015-01-10",
    "comulative_total_revenue": "23990.35"
  },
  {
    "day": "2015-01-11",
    "comulative_total_revenue": "25862.65"
  },
  {
    "day": "2015-01-12",
    "comulative_total_revenue": "27781.70"
  },
  {
    "day": "2015-01-13",
    "comulative_total_revenue": "29831.30"
  },
  {
    "day": "2015-01-14",
    "comulative_total_revenue": "32358.70"
  },
  {
    "day": "2015-01-15",
    "comulative_total_revenue": "34343.50"
  },
  {
    "day": "2015-01-16",
    "comulative_total_revenue": "36937.65"
  },
  {
    "day": "2015-01-17",
    "comulative_total_revenue": "39001.75"
  },
  {
    "day": "2015-01-18",
    "comulative_total_revenue": "40978.60"
  },
  {
    "day": "2015-01-19",
    "comulative_total_revenue": "43365.75"
  },
  {
    "day": "2015-01-20",
    "comulative_total_revenue": "45763.65"
  },
  {
    "day": "2015-01-21",
    "comulative_total_revenue": "47804.20"
  },
  {
    "day": "2015-01-22",
    "comulative_total_revenue": "50300.90"
  },
  {
    "day": "2015-01-23",
    "comulative_total_revenue": "52724.60"
  },
  {
    "day": "2015-01-24",
    "comulative_total_revenue": "55013.85"
  },
  {
    "day": "2015-01-25",
    "comulative_total_revenue": "56631.40"
  },......
*/