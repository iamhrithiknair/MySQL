CREATE DATABASE studentdb;

USE studentdb;

--class table--
CREATE TABLE class(class_id INT PRIMARY KEY AUTO_INCREMENT,
class_name VARCHAR(20) NOT NULL,
division  VARCHAR(20)  NOT NULL,
st_cnt  INT  NOT NULL
);

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| class_id   | int(11)     | NO   | PRI | NULL    | auto_increment |
| class_name | varchar(20) | NO   |     | NULL    |                |
| division   | varchar(20) | NO   |     | NULL    |                |
| st_cnt     | int(11)     | NO   |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+


--student table--
CREATE TABLE student(st_id INT PRIMARY KEY AUTO_INCREMENT,
st_fname VARCHAR(50) 	NOT NULL,
st_lname VARCHAR(50)	NOT NULL,
address VARCHAR(200) NOT NULL,
phone	 INT,
email VARCHAR(100) NOT NULL,
class_id INT,
FOREIGN KEY (class_id) REFERENCES class (class_id)
);

+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| st_id    | int(11)      | NO   | PRI | NULL    | auto_increment |
| st_fname | varchar(50)  | NO   |     | NULL    |                |
| st_lname | varchar(50)  | NO   |     | NULL    |                |
| address  | varchar(200) | NO   |     | NULL    |                |
| phone    | int(11)      | YES  |     | NULL    |                |
| email    | varchar(100) | NO   |     | NULL    |                |
| class_id | int(11)      | YES  | MUL | NULL    |                |
+----------+--------------+------+-----+---------+----------------+


--teacher table--
CREATE TABLE teacher( tr_id INT PRIMARY KEY AUTO_INCREMENT,
tr_fname VARCHAR(50) NOT NULL,
tr_lname VARCHAR(50),
phone	 INT NOT NULL,
subject VARCHAR(50) NOT NULL
);

+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| tr_id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| tr_fname | varchar(50) | NO   |     | NULL    |                |
| tr_lname | varchar(50) | YES  |     | NULL    |                |
| phone    | int(11)     | NO   |     | NULL    |                |
| subject  | varchar(50) | NO   |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+

--student_class table--
CREATE TABLE student_class(st_id INT ,
FOREIGN KEY (st_id) REFERENCES student (st_id),
class_id INT ,
FOREIGN KEY (class_id) REFERENCES class(class_id),
tr_id INT ,
FOREIGN KEY (tr_id) REFERENCES teacher(tr_id),
PRIMARY KEY(st_id, class_id, tr_id)
);

+----------+---------+------+-----+---------+-------+
| Field    | Type    | Null | Key | Default | Extra |
+----------+---------+------+-----+---------+-------+
| st_id    | int(11) | NO   | PRI | NULL    |       |
| class_id | int(11) | NO   | PRI | NULL    |       |
| tr_id    | int(11) | NO   | PRI | NULL    |       |
+----------+---------+------+-----+---------+-------+


--inserting values to student table--

INSERT INTO student(st_fname, st_lname, address, phone, email)
VALUES
('Abhimanyu','Singh','Bandra','7241847','abhimanyu@gmail.com'),
('Sandeep','Singh','Bandra','7843244','sandeep@gmail.com'),
('Satya','K','Ahmedabad','78447474','ksatya@gmail.com'),
('Jay','T','Gandhinagar','84348943','jay@yahoo.com'),
('Alok','Singh','Bavnagar','98374841','aloksingh@gmail.com'),
('Aleena','Singh','Amritsar','7449401','aleena@gmail.com'),
('John','Jose','Thrissur','7955847','john@gmail.com'),
('John','P','Trivandrum','7244447','pjohn@gmail.com');

+-------+-----------+----------+-------------+----------+---------------------+----------+
| st_id | st_fname  | st_lname | address     | phone    | email               | class_id |
+-------+-----------+----------+-------------+----------+---------------------+----------+
|     1 | Abhimanyu | Singh    | Bandra      |  7241847 | abhimanyu@gmail.com |     NULL |
|     2 | Sandeep   | Singh    | Bandra      |  7843244 | sandeep@gmail.com   |     NULL |
|     3 | Satya     | K        | Ahmedabad   | 78447474 | ksatya@gmail.com    |     NULL |
|     4 | Jay       | T        | Gandhinagar | 84348943 | jay@yahoo.com       |     NULL |
|     5 | Alok      | Singh    | Bavnagar    | 98374841 | aloksingh@gmail.com |     NULL |
|     6 | Aleena    | Singh    | Amritsar    |  7449401 | abhimanyu@gmail.com |     NULL |
|     7 | John      | Jose     | Thrissur    |  7955847 | john@gmail.com      |     NULL |
|     8 | John      | P        | Trivandrum  |  7244447 | pjohn@gmail.com     |     NULL |
+-------+-----------+----------+-------------+----------+---------------------+----------+

