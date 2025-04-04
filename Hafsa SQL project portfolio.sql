-- Project Title 
-- "Stack Overflow Post Analysis: A SQL Portfolio Project"

-- Creation of database with name "project" 

CREATE DATABASE project;

 -- using "project" database 
 
USE project;

-- creation of tables:

CREATE TABLE badges (
    id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    date DATE
);

INSERT INTO badges (id, user_id, name, date) VALUES
(1, 1001, 'Gold Contributor', '2024-01-01'),
(2, 1002, 'Silver Helper', '2024-01-05'),
(3, 1003, 'Bronze Reviewer', '2024-02-10'),
(4, 1001, 'Silver Helper', '2024-03-15'),
(5, 1004, 'Gold Contributor', '2024-04-20'),
(6, 1001, 'Gold Contributor', '2024-05-05'),
(7, 1002, 'Bronze Reviewer', '2024-06-10'),
(8, 1003, 'Silver Helper', '2024-07-10'),
(9, 1004, 'Gold Contributor', '2024-08-01'),
(10, 1001, 'Bronze Reviewer', '2024-09-01');


CREATE TABLE comments (
    id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    creation_date DATE,
    text TEXT
);

INSERT INTO comments (id, post_id, user_id, creation_date, text) VALUES
(1, 2001, 1001, '2024-01-01', 'Great explanation!'),
(2, 2002, 1002, '2024-01-05', 'This helped a lot.'),
(3, 2003, 1003, '2024-01-10', 'Can you clarify?'),
(4, 2004, 1001, '2024-01-15', 'Excellent resource.'),
(5, 2005, 1004, '2024-01-20', 'Thank you for sharing.'),
(6, 2001, 1002, '2024-01-25', 'I agree, very useful.'),
(7, 2003, 1003, '2024-02-01', 'This solved my issue.'),
(8, 2004, 1001, '2024-02-05', 'Thanks for the info.'),
(9, 2005, 1004, '2024-02-10', 'Could use more detail.'),
(10, 2006, 1002, '2024-02-15', 'Good job on this one!');


CREATE TABLE post_history (
    id INT PRIMARY KEY,
    post_history_type_id INT,
    post_id INT,
    user_id INT,
    text TEXT,
    creation_date DATE
);

INSERT INTO post_history (id, post_history_type_id, post_id, user_id, text, creation_date) VALUES
(1, 1, 2001, 1001, 'Initial post creation', '2024-01-01'),
(2, 2, 2002, 1002, 'Edited post for clarity', '2024-01-05'),
(3, 3, 2003, 1003, 'Comment added by moderator', '2024-01-10'),
(4, 1, 2004, 1001, 'First version of the post', '2024-01-15'),
(5, 2, 2005, 1004, 'Reworded answer', '2024-01-20'),
(6, 3, 2001, 1002, 'User updated answer with additional info', '2024-01-25'),
(7, 1, 2003, 1003, 'Post originally created', '2024-02-01'),
(8, 3, 2004, 1001, 'Moderators edited content', '2024-02-05'),
(9, 2, 2005, 1004, 'User revised explanation', '2024-02-10'),
(10, 3, 2006, 1002, 'Moderators flagged inappropriate content', '2024-02-15');


CREATE TABLE post_links (
    id INT PRIMARY KEY,
    post_id INT,
    related_post_id INT,
    link_type_id INT
);

INSERT INTO post_links (id, post_id, related_post_id, link_type_id) VALUES
(1, 2001, 2002, 1),
(2, 2002, 2003, 2),
(3, 2003, 2004, 1),
(4, 2004, 2005, 3),
(5, 2005, 2006, 2),
(6, 2001, 2004, 3),
(7, 2002, 2006, 1),
(8, 2003, 2005, 2),
(9, 2004, 2006, 3),
(10, 2005, 2001, 2);


