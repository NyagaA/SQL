--Create table footballers
CREATE TABLE footballers (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Fullname TEXT,
    Age INTEGER,
    Team TEXT,
    Nationality TEXT);
 
INSERT INTO footballers (Fullname, Age, Team, Nationality) VALUES ("Lionel Messi", 35, "Paris Saint-Germain F.C.", "Argentina");
INSERT INTO footballers (Fullname, Age, Team, Nationality)  VALUES ("Christiano Ronaldo", 38, "Al-Nassr F.C", "Portugal");
INSERT INTO footballers (Fullname, Age, Team, Nationality) VALUES ("Karim Benzema", 35, "Real Madrid", "France");
INSERT INTO footballers (Fullname, Age, Team, nationality) VALUES ("Ricardo Kaka", 40, "Orlando City Fc(Retired 2017)", "Brazil");
INSERT INTO footballers (Fullname, Age, Team, Nationality) VALUES ("Ronaldinho Gaucho", 42, "Fluminense (Retired 2018)", "Brazil");

--create table achievement
CREATE table achievement (
    Footballer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    Ballon_dor TEXT,
    Titles INTEGER,
    UEFA_cups TEXT,
    World_cup TEXT);
    
INSERT INTO achievement (Ballon_dor, Titles, UEFA_cups, World_cup) VALUES ("7 (2009,2010,2011,2012,2015,2019,2021)", 42, "4 (2005/2006,2008/2009,2010/2011,2015/2017)", "1 (2022)");
INSERT INTO achievement (Ballon_dor, Titles, UEFA_cups, World_cup) VALUES ("5 (2008,2013,2014,2016,2017)", 34, "5 (2007/2008,2013/2014,2015/2016,2016/2017,2017/2018)", "0");
INSERT INTO achievement (Ballon_dor, Titles, UEFA_cups, World_cup) VALUES ("1 (2022)", 23, "5 (2013/2014,2015/2016,2016/2017,2017/2018,2021/2022)","1 (2018)");
INSERT INTO achievement (Ballon_dor, Titles, UEFA_cups, World_cup) VALUES ("1 (2002)", 23, "1 (2007)", "1 (2002)");
INSERT INTO achievement (Ballon_dor, Titles, UEFA_cups, World_cup) VALUES ("1 (2005)", 22, "1 (2006)", "1 (2002)");

--create table career
CREATE table career (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    matches_played INTEGER,
    career_goals INTEGER,
    career_assists INTEGER);
    
INSERT INTO career (matches_played,career_goals, career_assists) VALUES (1009, 796, 351);
INSERT INTO career (matches_played,career_goals, career_assists) VALUES (1150, 824, 234);
INSERT INTO career (matches_played,career_goals, career_assists) VALUES (759, 354, 184);
INSERT INTO career (matches_played,career_goals, career_assists) VALUES (620, 195, 169);
INSERT INTO career (matches_played,career_goals, career_assists) VALUES (543, 197, 163);

--displaying all data in footballers table
SELECT * FROM footballers;

--displaying all data in achievement table
SELECT * FROM achievement;

--displaying all data in career table
SELECT * FROM career;

--Implicit inner join on table footballers and table career
SELECT a.fullname, a.team, c.career_goals, c.career_assists
FROM footballers a, career c
WHERE a.id = c.id;

--Explicit inner join on table footballers and table achievement(JOIN keyword)
SELECT * 
FROM footballers a
JOIN achievement b
ON a.id = b.footballer_id;

--Joining table footballers and achievement for selective display
SELECT a.fullname, a.team, b.ballon_dor, b.UEFA_cups, b.world_cup
FROM footballers a
JOIN achievement b
ON a.id = b.footballer_id;





