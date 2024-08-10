/* Group the orders by date and calculate the average
   number of pizza ordered per day */

SELECT
    EXTRACT(DAY FROM orders.date) AS DATE,
    COUNT(order_details.order_details_id)
FROM 
    orders
LEFT JOIN order_details
    ON
        orders.order_id = order_details.order_id
GROUP BY
    EXTRACT(DAy FROM orders.date)
ORDER BY
    count DESC        

/*
Analysis and Trends
High Order Days:
The 15th of the month has the highest number of orders, with 1,844 pizzas ordered. This could indicate a mid-month peak in customer demand.
Consistent Demand:
The order counts are relatively consistent throughout the month, with most days having over 1,400 orders. This suggests a steady demand for pizzas across different dates.
End of Month Dip:
There is a noticeable dip in orders on the 31st, with only 996 orders. This could be due to various factors such as customers waiting for the next month or budget constraints at the end of the month.

Result:
[
  {
    "date": "15",
    "count": "1844"
  },
  {
    "date": "1",
    "count": "1782"
  },
  {
    "date": "4",
    "count": "1773"
  },
  {
    "date": "27",
    "count": "1763"
  },
  {
    "date": "6",
    "count": "1673"
  },
  {
    "date": "3",
    "count": "1660"
  },
  {
    "date": "9",
    "count": "1656"
  },
  {
    "date": "11",
    "count": "1655"
  },
  {
    "date": "20",
    "count": "1650"
  },
  {
    "date": "17",
    "count": "1649"
  },
  {
    "date": "7",
    "count": "1647"
  },
  {
    "date": "8",
    "count": "1646"
  },
  {
    "date": "14",
    "count": "1643"
  },
  {
    "date": "13",
    "count": "1643"
  },
  {
    "date": "2",
    "count": "1624"
  },
  {
    "date": "16",
    "count": "1609"
  },
  {
    "date": "10",
    "count": "1601"
  },
  {
    "date": "23",
    "count": "1595"
  },
  {
    "date": "18",
    "count": "1589"
  },
  {
    "date": "21",
    "count": "1560"
  },
  {
    "date": "24",
    "count": "1546"
  },
  {
    "date": "26",
    "count": "1504"
  },
  {
    "date": "22",
    "count": "1484"
  },
  {
    "date": "19",
    "count": "1463"
  },
  {
    "date": "28",
    "count": "1450"
  },
  {
    "date": "12",
    "count": "1443"
  },
  {
    "date": "30",
    "count": "1439"
  },
  {
    "date": "5",
    "count": "1427"
  },
  {
    "date": "29",
    "count": "1361"
  },
  {
    "date": "25",
    "count": "1245"
  },
  {
    "date": "31",
    "count": "996"
  }
]
*/