CREATE TABLE posts_answers (
    id INT PRIMARY KEY,
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts_answers (id, post_type_id, creation_date, score, view_count, owner_user_id) VALUES
(1, 1, '2024-01-01', 10, 100, 1001),
(2, 2, '2024-01-05', 20, 150, 1002),
(3, 1, '2024-01-10', 5, 50, 1003),
(4, 2, '2024-01-15', 15, 120, 1001),
(5, 1, '2024-01-20', 30, 200, 1004),
(6, 2, '2024-01-25', 25, 180, 1002),
(7, 1, '2024-02-01', 40, 300, 1003),
(8, 2, '2024-02-05', 10, 80, 1001),
(9, 1, '2024-02-10', 8, 90, 1004),
(10, 2, '2024-02-15', 50, 400, 1002);

CREATE TABLE tags (
    id INT PRIMARY KEY,
    tag_name VARCHAR(255)
);

INSERT INTO tags (id, tag_name) VALUES
(1, 'SQL'),
(2, 'JavaScript'),
(3, 'React'),
(4, 'Python'),
(5, 'AI'),
(6, 'Machine Learning'),
(7, 'Node.js'),
(8, 'CSS'),
(9, 'HTML'),
(10, 'Database');


CREATE TABLE users (
    id INT PRIMARY KEY,
    display_name VARCHAR(255),
    reputation INT,
    creation_date DATE
);

INSERT INTO users (id, display_name, reputation, creation_date) VALUES
(1001, 'Alice', 1500, '2024-01-01'),
(1002, 'Bob', 1200, '2024-01-05'),
(1003, 'Charlie', 800, '2024-01-10'),
(1004, 'Dave', 1800, '2024-01-15'),
(1005, 'Eve', 1000, '2024-01-20'),
(1006, 'Frank', 2000, '2024-01-25'),
(1007, 'Grace', 1300, '2024-02-01'),
(1008, 'Hank', 1100, '2024-02-05'),
(1009, 'Ivy', 900, '2024-02-10'),
(1010, 'Jack', 1600, '2024-02-15');


CREATE TABLE votes (
    id INT PRIMARY KEY,
    post_id INT,
    vote_type_id INT,
    creation_date DATE
);

INSERT INTO votes (id, post_id, vote_type_id, creation_date) VALUES
(1, 2001, 1, '2024-01-01'),
(2, 2002, 2, '2024-01-05'),
(3, 2003, 1, '2024-01-10'),
(4, 2004, 2, '2024-01-15'),
(5, 2005, 1, '2024-01-20'),
(6, 2001, 2, '2024-01-25'),
(7, 2003, 1, '2024-02-01'),
(8, 2004, 2, '2024-02-05'),
(9, 2005, 1, '2024-02-10'),
(10, 2006, 2, '2024-02-15');


CREATE TABLE posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts (id, title, post_type_id, creation_date, score, view_count, owner_user_id)
VALUES
(2001, 'How to solve SQL JOIN issues?', 1, '2023-01-01', 10, 100, 1),
(2002, 'Best practices for writing SQL queries', 2, '2023-01-02', 15, 150, 2),
(2003, 'Understanding INNER JOIN in SQL', 1, '2023-01-03', 20, 200, 3),
(2004, 'What is a LEFT JOIN?', 2, '2023-01-04', 25, 250, 4),
(2005, 'Database indexing techniques', 1, '2023-01-05', 30, 300, 5),
(2006, 'Explaining SQL subqueries', 2, '2023-01-06', 35, 350, 6),
(2007, 'How to optimize SQL queries?', 1, '2023-01-07', 40, 400, 7),
(2008, 'Database normalization concepts', 2, '2023-01-08', 45, 450, 8),
(2009, 'SQL Aggregate Functions explained', 1, '2023-01-09', 50, 500, 9),
(2010, 'Introduction to SQL Window Functions', 2, '2023-01-10', 55, 550, 10);



-- select all the tables 

SELECT * FROM badges;
SELECT * FROM comments;
SELECT * FROM post_history;
SELECT * FROM post_links;
SELECT * FROM posts;
SELECT * FROM posts_answers;
SELECT * FROM tags;
SELECT * FROM users;
SELECT * FROM votes;

-- Explore the structure and first 5 rows of each table

DESCRIBE badges;
DESCRIBE comments;
DESCRIBE post_history;
DESCRIBE post_links;
DESCRIBE posts;
DESCRIBE posts_answers;
DESCRIBE tags;
DESCRIBE users;
DESCRIBE votes;



-- Explore first 5 rows of each table

SELECT * 
FROM badges
LIMIT 5;

SELECT * 
FROM comments
LIMIT 5;

SELECT * 
FROM post_history
LIMIT 5;

SELECT * 
FROM post_links
LIMIT 5;

SELECT * 
FROM posts
LIMIT 5;

SELECT * 
FROM posts_answers
LIMIT 5;

SELECT * 
FROM tags
LIMIT 5;

SELECT * 
FROM users
LIMIT 5;

SELECT * 
FROM votes
LIMIT 5;



-- Identify the total number of records in each table.

SELECT COUNT(*) FROM badges;

SELECT COUNT(*) FROM comments;

SELECT COUNT(*) FROM post_history;

SELECT COUNT(*) FROM post_links;

SELECT COUNT(*) FROM posts;

SELECT COUNT(*) FROM posts_answers;

SELECT COUNT(*) FROM tags;

SELECT COUNT(*) FROM users;

SELECT COUNT(*) FROM votes;


-- Find all posts with a view_count greater than 100

SELECT *
FROM posts
WHERE view_count > 100;

-- Display comments made in 2005, sorted by creation_date (comments table).

SELECT * 
FROM comments
WHERE year(creation_date) = 2005
ORDER BY creation_date ASC;


-- Count the total number of badges (badges table)

SELECT count(id)
FROM badges;

-- Calculate the average score of posts grouped by post_type_id (posts_answer table).

SELECT post_type_id, avg(score)
FROM posts
GROUP BY post_type_id;

-- Combine the post_history and posts tables to display the title of posts and the corresponding changes made in the post history.

SELECT ph.* , p.title
FROM post_history ph
LEFT JOIN posts p ON
ph. post_id = p.id;

-- Join the users table with badges to find the total badges earned by each user.


SELECT u.id AS user_id, u.display_name, COUNT(b.id) AS total_badges
FROM users u
LEFT JOIN badges b ON u.id = b.user_id
GROUP BY u.id, u.display_name
ORDER BY total_badges DESC; 

-- Fetch the titles of posts (posts), their comments (comments), and the users who made those comments (users).


SELECT u.display_name, p.title, c.text
FROM posts p 
JOIN comments c ON p.id = c.post_id
JOIN users u ON c.user_id = u.id;

-- Combine post_links with posts to list related questions.


SELECT pl.post_id, p1.title AS original_question, 
       pl.related_post_id, p2.title AS related_question
FROM post_links pl
JOIN posts p1 ON pl.post_id = p1.id
JOIN posts p2 ON pl.related_post_id = p2.id
ORDER BY pl.post_id;


-- Join the users, badges, and comments tables to find the users who have earned badges and made comments.

SELECT u.id, u.display_name AS user_name,
		count(b.id) AS total_badges,
        count(c.id) AS total_comments
FROM users u
LEFT JOIN badges b ON u.id = b.user_id
LEFT JOIN comments c ON u.id = c.user_id
GROUP BY u.id, u.display_name
HAVING total_badges > 0 AND total_comments > 0;



-- Part 3: Subqueries
-- Find the user with the highest reputation



SELECT display_name, reputation
FROM users
WHERE reputation = (SELECT max(reputation)
FROM users);


-- Retrieve posts with the highest score in each post_type_id (posts table).


SELECT title, post_type_id, score
FROM posts
WHERE (post_type_id, score) IN
(SELECT post_type_id, MAX(score)
FROM posts
GROUP BY post_type_id);



-- For each post, fetch the number of related posts from post_links.

SELECT p.id, p.title,
		(SELECT count(*) 
        FROM post_links pl
        WHERE pl.post_id = p.id) AS
related_post_count
FROM posts p;


-- Part 4: Advanced Queries
-- 1. Window Functions (5 marks each)
-- Rank posts based on their score within each year (posts table).

SELECT id, score,
    YEAR(creation_date) AS post_year,
    RANK() OVER (PARTITION BY YEAR(creation_date) 
    ORDER BY score DESC) AS rank_within_year
FROM posts;

-- Calculate the running total of badges earned by users (badges table).

SELECT 
    id, date,
    COUNT(id) OVER (PARTITION BY user_id ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM badges;


-- Create a CTE to calculate the average score of posts by each user and use it to:
-- List users with an average score above 50.

WITH User_Average_Score AS 
    (SELECT id, AVG(score) AS avg_score
    FROM posts
    GROUP BY id)
SELECT 
    id, avg_score
FROM User_Average_Score
WHERE avg_score > 50;

-- Rank users based on their average post score.


WITH User_Average_Score AS 
    (SELECT id, AVG(score) AS avg_score
    FROM posts
    GROUP BY id)
SELECT 
    id, avg_score,
    RANK() OVER (ORDER BY avg_score DESC) AS rank_position
FROM User_Average_Score;


-- New Insights and Questions

--  Which users have contributed the most in terms of comments, edits, and votes?

SELECT u.id, u.display_name,
		count(distinct c.id) AS total_comments,
        count(distinct ph.id) AS total_edits,
        count(distinct v.id) AS total_votes,
        (count(distinct c.id) + count(distinct ph.id) + count(distinct v.id)) AS top_contributors

FROM users u
LEFT JOIN comments c ON u.id = c.user_id
LEFT JOIN post_history ph ON u.id = ph.user_id
LEFT JOIN votes v ON u.id = v.post_id
GROUP BY u.id;

		




-- What types of badges are most commonly earned, and which users are the top earners?
SELECT name, 
    COUNT(*) AS total_earned
FROM badges
GROUP BY name 
ORDER BY total_earned DESC;

SELECT 
    user_id, 
    name, 
    COUNT(*) AS total_earned
FROM badges
GROUP BY user_id, name
ORDER BY total_earned DESC;

-- Which tags are associated with the highest-scoring posts?

SELECT t.tag_name, p.title, p.score
FROM posts p
JOIN tags t ON p.owner_user_id = t.id
WHERE p.score = (SELECT MAX(score)
FROM posts);


-- How often are related questions linked, and what does this say about knowledge sharing?

SELECT p.id AS post_id, p.title AS post_title,
		COUNT(pl.post_id) AS post_linked
FROM post_links pl
JOIN posts p ON pl.related_post_id = p.id
GROUP BY p.id, p.title
ORDER BY post_linked;


