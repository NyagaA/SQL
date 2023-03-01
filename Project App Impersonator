# QUESTION;
  #1.CREATE a table to store App data.
  #2.INSERT a few example rows in the table.
  #3.Use an UPDATE to emulate what happens when you edit data in the app.
  #4.Use a DELETE to emulate what happens when you delete data in the app.


#CREATING My_data TABLE
CREATE TABLE  My_data(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    First_name TEXT,
    Last_name TEXT,
    Nickname TEXT,
    Gender TEXT,
    Age INTEGER);

#CREATING Health TABLE
CREATE TABLE Health(
    Person_id INTEGER PRIMARY KEY AUTOINCREMENT,
    Steps INTEGER,
    Distance TEXT,
    Climbed TEXT,
    Calories TEXT);


#INSERTING INTO My_data TABLE
INSERT INTO My_data (First_name, Last_name, Nickname, Gender, Age) VALUES ("Alex", "Nyaga", "Data Accord", "Male", 25);

INSERT INTO My_data (First_name, Last_name, Nickname, Gender, Age) VALUES ("Luckhey", "Munene", "Mbonzoi", "Male", 23);

INSERT INTO My_data (First_name, Last_name, Nickname, Gender, Age) VALUES ("Muendi", "Chebet", "Ngeus", "Female", 37);

INSERT INTO My_data (First_name, Last_name, Nickname, Gender, Age) VALUES ("Mshiriki", "Mong'are", "Onji", "Female", 19);

INSERT INTO My_data (First_name, Last_name, Nickname, Gender, Age) VALUES ("Mwaf", "Raptcha", "The Legend", "Male", 42);


#INSERTING INTO Health TABLE
INSERT INTO Health (Steps, Distance, Climbed, Calories) VALUES (19927, "19.7 km", "12.8m", "352 kcal");

INSERT INTO Health (Steps, Distance, Climbed, Calories) VALUES (9673, "9.4 km", "4.4m", "149 kcal");

INSERT INTO Health (Steps, Distance, Climbed, Calories) VALUES (5014, "5.0 km", "7.8m", "91 kcal");

INSERT INTO Health (Steps, Distance, Climbed, Calories) VALUES (12063, "11.9 km", "10.3m", "188 kcal");

INSERT INTO Health (Steps, Distance, Climbed, Calories) VALUES (7980, "7.7 km", "9.5m", "114 kcal");


##QUERIES

#SELECTING ALL FROM My_data TABLE
SELECT * FROM My_data;


#SELECTING ALL FROM Health TABLE
SELECT * FROM Health;


#UPDATE STATEMENT ON My_data TABLE
UPDATE My_data SET Age = 27 WHERE Id = 2;


#UPDATE STATEMENT ON Health TABLE
UPDATE Health SET Distance = "4.9 km" WHERE Steps = 5014;


#ALTER TABLE STATEMENT ON Health TABLE
ALTER TABLE Health ADD Time TEXT default "Unknown";


#UPDATE STATEMENTS ON Health TABLE
UPDATE Health SET Time = "360 mins" WHERE Person_id = 1;

UPDATE Health SET Time = "263 mins" WHERE Person_id = 2;

UPDATE Health SET Time = "176 mins" WHERE Person_id = 3;

UPDATE Health SET Time = "206 mins" WHERE Person_id = 4;

UPDATE Health SET Time = "192 mins" WHERE Person_id = 5;


#DELETING A ROW ON My_Data TABLE
DELETE FROM My_data WHERE Id = 4;
