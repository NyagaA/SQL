#In this SQLcode, I'm querying a database that holds Customer and Order data to answer questions asked about the data. 

#1.How many orders were placed in January?

SELECT COUNT(orderid)  
FROM BIT_DB.JanSales
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';


#2.How many of those orders were for an iPhone?

SELECT COUNT(orderid) 
FROM BIT_DB.JanSales
WHERE Product='iPhone'
AND length(orderid) = 6 
AND orderid <> 'Order ID';


#3.Select the customer account numbers for all the orders that were placed in February.
--a
SELECT distinct acctnum
FROM BIT_DB.customers cust
INNER JOIN BIT_DB.FebSales Feb
ON cust.order_id=FEB.orderid
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';

--b
SELECT acctnum FROM BIT_DB.customers a
JOIN BIT_DB.Febsales b
ON a.order_id=b.orderID
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';


#4.Which product was the cheapest one sold in January, and what was the price?
--a
SELECT product, MIN(price) as minprice 
FROM BIT_DB.JanSales 
WHERE length(orderid) = 6 
AND orderID <> 'Order ID';

--b
SELECT distinct Product, price
FROM BIT_DB.JanSales
WHERE  price in (SELECT min(price) FROM BIT_DB.JanSales);

--c
SELECT distinct product, price 
FROM BIT_DB.JanSales 
ORDER BY price ASC 
LIMIT 1;

--d
SELECT distinct product, MIN(price) 
FROM BIT_DB.JanSales Jan 
GROUP BY product, price 
ORDER BY price ASC 
LIMIT 1;

--e
SELECT product, min(price) 
FROM BIT_DB.JanSales Jan 
GROUP BY product, price 
ORDER BY price ASC
LIMIT 1;


#5.What is the total revenue for each product sold in January? (Revenue can be calculated using the number of products sold and the price of the products).

SELECT product, SUM(Quantity)*price as Totalrevenue 
FROM BIT_DB.JanSales 
WHERE length(orderid) = 6                                     --FILTERED
AND orderID <> 'Order ID'
GROUP BY Product

SELECT SUM(quantity)*price as revenue, product
FROM BIT_DB.JanSales
GROUP BY product;


#6.Which products were sold in February at 548 Lincoln St, Seattle, WA 98101, how many of each were sold, and what was the total revenue?

SELECT product, SUM(Quantity), SUM(Quantity)*price as Totalrevenue 
FROM BIT_DB.FebSales
WHERE location = '548 Lincoln St, Seattle, WA 98101'
GROUP BY Product;


#7.How many customers ordered more than 2 products at a time in February, and what was the average amount spent for those customers?

SELECT COUNT(distinct cust.acctnum), AVG(quantity*price)
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON FEB.orderid=cust.order_id
WHERE Feb.Quantity>2
AND length(orderid) = 6 
AND orderid <> 'Order ID';


#8.List all the products sold in Los Angeles in February, and include how many of each were sold.

SELECT product, location, SUM(Quantity)
FROM BIT_DB.FebSales
WHERE location LIKE '%Los Angeles%'
GROUP BY product;


#9.Which locations in New York received at least 3 orders in January, and how many orders did they each receive? 
--a
SELECT distinct location, COUNT(orderid) as Orders    
FROM BIT_DB.JanSales
WHERE location LIKE '%New York%'
AND length(orderid) = 6 
AND orderid <> 'Order ID'
GROUP BY location
HAVING count(orderID)>2;

--b
SELECT distinct location, COUNT(orderid)                       
FROM BIT_DB.JanSales
WHERE location LIKE '%New York%'
AND length(orderid) = 6 
AND orderid <> 'Order ID'
GROUP BY location
HAVING count(orderID)>=3;


#10.How many of each type of headphone were sold in February?

SELECT sum(Quantity) as quantity, Product
FROM BIT_DB.FebSales 
WHERE Product like '%Headphones%'
GROUP BY Product;


#11.What was the average amount spent per account in February?
--a
SELECT SUM(Quantity*Price)/COUNT(b.acctnum) as AVGamnt_acc 
FROM BIT_DB.FebSales a 
LEFT JOIN BIT_DB.customers b
ON a.orderid=b.order_id
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';

--b
SELECT SUM(quantity*price)/count(cust.acctnum) 
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON FEB.orderid=cust.order_id
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';

--c
SELECT aAVG(quantity*price)      
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON FEB.orderid=cust.order_id
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';


#12.What was the average quantity of products purchased per account in February?

SELECT SUM(quantity)/count(cust.acctnum)  
FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON FEB.orderid=cust.order_id
WHERE length(orderid) = 6 
AND orderid <> 'Order ID';

#13.Which product brought in the most revenue in January and how much revenue did it bring in total?
--a
SELECT product, SUM(Quantity*price) as Revenue 
FROM BIT_DB.JanSales
GROUP BY product
ORDER BY Revenue DESC
LIMIT 1;

--b
SELECT product, SUM(quantity*price)
FROM BIT_DB.JanSales 
GROUP BY product
ORDER BY SUM(quantity*price) DESC
LIMIT 1;
