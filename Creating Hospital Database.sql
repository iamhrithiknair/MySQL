--creating a hospital database--
CREATE DATABASE hospital;
USE hospital;

--physician table--
CREATE TABLE physician( phy_id INT PRIMARY KEY, 
phy_fname VARCHAR(50) NOT NULL, 
phy_lname VARCHAR(50) NOT NULL, 
address VARCHAR(200) NOT NULL, 
salary INT CHECK (salary>=0), 
designation VARCHAR(50) NOT NULL, 
field_of_spec VARCHAR(50) NOT NULL, 
year_of_spec INT NOT NULL
);


--nurse table--
CREATE TABLE nurse(nurse_id INT PRIMARY KEY,
nurse_name VARCHAR(50) NOT NULL,
shift INT check(shift between 1 and 3),
); 


--ward table--
CREATE TABLE ward(ward_no INT PRIMARY KEY,
ward_name VARCHAR(50) NOT NULL,
no_of_beds INT check(no_of_beds>0),
nurse_id INT,
FOREIGN KEY (nurse_id) REFERENCES nurse(nurse_id)
);

--patient table--
CREATE TABLE patient(pat_no INT PRIMARY KEY AUTO_INCREMENT,
pat_name VARCHAR(50) NOT NULL,
phy_id INT,
FOREIGN KEY (phy_id) REFERENCES physician(phy_id),
ward_no INT,
FOREIGN KEY (ward_no) REFERENCES ward(ward_no),
date_of_admit datetime NOT NULL
);


--inserting values to physician table--
INSERT INTO physician(phy_id, phy_fname, phy_lname, address, salary, designation, field_of_spec, year_of_spec)
VALUES
('1101','PRIYA','MISHRA','Surat,Gujarat', '40000', 'GYNECOLOGIST', 'GYNECOLOGY', '2026'),
('1102','VAIBHAV','SINGH','Vadodara,Gujarat', '50000', 'CARDIOLOGIST', 'CARDIOLOGY', '2026'),
('1103','ABHISHEK','SINGH','Vadodara,Gujarat', '30000', 'PAEDIATRICIAN', 'PAEDIATRICS', '2026'),
('1104','SUPRIYA','PATHAK','Ahmedabad,Gujarat', '70000', 'NEUROLOGIST', 'NEUROLOGY', '2026'),
('1105','VED','KAKKAR','Jamnagar,Gujarat', '60000', 'DERMATOLOGIST', 'DERMATOLOGY', '2026')
('1106','NOUFAL','K','Kozhikode,Kerala', '40000', 'GYNECOLOGIST', 'GYNECOLOGY', '2026'),
('1107','PRAMOD','K','Thrissur,Kerala', '30000', 'OPTHALMOLOGY', 'OPTHALMOLOGIST', '2026');


--inserting values to nurse table--
INSERT INTO nurse(nurse_id, nurse_name, shift)
VALUES
('2101','VIJAYA','2'),
('2102','SNEHA','1'),
('2103','NEHA','3'),
('2104','BEN','1'),
('2105','ALBIN','2');

--inserting values to ward table--
INSERT INTO ward(ward_no, ward_name, no_of_beds, nurse_id, telephone_no)
VALUES
('3101','CASUALTY','34', '2102','04871674'),
('3102','ICU','5', '2103','04872673'),
('3103','GENERAL WARD','100', '2105', '04876743'), 
('3104','DELUXE ROOM','5', '2101','04876535'), 
('3105','ICCU','6', '2104','04877644'),
('3106','LABOUR ROOM','3', '2101','04877645');

--inserting values to patient table--
INSERT INTO patient(pat_name,phy_id,ward_no,date_of_admit)
VALUES
('Nikhil','1104', '3103','2027/02/03'),
('Neha','1101', '3106','2027/05/23'),
('Hrithik','1104', '3104','2027/06/13'),
('Aadarsh','1102', '3104','2027/09/03'),
('John','1103', '3103','2027/12/26');

--Display the patient number and ward number of all patients--

select pat_no,ward_no from patient;
+--------+---------+
| pat_no | ward_no |
+--------+---------+
|      1 |    3103 |
|      5 |    3103 |
|      3 |    3104 |
|      4 |    3104 |
|      2 |    3106 |
+--------+---------+


--Display the name of nurse and the shift he/she is working--

