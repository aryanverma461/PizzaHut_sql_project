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