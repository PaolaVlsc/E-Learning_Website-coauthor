-- Database creation commands
DROP DATABASE IF EXISTS projectELDb;
CREATE DATABASE projectELDb;
USE projectELDb;
CREATE TABLE users ( id INT NOT NULL AUTO_INCREMENT, name VARCHAR(25) NOT NULL, password VARCHAR(32) NOT NULL, email VARCHAR(100) NOT NULL UNIQUE, average FLOAT, PRIMARY KEY (id) );
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

-- Instert Dummy Data for users table
INSERT INTO users (name,password,email,average) VALUES ('Βεμπληχα','Βεμπληχα321','Beblixa@gmail.com',NULL),('Πάολα','BestEngineer321','Paola@gmail.com',NULL),('Νίκος','ILoveFortNite','Nikos@gmail.com',NULL),('Σοφία','HandCleanerGel','Sofia@gmail.com',NULL),('Ιάσονας','Iasonas123','Iasonas@gmail.com',NULL),('Παναγιώτης','TankDriver7','Panagioths@gmail.com',NULL),('Μαίρη','ILoveBTS','Mairh@gmail.com',NULL),('Μάρκος','HarryPoter21','Petros@gmail.com',NULL),('Αθηνά','1234ac','Athina@gmail.com',NULL),('Γιάννης','JohnPro','John@gmail.com',NULL),('Κίκη','JustinBieber','Kikh@gmail.com',NULL);

-- Instert Dummy Data for chapter table
INSERT INTO chapter VALUES (1,'Κεφαλαιο 1'),(2,'Κεφαλαιο 2'),(3,'Κεφαλαιο 3'),(4,'Κεφαλαιο 4'),(5,'Τελικό Τεστ');

-- Instert Dummy Data for grades table
INSERT INTO grades (chapter_id,user_id,grade) VALUES (1,1,7),(1,2,5),(2,2,6),(3,2,7),(4,2,8),(1,3,2),(2,3,2),(3,3,7),(4,3,4),(5,3,5);

INSERT INTO grades (chapter_id,user_id,grade) VALUES (1,4,7),(1,4,5),(1,4,6),(1,5,0),(1,5,8),(1,5,2),(2,5,10),(2,5,10),(3,5,4),(3,5,5),(4,5,1),(4,5,9),(4,5,8), (1,6,4),(1,6,8),(1,6,4),(2,6,10),(3,6,2),(3,6,8),(4,6,1),(4,6,9),(4,6,8),(5,6,2),(5,6,3),(4,6,9);

INSERT INTO grades (chapter_id,user_id,grade) VALUES (3,7,10),(4,7,10),(1,8,1),(1,8,7),(1,8,8),(1,8,10),(2,8,10),(1,9,7),(2,9,9),(5,9,7),(2,10,7),(2,10,10),(3,10,2),(3,10,5),(3,10,7),(5,10,2),(5,10,6),(5,10,8),(5,10,10);
