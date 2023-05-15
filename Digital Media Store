#Downloaded a dataset called chinook, which represents a digital media store and includes tables for artists, albums, media tracks, invoices, and customers.
#Connected to the chinook database.
#I queried the database to answer some questions asked about the data.
# Note that there are often multiple ways to write SQL to come up with the same answer. 


#1.Show Customers (their full names, customer ID, and country) who are not in the US. (Hint: != or <> can be used to say "is not equal to").

  #ANSWER 1
SELECT FirstName, LastName, CustomerId, Country
FROM customers
WHERE Country <> "USA";

  #ANSWER 2
SELECT FirstName, LastName, CustomerId, Country
FROM chinook.customers
WHERE Country != 'USA';


#2.Show only the Customers from Brazil.

SELECT *
FROM chinook.customers
WHERE Country = "Brazil";


#3.Find the Invoices of customers who are from Brazil. The resulting table should show the customer's full name, Invoice ID, Date of the invoice, and billing country.

SELECT cust.FirstName, cust.LastName, inv.InvoiceId, inv.BillingCountry, inv.InvoiceDate
FROM chinook.invoices as inv 
LEFT JOIN chinook.customers as cust 
on inv.CustomerId = cust.CustomerId 
WHERE inv.BillingCountry = "Brazil";


#4.Show the Employees who are Sales Agents.

SELECT * FROM chinook.employees
WHERE Title = 'Sales Support Agent';


#5.Find a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry
FROM chinook.invoices;


#6.Provide a query that shows the invoices associated with each sales agent. The resulting table should include the Sales Agent's full name.

#(ALL 412 INVOICES BY THE DIFFERENT SALES AGENTS COVERED)

SELECT emp.LastName, emp.Firstname, 
inv.InvoiceId
FROM chinook.Employees emp 
JOIN chinook.Customers cust 
ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices inv 
ON inv.CustomerId = cust.CustomerId;


#7.Show the Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers.

  #ANSWER 1
SELECT inv.Total AS Invoice_Total, cust.FirstName AS CUST_FNAME, cust.LastName AS CUST_LNAME, cust.Country, emp.Firstname AS EMP_FNAME,emp.LastName AS EMP_LNAME 
FROM chinook.Employees emp 
JOIN chinook.Customers cust ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices Inv ON Inv.CustomerId = cust.CustomerId;

  #ANSWER 2
SELECT emp.LastName, emp.Firstname, cust.FirstName, cust.LastName, cust.Country, inv.total
FROM chinook.employees emp 
JOIN chinook.Customers cust ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices Inv ON Inv.CustomerId = cust.CustomerId;


#8.How many Invoices were there in 2009?

#ANSWER 1
SELECT COUNT(*)
FROM chinook.Invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

#ANSWER 2
SELECT Count(*) AS '2009_Invoice'
FROM chinook.invoices 
WHERE InvoiceDate LIKE '2009%';

#ANSWER 3
SELECT Count(InvoiceId) AS '2009_Invoice'
FROM chinook.invoices 
WHERE InvoiceDate LIKE '2009%';


#9.What are the total sales for 2009?

#ANSWER 1
SELECT SUM(Total) AS '2009_TotInvoice'
FROM chinook.invoices 
WHERE InvoiceDate LIKE '2009%';

#ANSWER 2
SELECT SUM(Total)
FROM chinook.Invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

#10.Write a query that includes the purchased track name with each invoice line ID.

SELECT trac.Name, item.InvoiceLineId
FROM chinook.invoice_items item
JOIN chinook.tracks trac
ON item.TrackId = trac.TrackId;


#11.Write a query that includes the purchased track name AND artist name with each invoice line ID.

SELECT ar.name as Artist, t.Name as Track, i.InvoiceLineId
FROM chinook.Invoice_items i
LEFT JOIN chinook.tracks t     
ON i.TrackID=t.TrackID          #invoice_items & tracks to get InvoiceLineId
INNER JOIN chinook.albums a    
ON a.AlbumID=t.AlbumID          #albums & tracks to get Trackname
LEFT JOIN chinook.artists ar   
ON ar.ArtistID=a.ArtistID;      #artists & albums to get the artistname


#12.Provide a query that shows all the Tracks, and include the Album name, Media type, and Genre.

  #ANSWER 1
SELECT trac.Name as Track_Name, alb.Title as Album_Name, media.Name as Media_Type, gen.Name AS Genre
FROM chinook.tracks trac 
JOIN chinook.albums alb
ON trac.AlbumId = alb.AlbumId
JOIN chinook.media_types media
ON trac.MediaTypeId = media.MediaTypeId
JOIN chinook.genres gen
ON trac.GenreId = gen.GenreId;

  #ANSWER 2
SELECT t.Name AS 'Track Name', a.Title AS 'Album Title', m.Name AS 'Media Type', g.Name AS 'Genre'
FROM chinook.tracks t
JOIN chinook.Albums a 
on a.AlbumId = t.AlbumId
JOIN chinook.Media_Types m
on m.MediaTypeId = t.MediaTypeId
JOIN chinook.Genres g
on g.GenreId = t.GenreId;


#13.Show the total sales made by each sales agent.

  #ANSWER 1
SELECT emp.FirstName, emp.LastName,
ROUND(SUM(Inv.Total), 2) as 'Total Sales'             #ROUNDING OFF TO ONLY HAVE 2 DECIMAL PLACES
FROM chinook.Employees emp
JOIN chinook.Customers cust 
ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices Inv 
ON Inv.CustomerId = cust.CustomerId
WHERE emp.Title = 'Sales Support Agent' 
GROUP BY emp.FirstName;

  #ANSWER 2
SELECT ROUND(SUM(inv.total),2) AS Total_Sales,          
emp.title,emp.FirstName, emp.LastName
FROM chinook.customers cust
JOIN chinook.invoices inv
ON cust.CustomerId = inv.CustomerId
JOIN chinook.employees emp
ON cust.SupportRepId = emp.EmployeeId
WHERE emp.title = "Sales Support Agent"
GROUP BY emp.FirstName;                                 #LEAVING OUT GROUP BY WILL SHOW TOTAL SALES OF THE 3 AGENTS AND ONE SALES AGENT NAME



#14.Which sales agent made the most dollars in sales in 2009?

#ANSWER 1
SELECT emp.FirstName, emp.LastName,
ROUND(SUM(Inv.Total), 2) as 'Total Sales' 
FROM chinook.Employees emp
JOIN chinook.Customers cust 
ON cust.SupportRepId = emp.EmployeeId
JOIN chinook.Invoices Inv 
ON Inv.CustomerId = cust.CustomerId
WHERE emp.Title = 'Sales Support Agent' 
AND Inv.InvoiceDate LIKE '2009%' 
GROUP BY emp.FirstName
ORDER BY (round(sum(Inv.Total), 2))  DESC LIMIT 1;

#ANSWER 2
SELECT ROUND(SUM(inv.total),2) AS Total_Sales, 
emp.title,emp.FirstName, emp.LastName
FROM chinook.customers cust
JOIN chinook.invoices inv
ON cust.CustomerId = inv.CustomerId
JOIN chinook.employees emp
ON cust.SupportRepId = emp.EmployeeId
WHERE emp.title = "Sales Support Agent"
AND inv.InvoiceDate LIKE "2009%"
GROUP BY emp.FirstName
ORDER BY Total_Sales DESC;   
