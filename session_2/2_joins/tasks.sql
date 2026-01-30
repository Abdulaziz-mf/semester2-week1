-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 social.db
-- 2. Load this script: .read tasks.sql
-- 3. Exit SQLite: .exit

-- 1. List all posts that have been deleted.
select deleted, user_id from posts;
-- 2. List all users whose usernames begin with 'a'.
SELECT username FROM users WHERE  username LIKE 'A%'; 
-- 3. Find all posts and the usernames of those who posted them whose content contains the word "small".
.mode columns
.headers on
SELECT 
username,
content
FROM users
JOIN posts ON users.id = posts.user_id
WHERE content LIKE '%small%';
-- 4. Return each non-deleted post and the username of the person who wrote in, in date order.
select username, content from users join posts on users.id=posts.id where deleted = 0 order by posts.created_on;
-- 5. For each user, return their username and the total number of posts they have made.
select username, COUNT(content) from users join posts on users.id=posts.id group by username;
-- 6. Modify the previous query to return only users who have authored more than 3 posts.

-- 7. For each user, return their username and the number of users they follow, including users who follow no one.
-- 8. List the top 5 most-followed users.
-- 9. Return a list showing the username of the follower and the username of the followed user for each follow relationship.
-- 10. For a given user (christopherprice), return all non-deleted posts written by users they follow, ordered from most recent to oldest.




