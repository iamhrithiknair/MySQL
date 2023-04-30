create database bank
use bankdb;

create table branch(branch_id int PRIMARY KEY,
branch_name varchar(50) not null,
city varchar(50) default 'Trivandrum'
);

+-------------+-------------+------+-----+------------+-------+
| Field       | Type        | Null | Key | Default    | Extra |
+-------------+-------------+------+-----+------------+-------+
| branch_id   | int(11)     | NO   | PRI | NULL       |       |
| branch_name | varchar(50) | NO   |     | NULL       |       |
| city        | varchar(50) | YES  |     | Trivandrum |       |
+-------------+-------------+------+-----+------------+-------+


create table customer(cust_id int primary key,
cust_name varchar(50) not null,
city varchar(50));

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| cust_id   | int(11)     | NO   | PRI | NULL    |       |
| cust_name | varchar(50) | NO   |     | NULL    |       |
| city      | varchar(50) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+


create table deposit(acc_no int primary key,
cust_id int,
foreign key (cust_id) references customer(cust_id),
branch_id int,
foreign key (branch_id) references branch(branch_id),
amount int check(amount>=1000),
date datetime not null
);

+-----------+----------+------+-----+---------+-------+
| Field     | Type     | Null | Key | Default | Extra |
+-----------+----------+------+-----+---------+-------+
| acc_no    | int(11)  | NO   | PRI | NULL    |       |
| cust_id   | int(11)  | YES  | MUL | NULL    |       |
| branch_id | int(11)  | YES  | MUL | NULL    |       |
| amount    | int(11)  | YES  |     | NULL    |       |
| date      | datetime | NO   |     | NULL    |       |
+-----------+----------+------+-----+---------+-------+


create table borrow(loan_no int primary key,
cust_id int,
foreign key (cust_id) references customer(cust_id),
branch_id int,
foreign key (branch_id) references branch(branch_id),
amount int check(amount>=1000),
date datetime not null
);

+-----------+----------+------+-----+---------+-------+
| Field     | Type     | Null | Key | Default | Extra |
+-----------+----------+------+-----+---------+-------+
| loan_no   | int(11)  | NO   | PRI | NULL    |       |
| cust_id   | int(11)  | YES  | MUL | NULL    |       |
| branch_id | int(11)  | YES  | MUL | NULL    |       |
| amount    | int(11)  | YES  |     | NULL    |       |
| date      | datetime | NO   |     | NULL    |       |
+-----------+----------+------+-----+---------+-------+

insert into branch(branch_id,branch_name,city)
values
('1001','Cherur','Thrissur'),
('1002','Ramavarmapuram','Thrissur'),
('1003','Pattom','Trivandrum'),
('1004','ShivajiNagar','Bangalore'),
('1005','Dharampeth','Nagpur'),
('1006','Kalmeshwar','Nagpur'),
('1007','Sasthamangalam','Trivandrum'),
('1008','Kowdiar','Trivandrum'),
('1009','Palayam','Trivandrum'),
('1101','Bandra','Bombay');

+-----------+----------------+------------+
| branch_id | branch_name    | city       |
+-----------+----------------+------------+
|      1001 | Cherur         | Thrissur   |
|      1002 | Ramavarmapuram | Thrissur   |
|      1003 | Pattom         | Trivandrum |
|      1004 | ShivajiNagar   | Bangalore  |
|      1005 | Dharampeth     | Nagpur     |
|      1006 | Kalmeshwar     | Nagpur     |
|      1007 | Sasthamangalam | Trivandrum |
|      1008 | Kowdiar        | Trivandrum |
|      1009 | Palayam        | Trivandrum |
|      1101 | Bandra         | Bombay     |
+-----------+----------------+------------+

