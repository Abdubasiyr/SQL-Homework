create database w3resource
use w3resource
create table salesman (salesman_id int, name varchar(30), city varchar(30), commission float)
insert into salesman values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12)
select * from salesman;



create table orders (ord_no int, purch_amt float, ord_date date, customer_id int, salesman_id int)
insert into orders values 
(70009, 270.65, '2012-09-10', 3001, 5005), 
(70002, 65.26, '2012-10-05', 3002, 5001),  
(70004, 110.5, '2012-08-17', 3009, 5003),  
(70007, 948.5, '2012-09-10', 3005, 5002),  
(70005, 2400.6, '2012-07-27', 3007, 5001),  
(70008, 5760, '2012-09-10', 3002, 5001),  
(70010, 1983.43, '2012-10-10', 3004, 5006),  
(70003, 2480.4, '2012-10-10', 3009, 5003),  
(70012, 250.45, '2012-06-27', 3008, 5002),  
(70011, 75.29, '2012-08-17', 3003, 5007),  
(70013, 3045.6, '2012-04-25', 3002, 5001)
select * from orders;



create table customer (customer_id int, cust_name varchar(30), city varchar(30), grade int, salesman_id int)
insert into customer values
(3007, 'Brad Davis', 'New York', 200, 5001),  
(3005, 'Graham Zusi', 'California', 200, 5002),  
(3008, 'Julian Green', 'London', 300, 5002),  
(3004, 'Fabian Johnson', 'Paris', 300, 5006),  
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),  
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),  
(3001, 'Brad Guzan', 'London', NULL, 5005) 
select * from customer;



