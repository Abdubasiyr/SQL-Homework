use w3resource
select * from salesman where city = ' Paris    ' or city = ' Rome     ';


select * from salesman where city not in (' Paris    ', ' Rome     ');


select * from customer where customer_id in (3007, 3008, 3009);


select * from salesman where commission between 0.12 and 0.14;


select * from orders where (purch_amt between 500 and 4000) and purch_amt not in (948.50, 1983.43);


select * from salesman where name between 'A' and 'L';


select * from salesman where name not between 'A' and 'M';


select * from customer where cust_name like 'B%';


select * from customer where cust_name like '%n';


select * from salesman where name like 'N__l%';


create table testtable (COL1 varchar(100))
insert into testtable values
('A001/DJ-402\44_/100/2015'),
('A001_\DJ-402\44_/100/2015'),
('A001_DJ-402-2014-2015'),
('A002_DJ-401-2014-2015'),
('A001/DJ_401'),
('A001/DJ_402\44'),
('A001/DJ_402\44\2015'),
('A001/DJ-402%45\2015/200'),
('A001/DJ_402\45\2015%100'),
('A001/DJ_402%45\2015/300'),
('A001/DJ-402\44')
select * from testtable;


select * from testtable where col1 like '%/_%' escape '/';


select * from testtable where col1 not like '%/_%' escape '/';


select * from testtable where col1 like '%//%' escape '/';


select * from testtable where col1 not like '%//%' escape '/';


select * from testtable where col1 like '%/_//%' escape '/';


select * from testtable where col1 not like '%/_//%' escape '/';


select * from testtable where col1 like '%/%%' escape '/';


select * from testtable where col1 not like '%/%%' escape '/';


select * from customer where grade is not null;


select * from emp_details where emp_lname like 'D%';


select first_name, last_name, salary from employees where salary <6000;


select first_name, last_name, department_id, salary from employees where salary >8000;


select first_name, last_name, department_id from employees where last_name = ' McEwen      ';


select * from employees where department_id is null;


select * from departments where DEPARTMENT_NAME = ' Marketing           ';


select CONCAT(first_name, ' ',	last_name) AS full_name, hire_date, salary, department_id from employees where first_name not like '%M%' order by department_id;


select * from employees 
where salary between 8000 and 12000 and commission_pct is not null
or hire_date < '1987-06-05' and department_id not in (40,120,70);


select first_name, last_name, salary from employees where commision_pct is null;


select first_name, last_name, phone_numbe, salary from employees where salary between 9000 and 17000;


select first_name, last_name, salary from employees where first_name like '%m';


select first_name, last_name, salary from employees where salary not between 7000 and 15000 order by first_name, last_name;


select first_name, last_name, job_id, hire_date from employees where hire_date between '2007-11-05' and '2009-07-05';


select first_name, last_name, department_id from employees where department_id = 70 or department_id = 90;


select first_name, last_name, salary, manager_id from employees where manager_id is not null;


select * from employees where HIRE_DATE < '2002-06-21';


select first_name, last_name, email, salary, manager_id from employees where manager_ID in (120, 103, 145);


select * from employees where first_name like '%D%' or first_name like '%S%' or first_name like'%N%' order by salary desc;


select first_name, last_name, hire_date, commission_pct, email, phone_numbe from employees where salary > 11000 or phone_numbe like '______3%' order by first_name desc;


select first_name, last_name, department_id from employees where first_name like '__s%';


select employee_id, first_name, job_id, department_id from employees where DEPARTMENT_ID not in (50, 30, 80);


select employee_id, first_name, job_id, department_id from employees where department_id in (30, 40, 90);


select employee_id from employees group by employee_id having count(*) >=2;













