--1. Write a procedure to insert employee details including emp_id. Handle the exception ‘Duplicate entry for primary key.

DELIMITER $$
CREATE PROCEDURE ins_employee(emp_id INT, e_name VARCHAR(50),
dob DATE, doj DATE, sal INT, dept_id INT)
BEGIN
DECLARE error INT DEFAULT 0;
DECLARE CONTINUE HANDLER FOR 1062 SET error = 1;
INSERT INTO employee VALUES(emp_id, e_name, dob, doj, sal, dept_id);
SELECT CONCAT('Employee',emp_id,'details inserted successfully');
IF(error=1) THEN
BEGIN
SELECT CONCAT('Error:Duplicate entry for primary key:',emp_id);
END;
END IF;
END$$
DELIMITER ;

CALL ins_employee(1,'Wilson','2003-09-01','2020-05-21',300000,3);
+---------------------------------------------------------+
| CONCAT('Error:Duplicate entry for primary key:',emp_id) |
+---------------------------------------------------------+
| Error:Duplicate entry for primary key:1                 |
+---------------------------------------------------------+

CALL ins_employee(9,'Wilson','2003-09-01','2020-05-21',300000,3);
+-----------------------------------------------------------+
| CONCAT('Employee',emp_id,'details inserted successfully') |
+-----------------------------------------------------------+
| Employee9details inserted successfully                    |
+-----------------------------------------------------------+

--2. Write a function which returns the name list (names separated by comma) of employees using cursor.


DELIMITER $$
CREATE FUNCTION gett_emp_names()
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE name_list VARCHAR(200);
    DECLARE done INT DEFAULT 0;
    DECLARE emp_name VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT e_name FROM employee;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    
    FETCH cur INTO emp_name;
    
    IF done = 0 THEN
        SET name_list = emp_name;
    END IF;
    
    read_loop: LOOP
        FETCH cur INTO emp_name;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SET name_list = CONCAT_WS(',', name_list, emp_name);
    END LOOP;
    
    CLOSE cur;
    
    RETURN name_list;
END$$
DELIMITER ;

SELECT gett_emp_names();

+-------------------------------------------------------------+
| gett_emp_names()                                            |
+-------------------------------------------------------------+
| Adarsh,Aadarsh,Nikhil,Rizwan,John,Joel,Hanna,Hridhya,Wilson |
+-------------------------------------------------------------+


--3. Write a procedure for updating the salary of employees by 5% for each year of experience using cursor.

DELIMITER $$
CREATE PROCEDURE update_salary()
BEGIN
DECLARE temp INT DEFAULT 0;
DECLARE id INT;
DECLARE yy INT;
DECLARE joinDate DATE;
DECLARE cur CURSOR FOR SELECT emp_id FROM employee;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET temp = 1;
OPEN cur;
loop1: WHILE temp!=1 DO
FETCH cur INTO id;
SELECT YEAR(CURDATE()) - YEAR(doj) FROM employee WHERE emp_id = id INTO yy;
loop2: WHILE yy>0 DO
UPDATE employee SET sal = sal*1.05 WHERE emp_id = id;
SET yy = yy-1;
END WHILE loop2;
END WHILE loop1;
CLOSE cur;
END$$
DELIMITER ;

CALL update_salary();
SELECT * FROM employee;
+--------+---------+------------+------------+--------+---------+
| emp_id | e_name  | dob        | doj        | sal    | dept_id |
+--------+---------+------------+------------+--------+---------+
|      1 | Adarsh  | 2002-01-01 | 2021-02-11 | 385875 |       2 |
|      2 | Aadarsh | 2002-03-01 | 2020-02-17 | 636694 |       3 |
|      3 | Nikhil  | 2003-02-01 | 2021-02-10 | 330750 |       4 |
|      4 | Rizwan  | 2002-06-01 | 2021-02-21 | 463050 |      10 |
|      5 | John    | 2002-01-01 | 2021-01-31 | 496125 |       5 |
|      6 | Joel    | 2003-01-01 | 2021-03-21 | 275625 |       3 |
|      7 | Hanna   | 2003-01-21 | 2021-02-11 |  66150 |      10 |
|      8 | Hridhya | 2001-08-11 | 2021-04-10 | 729304 |      10 |
|      9 | Wilson  | 2003-09-01 | 2020-05-21 | 347288 |       3 |
|     10 |         | 0000-00-00 | 0000-00-00 |      0 |    NULL |
|     11 |         | 0000-00-00 | 0000-00-00 |      0 |    NULL |
+--------+---------+------------+------------+--------+---------+

