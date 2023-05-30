--Create a footwear designer database

CREATE TABLE footwear_designer (id INTEGER PRIMARY KEY,productname TEXT, size INTEGER, quantity INTEGER, price INTEGER, aisle INTEGER);

INSERT INTO footwear_designer 
VALUES 
(101, "Adidas", 34, 11, 4550, 1),
(102, "Balenciaga", 35, 20, 3500, 3),
(103, "Balmain", 36, 60, 4000, 2),
(104, "Calvin Klein", 37, 43, 4570, 4),
(105, "Dolce & Gabbana", 38, 35, 6700, 5),
(106, "Fendi", 39, 58, 5000, 7),
(107, "Gucci", 40, 61, 5860, 6),
(108, "Louis Vuitton", 39, 12, 7000, 9),
(109, "Philipp Plein", 42, 42, 4700, 10),
(110, "Ralph & Russo", 37, 40, 8580, 8),
(111, "Sergio Rossi", 41, 46, 10000, 3),
(112, "Tom Ford", 38, 33, 7300, 7),
(113, "Versace", 40, 30, 9000, 1),
(114, "Zara", 39, 48, 6800, 6),
(115, "Givenchy", 35, 21, 4300, 5)
;

--displaying all from the database
SELECT * FROM footwear_designer;

--ordering all items by price
SELECT * FROM footwear_designer ORDER BY price;

--calculating sum of all prices
SELECT SUM(price) FROM footwear_designer;

--displaying the name of the product with maximum price 
SELECT productname, MAX(price) FROM footwear_designer;

--displaying the name of the product with minimum price
SELECT productname, MIN(price) FROM footwear_designer;

--displaying the average price of products
SELECT AVG(price) FROM footwear_designer;

--displaying all products with prices greater than or equal to 5700 
SELECT * FROM footwear_designer WHERE price >= 5700;

--displaying all products with prices reater than or equal to 5700 ordered by price in descending order
SELECT * FROM footwear_designer WHERE price >= 5700 order BY price desc;

--displaying all products where size is 42
SELECT * FROM footwear_designer WHERE size = 42;

--displaying all products where quantity is less than 35 
SELECT * FROM footwear_designer WHERE quantity < 35 ORDER BY aisle;

--displaying only 7 products ordered by price in ascending order
SELECT * FROM footwear_designer ORDER BY price asc limit 7;


