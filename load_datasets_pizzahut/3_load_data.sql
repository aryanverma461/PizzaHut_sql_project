/* Written copy cammand to insert data from csv file into the
   postgreSQL Database */ 

COPY orders
FROM 'C:\Users\verma\Downloads\pizza_sales\pizza_sales\orders.csv'
DELIMITER ',' 
CSV HEADER;

COPY pizza_types
FROM 'C:\Users\verma\Downloads\pizza_sales\pizza_sales\pizza_types.csv'
DELIMITER ',' 
CSV HEADER;

COPY pizzas
FROM 'C:\Users\verma\Downloads\pizza_sales\pizza_sales\pizzas.csv'
DELIMITER ',' 
CSV HEADER;

COPY order_details
FROM 'C:\Users\verma\Downloads\pizza_sales\pizza_sales\order_details.csv'
DELIMITER ',' 
CSV HEADER;