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