insert into customer(cust_id,cust_name,city)
values
('2101','Prabha','Thrissur'),
('2102','Akshay','Nagpur'),
('2103','Sandeep','Bangalore'),
('2104','Abhimanyu','Bombay'),
('2105','Aadarsh','Trivandrum'),
('2106','Suraj','Shalimar'),
('2107','Laxman','Nagpur'),
('2108','Lucky','Nagpur'),
('2109','Sonia','Bangalore'),
('2201','John','Thrissur'),
('2202','Nikhil','Trivandrum');
('2203','Sunil','Thrissur');

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

insert into deposit(acc_no,cust_id,branch_id,amount,date)
values
('210145456','2101','1002','50000','2021/08/03'),
('345564585','2104','1001','500000','2022/08/23'),
('548534837','2102','1003','100000','2020/11/03'),
('457575875','2105','1003','600000','2019/02/13'),
('654557587','2106','1001','100000','2020/12/13');

+-----------+---------+-----------+--------+---------------------+
| acc_no    | cust_id | branch_id | amount | date                |
+-----------+---------+-----------+--------+---------------------+
| 210145456 |    2101 |      1002 |  50000 | 2021-08-03 00:00:00 |
| 345564585 |    2104 |      1001 | 500000 | 2022-08-23 00:00:00 |
| 348498441 |    2107 |      1005 | 100000 | 2021-12-12 00:00:00 |
| 374244989 |    2202 |      1008 | 100000 | 2020-12-25 00:00:00 |
| 443548239 |    2202 |      1007 |   9000 | 2021-02-10 00:00:00 |
| 457575875 |    2105 |      1003 | 600000 | 2019-02-13 00:00:00 |
| 489348239 |    2109 |      1004 | 100000 | 2021-01-10 00:00:00 |
| 548534837 |    2102 |      1003 | 100000 | 2020-11-03 00:00:00 |
| 654557587 |    2106 |      1001 | 100000 | 2020-12-13 00:00:00 |
| 734832389 |    2103 |      1009 |  12000 | 2017-09-12 00:00:00 |
| 823714948 |    2106 |      1006 | 100000 | 2016-02-23 00:00:00 |
| 843858539 |    2105 |      1008 | 100000 | 2021-01-10 00:00:00 |
+-----------+---------+-----------+--------+---------------------+


insert into borrow(loan_no,cust_id,branch_id,amount,date)
values
('310145456','2104','1001','10000','2022/04/13'),
('510145456','2101','1002','100000','2023/08/23'),
('610145456','2102','1003','190000','2019/12/25'),
('910145456','2105','1003','1000000','2021/08/13'),
('933845456','2108','1005','14000','2021/01/01'),
('438445456','2201','1101','10000','2020/07/01'),
('554345456','2201','1006','100000','2022/06/01');

+-----------+---------+-----------+---------+---------------------+
| loan_no   | cust_id | branch_id | amount  | date                |
+-----------+---------+-----------+---------+---------------------+
| 310145456 |    2104 |      1001 |   10000 | 2022-04-13 00:00:00 |
| 438445456 |    2201 |      1101 |   10000 | 2020-07-01 00:00:00 |
| 510145456 |    2101 |      1002 |  100000 | 2023-08-23 00:00:00 |
| 554345456 |    2201 |      1006 |  100000 | 2022-06-01 00:00:00 |
| 610145456 |    2102 |      1003 |  190000 | 2019-12-25 00:00:00 |
| 910145456 |    2105 |      1003 | 1000000 | 2021-08-13 00:00:00 |
| 933845456 |    2108 |      1005 |   14000 | 2021-01-01 00:00:00 |
+-----------+---------+-----------+---------+---------------------+


--2.Display the details of all customers having a loan amount greater than 50000.
SELECT * FROM customer WHERE cust_id IN(SELECT cust_id FROM borrow WHERE amount>50000);

+---------+-----------+------------+
| cust_id | cust_name | city       |
+---------+-----------+------------+
|    2101 | Prabha    | Thrissur   |
|    2201 | John      | Thrissur   |
|    2102 | Akshay    | Nagpur     |
|    2105 | Aadarsh   | Trivandrum |
+---------+-----------+------------+

