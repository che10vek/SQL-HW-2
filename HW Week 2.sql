#In this assignment, we’ll practice working with one-to-many relationships in SQL. Suppose you are tasked with keeping
#track of a database that contain the best “how-to” videos on MySQL.
#You may want to first create a new database (schema) for this assignment.
#1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
#video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
#other publicly available resources.

DROP TABLE IF EXISTS Videos;
DROP TABLE IF EXISTS Reviews;

CREATE TABLE Videos
(
  video_id int PRIMARY KEY,
  video_title varchar(80) NOT NULL,
  video_length int,
  video_URL varchar(50) NOT NULL
);

INSERT INTO Videos ( video_id, video_title, video_length, video_URL) VALUES ( 1, 'SQL Tutorial - 12: Inserting Data Into Tables', 10, 'https://youtu.be/Tet3Z7Yb2gg');
INSERT INTO Videos ( video_id, video_title, video_length, video_URL) VALUES ( 2, 'MySQL Tutorial for Beginners - 2 - Adding Data to Tables in a Database', 6, 'https://youtu.be/WA4SpOOYMGc');
INSERT INTO Videos ( video_id, video_title, video_length, video_URL) VALUES ( 3, 'MySQL Tutorial Create table insert and select in workbench', 6, 'https://youtu.be/-RrfsIPy4uE');

SELECT * FROM Videos;

#Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of
#at least two of the videos. These should be imaginary reviews that include columns for the user’s name
#(“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review
#(“Loved it!”). There should be a column that links back to the ID column in the table of videos.

DROP TABLE IF EXISTS Reviews;
CREATE TABLE Reviews
(
  review_id int PRIMARY KEY,
  user_name varchar(20) NOT NULL,
  user_rating int,
  user_text varchar(80) NOT NULL,
  video_id int

);

INSERT INTO Reviews ( review_id, user_name, user_rating, user_text, video_id)  VALUES ( 1, 'John', 5, 'Excellent video',1);
INSERT INTO Reviews ( review_id, user_name, user_rating, user_text, video_id)  VALUES ( 2, 'John', 4, 'Very Informative',2);
INSERT INTO Reviews ( review_id, user_name, user_rating, user_text, video_id)  VALUES ( 3, 'Molly', 4, 'Easy to follow',1);
INSERT INTO Reviews ( review_id, user_name, user_rating, user_text, video_id)  VALUES ( 4, 'Molly', 5, 'Perfect for beginners',3);
INSERT INTO Reviews ( review_id, user_name, user_rating, user_text, video_id)  VALUES ( 5, 'Mycroft', 3, 'Average',3);
INSERT INTO Reviews ( review_id, user_name, user_rating, user_text, video_id)  VALUES ( 6, 'Mycroft', 2, 'Waste of time!',2);

SELECT * FROM Reviews;

#3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.

SELECT v.video_id AS ID, v.video_title AS Title, v.video_length AS Length, v.video_URL AS URL, r.user_name, r.user_rating, r.user_text
  FROM Videos v
    INNER JOIN Reviews r ON v.video_id = r.video_id
  ORDER BY v.video_id;