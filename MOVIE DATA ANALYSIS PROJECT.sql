/*I downloaded the movies.csv dataset and imported it to Microsoft SQL Server.
I was given the business requirements to satisfy which I did by answering the questions below.*/

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [name]
      ,[rating]
      ,[genre]
      ,[year]
      ,[released]
      ,[score]
      ,[votes]
      ,[director]
      ,[writer]
      ,[star]
      ,[country]
      ,[budget]
      ,[gross]
      ,[company]
      ,[runtime]
  FROM [solasdata].[dbo].[movies]

--1. Code to extract released country from released column
  SELECT 
    SUBSTRING(released, CHARINDEX('(', released) + 1, CHARINDEX(')', released) - CHARINDEX('(', released) - 1) AS released_country
FROM  movies;

--2. Creating movie_data table
  SELECT *
    ,SUBSTRING(released, CHARINDEX('(', released) + 1, CHARINDEX(')', released) - CHARINDEX('(', released) - 1) AS released_country
INTO movies_data
FROM  movies;

--3. Selecting all from movies_data
SELECT * 
FROM movies_data;

--4. What are the top 3 ratings for movies released in the United States?
    --Top 3 ratings for movies released in the United States
    SELECT TOP (3) rating
    ,COUNT(rating) AS UnitedStates_rating
    FROM movies_data
    WHERE released_country = 'United States'
    GROUP BY rating
    ORDER BY COUNT(rating) DESC;

    		-- creating movie_rating table
		SELECT TOP (3) rating
		,COUNT(rating) AS UnitedStates_rating
		INTO movie_rating
		FROM movies_data
		WHERE released_country = 'United States'
		GROUP BY rating
		ORDER BY COUNT(rating) DESC;

--5. What are the Top 10 companies based on number of movies?
    -- Top 10 companies based on number of movies
    SELECT TOP 10 company
    ,COUNT(name) AS Movies_number
    FROM movies_data
    GROUP BY company
    ORDER BY Movies_number DESC;

		-- creating Movies_number table
		SELECT TOP 10 company
		,COUNT(name) AS Movies_number
		INTO Movies_number
		FROM movies_data
		GROUP BY company
		ORDER BY Movies_number DESC;

--6. What are the Top 10 companies in the United Kingdom based on movie revenue?
    --Top 10 companies in the United Kingdom based on movie revenue
    SELECT TOP 10 company
    ,SUM(gross) AS Total_revenue
    FROM movies_data
    WHERE released_country = 'United Kingdom'
    GROUP BY company
    ORDER BY Total_revenue DESC;

		-- creating Total_revenue table
		SELECT TOP 10 company
		,SUM(gross) AS Total_revenue
		INTO Total_revenue
		FROM movies_data
		WHERE released_country = 'United Kingdom'
		GROUP BY company
		ORDER BY Total_revenue DESC;

		SELECT *
		FROM Total_revenue;

--7. What are the Top 10 companies in the countries that begin with “I” based on the movie revenue?
    -- Top 10 companies in the countries that begin with “I” based on the movie revenue
    SELECT TOP 10 company
    ,released_country
    ,SUM(gross) AS Total_revenue
    FROM movies_data
    WHERE released_country LIKE 'I%'
    GROUP BY company,released_country
    ORDER BY Total_revenue DESC;

		--creating I_movie table
		SELECT TOP 10 company
		,released_country
		,SUM(gross) AS Total_revenue
		INTO I_movie
		FROM movies_data
		WHERE released_country LIKE 'I%'
		GROUP BY company,released_country
		ORDER BY Total_revenue DESC;

		SELECT *
		FROM I_movie;

--8.  What is the average movie time for movies in France and any country that contains Germany (released country)
    -- Average movie time for movies in France and any country that contains Germany (released country)
    SELECT ROUND(AVG(runtime),2) average_movie_time
    FROM movies_data
    WHERE released_country = 'France'
    OR released_country LIKE '%Germany%';

		-- creating France_Germany table
		SELECT ROUND(AVG(runtime),2) average_movie_time
		INTO France_Germany
		FROM movies_data
		WHERE released_country = 'France'
		OR released_country LIKE '%Germany%';

    -- Grouped data
    SELECT released_country, ROUND(AVG(runtime),2) average_movie_time
    FROM movies_data
    WHERE released_country = 'France'
    OR released_country LIKE '%Germany%'
    GROUP BY released_country;
    
		-- Creating table France_Germany_group
		SELECT released_country, ROUND(AVG(runtime),2) average_movie_time
		INTO France_Germany_group
		FROM movies_data
		WHERE released_country = 'France'
		OR released_country LIKE '%Germany%'
		GROUP BY released_country;