--3.Display the names of all borrowers and their corresponding loan numbers.
SELECT cust_name, loan_no FROM borrow NATURAL JOIN customer;

+-----------+-----------+
| cust_name | loan_no   |
+-----------+-----------+
| Prabha    | 510145456 |
| Akshay    | 610145456 |
| Abhimanyu | 310145456 |
| Aadarsh   | 910145456 |
| Lucky     | 933845456 |
| John      | 438445456 |
| John      | 554345456 |
+-----------+-----------+

--4.Display the customer name and branch name of customers who have made a deposit on or before 1/2/2021.
SELECT cust_name, branch_name FROM deposit  NATURAL JOIN customer INNER JOIN branch ON deposit.branch_id = branch.branch_id WHERE date<'2021/02/01';

+-----------+--------------+
| cust_name | branch_name  |
+-----------+--------------+
| Nikhil    | Kowdiar      |
| Aadarsh   | Pattom       |
| Sonia     | ShivajiNagar |
| Akshay    | Pattom       |
| Suraj     | Cherur       |
| Sandeep   | Palayam      |
| Suraj     | Kalmeshwar   |
| Aadarsh   | Kowdiar      |
+-----------+--------------+


--5.Display the customer name, the date they have deposited and the amount. [Date format: Month day year].
SELECT cust_name, DATE_FORMAT(date,'%m-%d-%y') AS date, amount FROM deposit LEFT JOIN customer ON deposit.cust_id = customer.cust_id;

+-----------+----------+--------+
| cust_name | date     | amount |
+-----------+----------+--------+
| Prabha    | 08-03-21 |  50000 |
| Abhimanyu | 08-23-22 | 500000 |
| Laxman    | 12-12-21 | 100000 |
| Nikhil    | 12-25-20 | 100000 |
| Nikhil    | 02-10-21 |   9000 |
| Aadarsh   | 02-13-19 | 600000 |
| Sonia     | 01-10-21 | 100000 |
| Akshay    | 11-03-20 | 100000 |
| Suraj     | 12-13-20 | 100000 |
| Sandeep   | 09-12-17 |  12000 |
| Suraj     | 02-23-16 | 100000 |
| Aadarsh   | 01-10-21 | 100000 |
+-----------+----------+--------+


--6.Display the names of all customers who have made deposits between 31 Oct 2020 and 31 Mar 2021.
SELECT cust_name FROM customer NATURAL JOIN deposit WHERE date BETWEEN '2020-10-31' AND '2021-03-31';

+-----------+
| cust_name |
+-----------+
| Nikhil    |
| Nikhil    |
| Sonia     |
| Akshay    |
| Suraj     |
| Aadarsh   |
+-----------+

--7.Display the count of customers who have taken a loan and belonging to Nagpur.
SELECT COUNT(loan_no) AS count FROM borrow WHERE branch_id IN(SELECT branch_id FROM branch WHERE city = 'Nagpur');

+-------+
| count |
+-------+
|     2 |
+-------+


--8.Display the average loan amount. Round the result to two decimal places.
SELECT ROUND(AVG(loan_no),2) AS average FROM borrow;

+--------------+
| average      |
+--------------+
| 609602598.86 |
+--------------+


--9.Display the customers where name starts with 's' and the branch in which they have deposited. Branch name should also start with 's'.
SELECT cust_name, branch_name FROM customer NATURAL JOIN  branch WHERE cust_name LIKE 's%' AND branch_name LIKE 's%';

+-----------+--------------+
| cust_name | branch_name  |
+-----------+--------------+
| Sandeep   | ShivajiNagar |
| Sonia     | ShivajiNagar |
+-----------+--------------+


--10.Display the customers having a loan amount between 5000 and 15000 in descending order of their loan amounts.
SELECT cust_name, amount FROM customer LEFT JOIN borrow ON customer.cust_id = borrow.cust_id WHERE amount BETWEEN '5000' AND '15000' ORDER BY
amount DESC;

