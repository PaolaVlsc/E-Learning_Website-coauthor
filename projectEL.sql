-- Database creation commands
DROP DATABASE IF EXISTS projectELDb;
CREATE DATABASE projectELDb;
USE projectELDb;
CREATE TABLE users ( id INT NOT NULL, name VARCHAR(25) NOT NULL, password VARCHAR(32) NOT NULL, email VARCHAR(100) NOT NULL, average FLOAT, PRIMARY KEY (id) );
CREATE TABLE chapter ( id INT NOT NULL, name VARCHAR(100), PRIMARY KEY (id) );
CREATE TABLE grades ( id INT NOT NULL AUTO_INCREMENT, chapter_id INT, user_id INT, grade INT, PRIMARY KEY(id), FOREIGN KEY(chapter_id) REFERENCES chapter(id), FOREIGN KEY(user_id) REFERENCES users(id) );
-- Δεν έχει δοκιμαστεί
DROP TRIGGER IF EXISTS update_average;
delimiter //
CREATE TRIGGER update_average
AFTER INSERT ON grades
FOR EACH ROW
BEGIN
UPDATE users
SET average = (SELECT AVG(grade) FROM grades WHERE user_id = NEW.user_id)
WHERE id = NEW.user_id;
END;
//
delimiter ;
-- Dummy Data insertion commands