/* I downloaded Spotify data for this project from Kaggle 
   I created a table to insert Spotify data into.
   Finally, I queried the database to answer questions asked about the data. 
*/

--Creating the table
CREATE TABLE BIT_DB.Spotifydata (
id integer PRIMARY KEY,
artist_name varchar NOT NULL,
track_name varchar NOT NULL,
track_id varchar NOT NULL,
popularity integer NOT NULL,
danceability decimal(4,3) NOT NULL,
energy decimal(4,3) NOT NULL,
song_key integer NOT NULL,
loudness decimal(5,3) NOT NULL,
song_mode integer NOT NULL,
speechiness decimal(5,4) NOT NULL,
acousticness decimal(6,5) NOT NULL,
instrumentalness text NOT NULL,
liveness decimal(5,4) NOT NULL,
valence decimal(4,3) NOT NULL,
tempo decimal(6,3) NOT NULL,
duration_ms integer NOT NULL,
time_signature integer NOT NULL )


--Inserted the Spotify Data .csv into the Spotifydata Table


    --Querying the Database using SQL
--1.What is the average danceability by artist and track? 

SELECT artist_name, track_name, AVG(danceability)
FROM BIT_DB.Spotifydata
GROUP BY artist_name, track_name;


--2.Who are the top 10 artists based on popularity? 

SELECT artist_name, popularity
FROM BIT_DB.Spotifydata
ORDER BY popularity DESC
LIMIT 10;

==3.Which artist released the longest song? 
--a
SELECT artist_name, track_name, duration_ms 
FROM BIT_DB.Spotifydata
GROUP BY track_name                    
ORDER BY duration_ms DESC;

--b
SELECT artist_name, track_name, duration_ms
FROM BIT_DB.Spotifydata
GROUP BY duration_ms                    
ORDER BY duration_ms DESC;



--4.What is the average danceability for the 10 most popular songs?

SELECT track_name, popularity, AVG(danceability)
FROM BIT_DB.Spotifydata
GROUP BY track_name
ORDER BY popularity DESC
LIMIT 10


--5.Determine the Top 10 artists are by popularity.

SELECT track_name, artist_name, popularity           
FROM BIT_DB.spotifydata
ORDER BY popularity desc
LIMIT 10;


--6.Determine the avg popularity, danceability, and energy by artist and track. 

SELECT artist_name, track_name, 
AVG(popularity), AVG(danceability), AVG(energy)
FROM BIT_DB.spotifydata
GROUP BY artist_name, track_name;

--7.Calculate the average popularity for the artists in the Spotify data table. Then, for every artist with an average popularity of 90 or above, show their name, their average popularity, and label them as a “Top Star”.
--USING CTE (Temporary Table)
WITH AVGPOP_CTE AS (                                           
SELECT s.artist_name, 
AVG(s.popularity) AS AveragePop
FROM Spotifydata s
GROUP BY s.artist_name
)

SELECT artist_name, 
AveragePop,
'Top Star' AS TAG
FROM AVGPOP_CTE 
WHERE AveragePop>=90
ORDER BY AveragePop DESC;

--WITHOUT CTE
SELECT artist_name, 
AVG(popularity) AS AveragePop,
'Top Star' AS TAG
FROM BIT_DB.Spotifydata 
GROUP BY artist_name
HAVING AveragePop>=90
ORDER BY AveragePop DESC;
