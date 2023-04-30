USE DATABASE bankdb;

--1. Write a function to find the number of customers who have loan

DELIMITER $$
CREATE FUNCTION num_customers_with_loan()
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE count INTEGER;
SELECT COUNT(DISTINCT cust_id)
INTO count FROM borrow;
				
RETURN count;
END$$
DELIMITER ;

SELECT num_customers_with_loan();    --calling--

+---------------------------+
| num_customers_with_loan() |
+---------------------------+
|                         6 |
+---------------------------+


--2. Write a procedure to list details of all customers

DELIMITER $$
CREATE PROCEDURE list_all_customers()
BEGIN
SELECT * FROM customer;
END $$
DELIMITER ; 

CALL list_all_customers();   --calling--

+---------+-----------+------------+
| cust_id | cust_name | city       |
+---------+-----------+------------+
|    2101 | Prabha    | Thrissur   |
|    2102 | Akshay    | Nagpur     |
|    2103 | Sandeep   | Bangalore  |
|    2104 | Abhimanyu | Bombay     |
|    2105 | Aadarsh   | Trivandrum |
|    2106 | Suraj     | Shalimar   |
|    2107 | Laxman    | Nagpur     |
|    2108 | Lucky     | Nagpur     |
|    2109 | Sonia     | Bangalore  |
|    2201 | John      | Thrissur   |
|    2202 | Nikhil    | Trivandrum |
|    2203 | Sunil     | Thrissur   |
+---------+-----------+------------+


CREATE TABLE department( dept_id  INT  PRIMARY KEY  AUTO_INCREMENT,
dept_name  VARCHAR(50)  NOT NULL
);

+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| dept_id   | int         | NO   | PRI | NULL    | auto_increment |
| dept_name | varchar(50) | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

CREATE TABLE employee( emp_id  INT   PRIMARY KEY  AUTO_INCREMENT,
e_name  VARCHAR(20)  NOT NULL,
dob          DATE      NOT NULL,
doj           DATE      NOT NULL,
sal           INT         NOT NULL,
dept_id   INT,
FOREIGN KEY (dept_id) REFERENCES  department(dept_id)
);

+---------+-------------+------+-----+---------+----------------+
| Field   | Type        | Null | Key | Default | Extra          |
+---------+-------------+------+-----+---------+----------------+
| emp_id  | int         | NO   | PRI | NULL    | auto_increment |
| e_name  | varchar(20) | NO   |     | NULL    |                |
| dob     | date        | NO   |     | NULL    |                |
| doj     | date        | NO   |     | NULL    |                |
| sal     | int         | NO   |     | NULL    |                |
| dept_id | int         | YES  | MUL | NULL    |                |
+---------+-------------+------+-----+---------+----------------+


--inserting values to  department--

INSERT INTO department(dept_name)
VALUES
('General Management'),
('Marketing'),
('Finance'),
('Operations'),
('Sales'),
('HR'),
('Legal'),
('Purchase'),
('Accounting'),
('Administrative');
+---------+--------------------+
| dept_id | dept_name          |
+---------+--------------------+
|       1 | General Management |
|       2 | Marketing          |
|       3 | Finance            |
|       4 | Operations         |
|       5 | Sales              |
|       6 | HR                 |
|       7 | Legal              |
|       8 | Purchase           |
|       9 | Accounting         |
|      10 | Administrative     |
+---------+--------------------+

--inserting values to employee--

INSERT INTO employee( e_name, dob, doj, sal, dept_id)
VALUES
('Adarsh','2002-01-01','2021-02-11',350000,2),
('Aadarsh','2002-03-01','2020-02-17',550000,3),
('Nikhil','2003-02-01','2021-02-10',300000,4),
('Rizwan','2002-06-01','2021-02-21',350000,10),
('John','2002-01-01','2021-01-31',450000,5),
('Joel','2003-01-01','2021-03-21',250000,3),
('Hanna','2003-01-21','2021-02-11',50000,10),
('Hridhya','2001-08-11','2021-04-10',500000,10);

