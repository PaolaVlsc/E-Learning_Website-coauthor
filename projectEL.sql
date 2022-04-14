-- Database creation commands
DROP DATABASE IF EXISTS projectELDb;
CREATE DATABASE projectELDb;
USE projectELDb;
CREATE TABLE users ( id INT NOT NULL, name VARCHAR(25) NOT NULL, password VARCHAR(32) NOT NULL, email VARCHAR(100) NOT NULL, average FLOAT, PRIMARY KEY (id) );
CREATE TABLE chapter ( id INT NOT NULL, name VARCHAR(100), PRIMARY KEY (id) );
CREATE TABLE grades ( id INT NOT NULL AUTO_INCREMENT, chapter_id INT, user_id INT, grade INT, PRIMARY KEY(id), FOREIGN KEY(chapter_id) REFERENCES chapter(id), FOREIGN KEY(user_id) REFERENCES users(id) );
-- Dummy Data insertion commands