create table nobel_win (YEAR int, SUBJECT varchar(30), WINNER varchar(30), COUNTRY varchar(30), CATEGORY varchar(30))
insert into nobel_win values
(1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),  
(1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),  
(1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),  
(1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),  
(1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),  
(1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),  
(1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),  
(1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),  
(1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),  
(1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),  
(1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),  
(1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),  
(1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),  
(1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),  
(1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),  
(1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),  
(1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),  
(1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),  
(1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),  
(1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),  
(1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),  
(1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),  
(1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist')
select * from nobel_win;



create table item_mast (PRO_ID int, PRO_NAME varchar(30), PRO_PRICE float, PRO_COM int)
insert into item_mast values
(102, 'Key Board', 450.00, 16),  
(103, 'ZIP drive', 250.00, 14),  
(104, 'Speaker', 550.00, 16),  
(105, 'Monitor', 5000.00, 11),  
(106, 'DVD drive', 900.00, 12),  
(107, 'CD drive', 800.00, 12),  
(108, 'Printer', 2600.00, 13),  
(109, 'Refill cartridge', 350.00, 13),  
(110, 'Mouse', 250.00, 12)
select * from item_mast;



create table emp_details (EMP_IDNO int, EMP_FNAME varchar(30), EMP_LNAME varchar(30), EMP_DEPT int)
insert into emp_details values
(526689, 'Carlos', 'Snares', 63),  
(843795, 'Enric', 'Dosio', 57),  
(328717, 'Jhon', 'Snares', 63),  
(444527, 'Joseph', 'Dosni', 47),  
(659831, 'Zanifer', 'Emily', 47),  
(847674, 'Kuleswar', 'Sitaraman', 57),  
(748681, 'Henrey', 'Gabriel', 47),  
(555935, 'Alex', 'Manuel', 57),  
(539569, 'George', 'Mardy', 27),  
(733843, 'Mario', 'Saule', 63),  
(631548, 'Alan', 'Snappy', 27),  
(839139, 'Maria', 'Foster', 57)
select * from emp_details;



create table employees (EMPLOYEE_ID int, FIRST_NAME varchar(30), LAST_NAME varchar(30), EMAIL varchar(30), PHONE_NUMBER varchar(30), HIRE_DATE date, JOB_ID varchar(30), SALARY float, COMMISSION_PCT float, MANAGER_ID int, DEPARTMENT_ID int)
insert into employees values
(100, 'Steven', 'King', 'SKING', '515.123.4567', '2003-06-17', 'AD_PRES', 24000.00, 0.00, 0, 90),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '2005-09-21', 'AD_VP', 17000.00, 0.00, 100, 90),  
(102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '2001-01-13', 'AD_VP', 17000.00, 0.00, 100, 90),  
(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '2006-01-03', 'IT_PROG', 9000.00, 0.00, 102, 60),  
(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '2007-05-21', 'IT_PROG', 6000.00, 0.00, 103, 60),  
(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '2005-06-25', 'IT_PROG', 4800.00, 0.00, 103, 60),  
(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '2006-02-05', 'IT_PROG', 4800.00, 0.00, 103, 60),  
(107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '2007-02-07', 'IT_PROG', 4200.00, 0.00, 103, 60),  
(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '2002-08-17', 'FI_MGR', 12008.00, 0.00, 101, 100),  
(109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '2002-08-16', 'FI_ACCOUNT', 9000.00, 0.00, 108, 100),  
(110, 'John', 'Chen', 'JCHEN', '515.124.4269', '2005-09-28', 'FI_ACCOUNT', 8200.00, 0.00, 108, 100),  
(111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '2005-09-30', 'FI_ACCOUNT', 7700.00, 0.00, 108, 100),  
(112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '2006-03-07', 'FI_ACCOUNT', 7800.00, 0.00, 108, 100),  
(113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', '2007-12-07', 'FI_ACCOUNT', 6900.00, 0.00, 108, 100),  
(114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', '2002-12-07', 'PU_MAN', 11000.00, 0.00, 100, 30),  
(115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', '2003-05-18', 'PU_CLERK', 3100.00, 0.00, 114, 30),  
(116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', '2005-12-24', 'PU_CLERK', 2900.00, 0.00, 114, 30),  
(117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', '2005-07-24', 'PU_CLERK', 2800.00, 0.00, 114, 30),  
(118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', '2006-11-15', 'PU_CLERK', 2600.00, 0.00, 114, 30),  
(119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', '2007-08-10', 'PU_CLERK', 2500.00, 0.00, 114, 30),  
(120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', '2004-07-18', 'ST_MAN', 8000.00, 0.00, 100, 50),  
(121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', '2005-04-10', 'ST_MAN', 8200.00, 0.00, 100, 50),  
(122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', '2003-05-01', 'ST_MAN', 7900.00, 0.00, 100, 50)
select * from employees;



create table departments (DEPARTMENT_ID int, DEPARTMENT_NAME varchar(30), MANAGER_ID int, LOCATION_ID int)
insert into departments values 
(10, 'Administration', 200, 1700),  
(20, 'Marketing', 201, 1800),  
(30, 'Purchasing', 114, 1700),  
(40, 'Human Resources', 203, 2400),  
(50, 'Shipping', 121, 1500),  
(60, 'IT', 103, 1400),  
(70, 'Public Relations', 204, 2700),  
(80, 'Sales', 145, 2500),  
(90, 'Executive', 100, 1700),  
(100, 'Finance', 108, 1700),  
(110, 'Accounting', 205, 1700),  
(120, 'Treasury', 0, 1700),  
(130, 'Corporate Tax', 0, 1700),  
(140, 'Control And Credit', 0, 1700),  
(150, 'Shareholder Services', 0, 1700),  
(160, 'Benefits', 0, 1700),  
(170, 'Manufacturing', 0, 1700),  
(180, 'Construction', 0, 1700),  
(190, 'Contracting', 0, 1700),  
(200, 'Operations', 0, 1700),  
(210, 'IT Support', 0, 1700),  
(220, 'NOC', 0, 1700),  
(230, 'IT Helpdesk', 0, 1700),  
(240, 'Government Sales', 0, 1700),  
(250, 'Retail Sales', 0, 1700),  
(260, 'Recruiting', 0, 1700),  
(270, 'Payroll', 0, 1700) 
select * from departments;



create table job_history (EMPLOYEE_ID int, START_DATE date, END_DATE date, JOB_ID varchar(30), DEPARTMENT_ID int)
insert into job_history values
(102, '2001-01-13', '2006-07-24', 'IT_PROG', 60),  
(101, '1997-09-21', '2001-10-27', 'AC_ACCOUNT', 110),  
(101, '2001-10-28', '2005-03-15', 'AC_MGR', 110),  
(201, '2004-02-17', '2007-12-19', 'MK_REP', 20),  
(114, '2006-03-24', '2007-12-31', 'ST_CLERK', 50),  
(122, '2007-01-01', '2007-12-31', 'ST_CLERK', 50),  
(200, '1995-09-17', '2001-06-17', 'AD_ASST', 90),  
(176, '2006-03-24', '2006-12-31', 'SA_REP', 80),  
(176, '2007-01-01', '2007-12-31', 'SA_MAN', 80),  
(200, '2002-07-01', '2006-12-31', 'AC_ACCOUNT', 90)
select * from job_history;



create table locations (LOCATION_ID int, STREET_ADDRESS varchar(100), POSTAL_CODE varchar(30), CITY varchar(30), STATE_PROVINCE varchar(30), COUNTRY_ID varchar(30))
insert into locations values 
(1000, '1297 Via Cola di Rie', '989', 'Roma', null, 'IT'),  
(1100, '93091 Calle della Testa', '10934', 'Venice', null, 'IT'),  
(1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'),  
(1300, '9450 Kamiya-cho', '6823', 'Hiroshima', null, 'JP'),  
(1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'),  
(1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'),  
(1600, '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'),  
(1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'),  
(1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'),  
(1900, '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'),  
(2000, '40-5-12 Laogianggen', '190518', 'Beijing', null, 'CN'),  
(2100, '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'),  
(2200, '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'),  
(2300, '198 Clementi North', '540198', 'Singapore', null, 'SG'),  
(2400, '8204 Arthur St', null, 'London', null, 'UK'),  
(2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK'),  
(2600, '9702 Chester Road', '9629850293', 'Stretford', 'Manchester', 'UK'),  
(2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'),  
(2800, 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'),  
(2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'),  
(3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'),  
(3100, 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'),  
(3200, 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal', 'MX')
select * from locations;



create table jobs (JOB_ID varchar(50), JOB_TITLE varchar(50), MIN_SALARY int, MAX_SALARY int)
insert into jobs values 
('AD_PRES', 'President', 20080, 40000),  
('AD_VP', 'Administration Vice President', 15000, 30000),  
('AD_ASST', 'Administration Assistant', 3000, 6000),  
('FI_MGR', 'Finance Manager', 8200, 16000),  
('FI_ACCOUNT', 'Accountant', 4200, 9000),  
('AC_MGR', 'Accounting Manager', 8200, 16000),  
('AC_ACCOUNT', 'Public Accountant', 4200, 9000),  
('SA_MAN', 'Sales Manager', 10000, 20080),  
('SA_REP', 'Sales Representative', 6000, 12008),  
('PU_MAN', 'Purchasing Manager', 8000, 15000),  
('PU_CLERK', 'Purchasing Clerk', 2500, 5500),  
('ST_MAN', 'Stock Manager', 5500, 8500),  
('ST_CLERK', 'Stock Clerk', 2008, 5000),  
('SH_CLERK', 'Shipping Clerk', 2500, 5500),  
('IT_PROG', 'Programmer', 4000, 10000),  
('MK_MAN', 'Marketing Manager', 9000, 15000),  
('MK_REP', 'Marketing Representative', 4000, 9000),  
('HR_REP', 'Human Resources Representative', 4000, 9000),  
('PR_REP', 'Public Relations Representative', 4500, 10500)
select * from jobs;
