+--------+---------+------------+------------+--------+---------+
| emp_id | e_name  | dob        | doj        | sal    | dept_id |
+--------+---------+------------+------------+--------+---------+
|      1 | Adarsh  | 2002-01-01 | 2021-02-11 | 350000 |       2 |
|      2 | Aadarsh | 2002-03-01 | 2020-02-17 | 550000 |       3 |
|      3 | Nikhil  | 2003-02-01 | 2021-02-10 | 300000 |       4 |
|      4 | Rizwan  | 2002-06-01 | 2021-02-21 | 350000 |      10 |
|      5 | John    | 2002-01-01 | 2021-01-31 | 450000 |       5 |
|      6 | Joel    | 2003-01-01 | 2021-03-21 | 250000 |       3 |
|      7 | Hanna   | 2003-01-21 | 2021-02-11 |  50000 |      10 |
|      8 | Hridhya | 2001-08-11 | 2021-04-10 | 500000 |      10 |
+--------+---------+------------+------------+--------+---------+

--4. Write a procedure for updating the salary of employees working in the department with dept_id=10 by 20%

DELIMITER $$
CREATE PROCEDURE update_salary_dept_10()
BEGIN
UPDATE employee
SET sal = sal * 1.20
WHERE dept_id = 10 ;
END $$
DELIMITER ;

CALL update_salary_dept_10;
+--------+---------+------------+------------+--------+---------+
| emp_id | e_name  | dob        | doj        | sal    | dept_id |
+--------+---------+------------+------------+--------+---------+
|      1 | Adarsh  | 2002-01-01 | 2021-02-11 | 350000 |       2 |
|      2 | Aadarsh | 2002-03-01 | 2020-02-17 | 550000 |       3 |
|      3 | Nikhil  | 2003-02-01 | 2021-02-10 | 300000 |       4 |
|      4 | Rizwan  | 2002-06-01 | 2021-02-21 | 420000 |      10 |
|      5 | John    | 2002-01-01 | 2021-01-31 | 450000 |       5 |
|      6 | Joel    | 2003-01-01 | 2021-03-21 | 250000 |       3 |
|      7 | Hanna   | 2003-01-21 | 2021-02-11 |  60000 |      10 |
|      8 | Hridhya | 2001-08-11 | 2021-04-10 | 600000 |      10 |
+--------+---------+------------+------------+--------+---------+


--5. Write a function for employee table which accepts dept_id and return the highest salary in that department. Handle the error if the dept_id does not exist or if there is more than one employee with highest salary in that department.

DELIMITER $$
CREATE FUNCTION max_sal_dept_id(dep_id INT)
RETURNS NUMERIC
DETERMINISTIC
BEGIN
DECLARE max_sal NUMERIC;
IF (dep_id < 1) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO SUCH DEPARTMENT EXISTS';
ELSEIF (SELECT COUNT(*) FROM employee WHERE dept_id = dep_id AND sal IN (SELECT MAX(sal) FROM employee WHERE dept_id = dep_id) > 1) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'MULTIPLE RECORDS FOUND';
END IF;
SELECT MAX(sal) INTO max_sal FROM employee WHERE dept_id = dep_id;
RETURN max_sal;
END$$
DELIMITER ;

SELECT max_sal_dept_id(10);

+---------------------+
| max_sal_dept_id(10) |
+---------------------+
|              600000 |
+---------------------+

--6. Write a function which accepts emp_id and returns employee experience

DELIMITER $$
CREATE FUNCTION emp_experience(e_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE experience INT;
SELECT DATEDIFF(now(),doj)/365 into experience FROM employee WHERE emp_id = e_id;
RETURN experience;
END$$
DELIMITER ;

SELECT emp_experience(5);

+-------------------+
| emp_experience(5) |
+-------------------+
|                 2 |
+-------------------+