--inserting values to class table--

INSERT INTO class(class_name, division, st_cnt)
VALUES
('NINTH', 'A', '56'),
('NINTH', 'B', '55'),
('TENTH', 'A',' 48'),
('TENTH', 'B', '51');

+----------+------------+----------+--------+
| class_id | class_name | division | st_cnt |
+----------+------------+----------+--------+
|        1 | NINTH      | A        |     56 |
|        2 | NINTH      | B        |     55 |
|        3 | TENTH      | A        |     48 |
|        4 | TENTH      | B        |     51 |
+----------+------------+----------+--------+

--inserting values to teacher table--

INSERT INTO teacher(tr_fname, tr_lname, phone, subject)
VALUES
('John','K','73872343','Economics'),
('Jaya','Bacchhan','73484384','English'),
('Lina','John','98437453','Maths'),
('Lekshmi','M','7432483','Science');

+-------+----------+----------+----------+-----------+
| tr_id | tr_fname | tr_lname | phone    | subject   |
+-------+----------+----------+----------+-----------+
|     1 | John     | K        | 73872343 | Economics |
|     2 | Jaya     | Bacchhan | 73484384 | English   |
|     3 | Lina     | John     | 98437453 | Maths     |
|     4 | Lekshmi  | M        |  7432483 | Science   |
+-------+----------+----------+----------+-----------+


--inserting values to student_class table--

INSERT INTO student_class(st_id, class_id, tr_id)
VALUES
(1,1,1),
(1,1,2),
(1,1,3),
(1,1,4),
(2,1,1),
(2,1,2),
(2,1,3),
(2,1,4),
(3,2,1),
(3,2,2),
(3,2,3),
(3,2,4),
(4,2,1),
(4,2,2),
(4,2,3),
(4,2,4),
(5,2,2),
(5,2,3),
(6,3,2),
(6,3,3),
(6,3,4),
(7,3,1),
(8,4,2),
(8,4,3),
(8,4,4);

+-------+----------+-------+
| st_id | class_id | tr_id |
+-------+----------+-------+
|     1 |        1 |     1 |
|     1 |        1 |     2 |
|     1 |        1 |     3 |
|     1 |        1 |     4 |
|     2 |        1 |     1 |
|     2 |        1 |     2 |
|     2 |        1 |     3 |
|     2 |        1 |     4 |
|     3 |        2 |     1 |
|     3 |        2 |     2 |
|     3 |        2 |     3 |
|     3 |        2 |     4 |
|     4 |        2 |     1 |
|     4 |        2 |     2 |
|     4 |        2 |     3 |
|     4 |        2 |     4 |
|     5 |        2 |     2 |
|     5 |        2 |     3 |
|     6 |        3 |     2 |
|     6 |        3 |     3 |
|     6 |        3 |     4 |
|     7 |        3 |     1 |
|     8 |        4 |     2 |
|     8 |        4 |     3 |
|     8 |        4 |     4 |
+-------+----------+-------+


-- 2. List all classes where strength is greater than 50.
SELECT class_name FROM class WHERE st_cnt>50;
+------------+
| class_name |
+------------+
| NINTH      |
| NINTH      |
| TENTH      |
+------------+

--3. List the name of students of Lina teacher.
SELECT st_fname, st_lname FROM student INNER JOIN student_class ON student.st_id = student_class.st_id INNER JOIN teacher
ON student_class.tr_id = teacher.tr_id WHERE tr_fname LIKE 'Lina';
+-----------+----------+
| st_fname  | st_lname |
+-----------+----------+
| Abhimanyu | Singh    |
| Sandeep   | Singh    |
| Satya     | K        |
| Jay       | T        |
| Alok      | Singh    |
| Aleena    | Singh    |
| John      | P        |
+-----------+----------+

--4. List the names of all the English teachers.
SELECT tr_fname, tr_lname FROM teacher WHERE subject = 'English';
+----------+----------+
| tr_fname | tr_lname |
+----------+----------+
| Jaya     | Bacchhan |
+----------+----------+

--5. List the names of teachers who teach standard 9
SELECT DISTINCT tr_fname, tr_lname FROM teacher INNER JOIN student_class ON teacher.tr_id = student_class.tr_id INNER JOIN class ON student_class.class_id = class.class_id WHERE class_name = 'NINTH';
+----------+----------+
| tr_fname | tr_lname |
+----------+----------+
| John     | K        |
| Jaya     | Bacchhan |
| Lina     | John     |
| Lekshmi  | M        |
+----------+----------+