select nurse_name,shift from nurse;
+------------+-------+
| nurse_name | shift |
+------------+-------+
| VIJAYA     |     2 |
| SNEHA      |     1 |
| NEHA       |     3 |
| BEN        |     1 |
| ALBIN      |     2 |
+------------+-------+


--Display the name of patients and their physician, only for patients assigned to any ward--


select pat_name,phy_fname from patient natural join physician;
+----------+-----------+
| pat_name | phy_fname |
+----------+-----------+
| Nikhil   | SUPRIYA   |
| Neha     | PRIYA     |
| Hrithik  | SUPRIYA   |
| Aadarsh  | VAIBHAV   |
| John     | ABHISHEK  |
+----------+-----------+


--Display the details of all physicians who earn more than 50,000--

select * from physician where salary>50000;
+--------+-----------+-----------+-------------------+--------+---------------+---------------+--------------+
| phy_id | phy_fname | phy_lname | address           | salary | designation   | field_of_spec | year_of_spec |
+--------+-----------+-----------+-------------------+--------+---------------+---------------+--------------+
|   1104 | SUPRIYA   | PATHAK    | Ahmedabad,Gujarat |  70000 | NEUROLOGIST   | NEUROLOGY     |         2026 |
|   1105 | VED       | KAKKAR    | Jamnagar,Gujarat  |  60000 | DERMATOLOGIST | DERMATOLOGY   |         2026 |
+--------+-----------+-----------+-------------------+--------+---------------+---------------+--------------+


--Display the unique listing of areas that the physicians are specialized in--

select distinct field_of_spec from physician;
+----------------+
| field_of_spec  |
+----------------+
| GYNECOLOGY     |
| CARDIOLOGY     |
| PAEDIATRICS    |
| NEUROLOGY      |
| DERMATOLOGY    |
| OPTHALMOLOGIST |
+----------------+



--Display the details of patients whose names have letter 'N' in them and are being treated by physician Pramod--

select * from patient where pat_name like '%N%' and phy_id in(select phy_id from physician where phy_fname='Pramod');
+--------+----------+--------+---------+---------------------+
| pat_no | pat_name | phy_id | ward_no | date_of_admit       |
+--------+----------+--------+---------+---------------------+
|      1 | Nikhil   |   1107 |    3103 | 2027-02-03 00:00:00 |
+--------+----------+--------+---------+---------------------+


--Display the physician's names and their monthly salary--

select phy_fname,phy_lname,salary from physician;
+-----------+-----------+--------+
| phy_fname | phy_lname | salary |
+-----------+-----------+--------+
| PRIYA     | MISHRA    |  40000 |
| VAIBHAV   | SINGH     |  50000 |
| ABHISHEK  | SINGH     |  30000 |
| SUPRIYA   | PATHAK    |  70000 |
| VED       | KAKKAR    |  60000 |
| NOUFAL    | K         |  40000 |
| PRAMOD    | K         |  30000 |
+-----------+-----------+--------+


--Display the names of physicians whose first name is made up of 5 letters--

select phy_fname,phy_lname from physician where phy_fname like '_____';

+-----------+-----------+
| phy_fname | phy_lname |
+-----------+-----------+
| PRIYA     | MISHRA    |
+-----------+-----------+


--Display the names of department (field_of_spec) that physicians belong to that do not start with letter 'P'--

select field_of_spec from physician where phy_fname not like 'P%';

+---------------+
| field_of_spec |
+---------------+
| CARDIOLOGY    |
| PAEDIATRICS   |
| NEUROLOGY     |
| DERMATOLOGY   |
| GYNECOLOGY    |
+---------------+

--Display the name of ward that have more than 22 beds--

select ward_name from ward where no_of_beds>22;

+--------------+
| ward_name    |
+--------------+
| CASUALTY     |
| GENERAL WARD |
+--------------+


--Display the name of all patients who are admitted, their physician's name and ward name--

select pat_name,phy_fname,ward_name from patient natural join physician natural join ward;

+----------+-----------+--------------+
| pat_name | phy_fname | ward_name    |
+----------+-----------+--------------+
| Nikhil   | PRAMOD    | GENERAL WARD |
| Neha     | PRIYA     | LABOUR ROOM  |
| Hrithik  | SUPRIYA   | DELUXE ROOM  |
| Aadarsh  | VAIBHAV   | DELUXE ROOM  |
| John     | ABHISHEK  | GENERAL WARD |
+----------+-----------+--------------+