+-----------+--------+
| cust_name | amount |
+-----------+--------+
| Lucky     |  14000 |
| Abhimanyu |  10000 |
| John      |  10000 |
+-----------+--------+


--11.Display the customers having a loan amount between 5000 and 15000 in alphabetical order.
SELECT cust_name, amount FROM customer NATURAL JOIN borrow WHERE amount BETWEEN 5000 AND 15000;

+-----------+--------+
| cust_name | amount |
+-----------+--------+
| Abhimanyu |  10000 |
| John      |  10000 |
| Lucky     |  14000 |
+-----------+--------+



--12.List the total loan which is given from each branch.
SELECT branch_name, SUM(amount) FROM branch NATURAL JOIN borrow GROUP BY branch_name;

+----------------+-------------+
| branch_name    | SUM(amount) |
+----------------+-------------+
| Bandra         |       10000 |
| Cherur         |       10000 |
| Dharampeth     |       14000 |
| Kalmeshwar     |      100000 |
| Pattom         |     1190000 |
| Ramavarmapuram |      100000 |
+----------------+-------------+


--13.List the total deposit amount branch-wise.
SELECT branch_name, SUM(amount) FROM branch NATURAL JOIN deposit GROUP BY branch_name;

+----------------+-------------+
| branch_name    | SUM(amount) |
+----------------+-------------+
| Cherur         |      600000 |
| Dharampeth     |      100000 |
| Kalmeshwar     |      100000 |
| Kowdiar        |      200000 |
| Palayam        |       12000 |
| Pattom         |      700000 |
| Ramavarmapuram |       50000 |
| Sasthamangalam |        9000 |
| ShivajiNagar   |      100000 |
+----------------+-------------+


--14.List the total loan from any branch.
SELECT branch_name, SUM(amount) FROM branch NATURAL JOIN borrow WHERE branch_name = 'Pattom';

+-------------+-------------+
| branch_name | SUM(amount) |
+-------------+-------------+
| Pattom      |     1190000 |
+-------------+-------------+


--15.List the total deposit of customers having an account which was started after 1 Jan 2015.
SELECT cust_name, SUM(amount) FROM customer NATURAL JOIN deposit WHERE date>'2015-01-01' GROUP BY cust_name;

+-----------+-------------+
| cust_name | SUM(amount) |
+-----------+-------------+
| Aadarsh   |      700000 |
| Abhimanyu |      500000 |
| Akshay    |      100000 |
| Laxman    |      100000 |
| Nikhil    |      109000 |
| Prabha    |       50000 |
| Sandeep   |       12000 |
| Sonia     |      100000 |
| Suraj     |      200000 |
+-----------+-------------+


--16.List total deposit of customers living in Bangalore.
SELECT cust_name, SUM(amount) FROM customer NATURAL JOIN deposit WHERE city = 'Bangalore' GROUP BY cust_name;

+-----------+-------------+
| cust_name | SUM(amount) |
+-----------+-------------+
| Sandeep   |       12000 |
| Sonia     |      100000 |
+-----------+-------------+


--17.Find the biggest deposit amount of the customers living in Bombay.
SELECT city, MAX(amount) FROM deposit LEFT JOIN customer ON deposit.cust_id = customer.cust_id WHERE city = 'Bombay';

+--------+-------------+
| city   | MAX(amount) |
+--------+-------------+
| Bombay |      500000 |
+--------+-------------+


--18.Find the total deposit of customers living in the same city that Sunil is also living.
SELECT cust_name, SUM(amount) FROM customer INNER JOIN deposit on customer.cust_id = deposit.cust_id AND city IN(SELECT city FROM customer WHERE cust_name LIKE 'Sunil') GROUP BY cust_name;

+-----------+-------------+
| cust_name | SUM(amount) |
+-----------+-------------+
| Prabha    |       50000 |
+-----------+-------------+


--19.Count the total number of customers in each city.
SELECT city, COUNT(cust_id) FROM customer GROUP BY city;