--6. Find out all the classes that are taught by Jaya teacher
SELECT DISTINCT class_name, division FROM class INNER JOIN student_class ON class.class_id =  student_class.class_id INNER JOIN teacher ON student_class.tr_id = teacher.tr_id WHERE tr_fname = 'Jaya';
+------------+----------+
| class_name | division |
+------------+----------+
| NINTH      | A        |
| NINTH      | B        |
| TENTH      | A        |
| TENTH      | B        |
+------------+----------+

--7. List the names and details of all students in standard 10
SELECT DISTINCT  st_fname, st_lname, address, phone, email FROM student INNER JOIN student_class ON student.st_id = student_class.st_id 	INNER JOIN class ON student_class.class_id = class.class_id WHERE class_name = 'TENTH';
+----------+----------+------------+---------+------------------+
| st_fname | st_lname | address    | phone   | email            |
+----------+----------+------------+---------+------------------+
| Aleena   | Singh    | Amritsar   | 7449401 | aleena@gmail.com |
| John     | Jose     | Thrissur   | 7955847 | john@gmail.com   |
| John     | P        | Trivandrum | 7244447 | pjohn@gmail.com  |
+----------+----------+------------+---------+------------------+

--8. List all the students whose first name is the same along with their student id.
SELECT st_fname, st_lname FROM student WHERE st_fname IN (SELECT   st_fname  FROM student  GROUP BY st_fname HAVING COUNT(*)>1);
+----------+----------+
| st_fname | st_lname |
+----------+----------+
| John     | Jose     |
| John     | P        |
+----------+----------+

--9. List the name of students whose name starts with 's'.
SELECT st_fname, st_lname from student WHERE st_fname LIKE 'S%';
+----------+----------+
| st_fname | st_lname |
+----------+----------+
| Sandeep  | Singh    |
| Satya    | K        |
+----------+----------+

--10. Create a view named student_names and display the student’s first name and last name.
CREATE VIEW student_names AS SELECT st_fname, st_lname FROM student;
+-----------+----------+
| st_fname  | st_lname |
+-----------+----------+
| Abhimanyu | Singh    |
| Sandeep   | Singh    |
| Satya     | K        |
| Jay       | T        |
| Alok      | Singh    |
| Aleena    | Singh    |
| John      | Jose     |
| John      | P        |
+-----------+----------+

--11. Create a view named teacher_names and display the teacher’s first name and last name.
CREATE VIEW teacher_names AS SELECT tr_fname, tr_lname FROM teacher;
+----------+----------+
| tr_fname | tr_lname |
+----------+----------+
| John     | K        |
| Jaya     | Bacchhan |
| Lina     | John     |
| Lekshmi  | M        |
+----------+----------+

--12. Create a view named student_teachers and display the student’s first name, last name, teacher’s first name, last name and subject (that is student’s name, subjects the student is studying and the name of teacher taking that subject)
CREATE VIEW student_teachers AS SELECT st_fname, st_lname, tr_fname, tr_lname, subject FROM student INNER JOIN student_class ON student.st_id = student_class.st_id  INNER JOIN teacher ON student_class.tr_id = teacher.tr_id;

+-----------+----------+----------+----------+-----------+
| st_fname  | st_lname | tr_fname | tr_lname | subject   |
+-----------+----------+----------+----------+-----------+
| Abhimanyu | Singh    | John     | K        | Economics |
| Sandeep   | Singh    | John     | K        | Economics |
| Satya     | K        | John     | K        | Economics |
| Jay       | T        | John     | K        | Economics |
| John      | Jose     | John     | K        | Economics |
| Abhimanyu | Singh    | Jaya     | Bacchhan | English   |
| Sandeep   | Singh    | Jaya     | Bacchhan | English   |
| Satya     | K        | Jaya     | Bacchhan | English   |
| Jay       | T        | Jaya     | Bacchhan | English   |
| Alok      | Singh    | Jaya     | Bacchhan | English   |
| Aleena    | Singh    | Jaya     | Bacchhan | English   |
| John      | P        | Jaya     | Bacchhan | English   |
| Abhimanyu | Singh    | Lina     | John     | Maths     |
| Sandeep   | Singh    | Lina     | John     | Maths     |
| Satya     | K        | Lina     | John     | Maths     |
| Jay       | T        | Lina     | John     | Maths     |
| Alok      | Singh    | Lina     | John     | Maths     |
| Aleena    | Singh    | Lina     | John     | Maths     |
| John      | P        | Lina     | John     | Maths     |
| Abhimanyu | Singh    | Lekshmi  | M        | Science   |
| Sandeep   | Singh    | Lekshmi  | M        | Science   |
| Satya     | K        | Lekshmi  | M        | Science   |
| Jay       | T        | Lekshmi  | M        | Science   |
| Aleena    | Singh    | Lekshmi  | M        | Science   |
| John      | P        | Lekshmi  | M        | Science   |
+-----------+----------+----------+----------+-----------+









