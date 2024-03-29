--In this PostgreSQLcode, I'm querying a database that holds Nexflix data to answer questions asked about the data. 

--1. How many movie titles are there in the database? (movies only, not tv shows) 
--using count()

SELECT count(*) 
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
WHERE type='Movie';

--2. When was the most recent batch of tv shows and/or movies added to the database? 
--using max(), date()

SELECT max(date(date_added))
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info";

--3. List all the movies and tv shows in alphabetical order. 
--using order by

SELECT title
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
ORDER BY title ASC;

--4. Who was the Director for the movie Bright Star? 
--using left join

SELECT
people.director
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info" titles
LEFT JOIN  "CharlotteChaze/BreakIntoTech"."netflix_people" people
ON titles.show_id=people.show_id
where titles.title='Bright Star';

--5. What is the oldest movie in the database and what year was it made? 
--using order by, limit

SELECT title, release_year
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
WHERE type='Movie'
ORDER BY release_year asc
LIMIT 1;

--using a subquery, min()
SELECT title, release_year 
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
WHERE type = 'Movie'
AND release_year <= 
(SELECT MIN(release_year) 
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
WHERE type = 'Movie');