+------------+----------------+
| city       | COUNT(cust_id) |
+------------+----------------+
| Bangalore  |              2 |
| Bombay     |              1 |
| Nagpur     |              3 |
| Shalimar   |              1 |
| Thrissur   |              2 |
| Trivandrum |              2 |
+------------+----------------+


--20.List the name and deposit amount of all depositors and order them by the branch city.
SELECT cust_name, amount, city FROM deposit LEFT JOIN customer ON deposit.cust_id = customer.cust_id ORDER BY city;

+-----------+--------+------------+
| cust_name | amount | city       |
+-----------+--------+------------+
| Sandeep   |  12000 | Bangalore  |
| Sonia     | 100000 | Bangalore  |
| Abhimanyu | 500000 | Bombay     |
| Laxman    | 100000 | Nagpur     |
| Akshay    | 100000 | Nagpur     |
| Suraj     | 100000 | Shalimar   |
| Suraj     | 100000 | Shalimar   |
| Prabha    |  50000 | Thrissur   |
| Nikhil    |   9000 | Trivandrum |
| Aadarsh   | 100000 | Trivandrum |
| Aadarsh   | 600000 | Trivandrum |
| Nikhil    | 100000 | Trivandrum |
+-----------+--------+------------+


--21.* List the total deposit per branch by customers after 1 Jan 2015
SELECT branch_name, SUM(amount), AS amount FROM deposit LEFT JOIN branch ON deposit.branch_id = branch.branch_id WHERE date > '2015-01-01' GROUP BY branch_name;

+----------------+--------+
| branch_name    | amount |
+----------------+--------+
| Cherur         | 600000 |
| Dharampeth     | 100000 |
| Kalmeshwar     | 100000 |
| Kowdiar        | 200000 |
| Palayam        |  12000 |
| Pattom         | 700000 |
| Ramavarmapuram |  50000 |
| Sasthamangalam |   9000 |
| ShivajiNagar   | 100000 |
+----------------+--------+


--22.Give the branch-wise loan of customers living in Nagpur.
SELECT branch_name, city, SUM(amount) AS loan_amount FROM borrow LEFT JOIN branch ON borrow.branch_id =  branch.branch_id WHERE city = 'Nagpur' GROUP BY branch_name;

+-------------+--------+-------------+
| branch_name | city   | loan_amount |
+-------------+--------+-------------+
| Dharampeth  | Nagpur |       14000 |
| Kalmeshwar  | Nagpur |      100000 |
+-------------+--------+-------------+


--23.Count the number of customers in each branch.
SELECT branch_name, COUNT(cust_id) AS count FROM(SELECT branch_name, cust_id FROM deposit NATURAL JOIN branch UNION ALL SELECT branch_name, cust_id FROM borrow NATURAL JOIN branch) GROUP BY branch_name;

+----------------+-------+
| branch_name    | count |
+----------------+-------+
| Bandra         |     1 |
| Cherur         |     2 |
| Dharampeth     |     2 |
| Kalmeshwar     |     2 |
| Kowdiar        |     2 |
| Palayam        |     1 |
| Pattom         |     2 |
| Ramavarmapuram |     1 |
| Sasthamangalam |     1 |
| ShivajiNagar   |     1 |
+----------------+-------+

--24.Find the maximum loan of each branch.
SELECT branch_name, MAX(amount) AS max_amount FROM branch NATURAL JOIN borrow GROUP BY branch_name;

+----------------+------------+
| branch_name    | max_amount |
+----------------+------------+
| Bandra         |      10000 |
| Cherur         |      10000 |
| Dharampeth     |      14000 |
| Kalmeshwar     |     100000 |
| Pattom         |    1000000 |
| Ramavarmapuram |     100000 |
+----------------+------------+


--25.Find the number of customers who are depositors as well as borrowers.
SELECT count(*) AS count FROM deposit INNER JOIN borrow ON deposit.cust_id = borrow.cust_id;

+-------+
| count |
+-------+
|     5 |
+-------+


