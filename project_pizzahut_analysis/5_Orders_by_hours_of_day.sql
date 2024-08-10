/* Determine the distribution of orders by hours of the day */

SELECT
    EXTRACT(HOUR FROM orders.time) AS hour,
    COUNT(order_details.order_details_id)
FROM 
    orders
LEFT JOIN order_details
    ON
        orders.order_id = order_details.order_id
GROUP BY
    hour
ORDER BY
    count DESC        

/*
Analysis and Trends

Peak Hours:
The highest number of orders is at 12 PM (6,543 orders) and 1 PM (6,203 orders). This indicates a significant lunch rush, suggesting that many customers prefer ordering pizzas around midday.
Evening Surge:
There is another peak in the evening, with high order counts at 6 PM (5,359 orders) and 5 PM (5,143 orders). This suggests a strong preference for pizza during dinner time as well.
Gradual Decline:
After the evening peak, the number of orders gradually declines, with a noticeable drop after 9 PM. The lowest order counts are observed late at night and early in the morning.

Result:
[
  {
    "hour": "12",
    "count": "6543"
  },
  {
    "hour": "13",
    "count": "6203"
  },
  {
    "hour": "18",
    "count": "5359"
  },
  {
    "hour": "17",
    "count": "5143"
  },
  {
    "hour": "19",
    "count": "4350"
  },
  {
    "hour": "16",
    "count": "4185"
  },
  {
    "hour": "14",
    "count": "3521"
  },
  {
    "hour": "20",
    "count": "3487"
  },
  {
    "hour": "15",
    "count": "3170"
  },
  {
    "hour": "11",
    "count": "2672"
  },
  {
    "hour": "21",
    "count": "2528"
  },
  {
    "hour": "22",
    "count": "1370"
  },
  {
    "hour": "23",
    "count": "68"
  },
  {
    "hour": "10",
    "count": "17"
  },
  {
    "hour": "9",
    "count": "4"
  }
]
*/