--9. As a single analyst, what is the average movie time for movies with title that contain ‘love’?
    -- Average movie time for movies with title that contain 'love'
    SELECT ROUND(AVG(runtime),2) average_movie_time
    FROM movies_data
    WHERE name LIKE '%love%';

		--creating love_movie table
		SELECT ROUND(AVG(runtime),2) average_movie_time
		INTO love_movie
		FROM movies_data
		WHERE name LIKE '%love%';


--10. Which company has generated most revenue? How much did they make in 2018?
    -- company that generated most revenue
    SELECT company
    , SUM(gross) AS Total_revenue
    FROM movies_data
    GROUP BY company
    ORDER BY Total_revenue DESC;

    -- how much they made in 2018
    SELECT company
    , SUM(gross) AS Total_revenue
    FROM movies_data
    WHERE company = 'Warner Bros.'
    AND year = 2018
    GROUP BY company
    ORDER BY Total_revenue DESC;

		-- Creating Warner Bros. table
		SELECT company
		, SUM(gross) AS Total_revenue
		INTO Warner_Bros
		FROM movies_data
		WHERE company = 'Warner Bros.'
		AND year = 2018
		GROUP BY company
		ORDER BY Total_revenue DESC;

		

--11. Which star has been featured in most movies? What are the top 3 movies genre he/she has acted in?
		--Query to find the star with the most appearances
    SELECT TOP 1 star
    ,COUNT(star) AS featured_movies
    FROM movies_data
    GROUP BY star
    ORDER BY featured_movies DESC;

		--creating table star_movies
		SELECT TOP 1 star
		,COUNT(star) AS featured_movies
		INTO star_movies
		FROM movies_data
		GROUP BY star
		ORDER BY featured_movies DESC;

		-- Query to find the top 3 genres the star has acted in
		SELECT Top 3 genre
		,COUNT(star) AS featured_movies
		FROM movies_data
		WHERE star = 'Nicolas Cage' -- Replaced with the star's name from the first query
		GROUP BY genre
		ORDER BY featured_movies DESC;

		--Creating star_genres table
		SELECT Top 3 genre
		,COUNT(star) AS featured_movies
		INTO star_genres
		FROM movies_data
		WHERE star = 'Nicolas Cage' -- Replaced with the star's name from the first query
		GROUP BY genre
		ORDER BY featured_movies DESC;

--12. Which movie genre is most popular in India? What is the average revenue generated for this movie genre in India? (country of origin)
		-- Query to find the top genre in India
		SELECT TOP 1 genre 
		,COUNT(*) AS genre_count
		FROM movies_data
		WHERE country = 'India'
		GROUP BY genre
		ORDER BY genre_count DESC;

		--Creating India_genre table
		SELECT TOP 1 genre 
		,COUNT(*) AS genre_count
		INTO India_genre
		FROM movies_data
		WHERE country = 'India'
		GROUP BY genre
		ORDER BY genre_count DESC;

		
		 -- Query to find the average revenue of the top genre in India
		SELECT genre
		,ROUND(AVG(gross),2) AS Avg_revenue
		FROM movies_data
		WHERE country = 'India'
		AND genre = 'Action'  -- Replaced 'Most Popular Genre' with the genre obtained from the first query
		GROUP BY genre
		ORDER BY Avg_revenue DESC;

		--creating India_avg_revenue
		SELECT genre
		,ROUND(AVG(gross),2) AS Avg_revenue
		INTO India_avg_revenue
		FROM movies_data
		WHERE country = 'India'
		AND genre = 'Action'  -- Replaced 'Most Popular Genre' with the genre obtained from the first query
		GROUP BY genre
		ORDER BY Avg_revenue DESC;


--13. How many movies start with a consonant letter?
    SELECT COUNT(*) AS consonant_movies
    FROM movies
    WHERE UPPER(LEFT(name, 1)) NOT IN ('A', 'E', 'I', 'O', 'U');
    
    SELECT COUNT(*) AS consonant_movies
    FROM movies
    WHERE LOWER(SUBSTRING(name, 1, 1)) NOT IN ('A', 'E', 'I', 'O', 'U');
    
    SELECT COUNT(*) AS consonant_movies
    FROM movies
    WHERE LEFT(name, 1) NOT IN ('A', 'E', 'I', 'O', 'U');

		-- Creating consonant_movies table
		SELECT COUNT(*) AS consonant_movies
		INTO consonant_movies
		FROM movies
		WHERE UPPER(LEFT(name, 1)) NOT IN ('A', 'E', 'I', 'O', 'U');
