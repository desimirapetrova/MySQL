-- CRUD Exercies-- 
-- 1 
select * from `departments`
order by department_id;
-- 2
select `name` from `departments`;
-- 3
select `first_name`,`last_name`,`salary`from `employees`
order by `employee_id`;
-- 4
select `first_name`,`middle_name`,`last_name` from `employees`
order by `employee_id`;
-- 5
select concat(`first_name`,'.',`last_name`,'@softuni.bg')
as `full_ email_address`
 from `employees`;
-- 6
select `salary` from `employees`
order by employee_id;
-- 7
select * from `employees`
where job_title='Sales Representative';
-- 8
select `first_name`,`last_name`,`job_title`from `employees`
where salary>=20000 and salary<=30000;
-- 9
select concat_ws(' ',`first_name`,`middle_name`,`last_name`) as 'full_name'
from `employees`
where salary = 25000 or salary=14000 or salary=12500 or salary=23600;
-- 10
select `first_name`,`last_name`from `employees`
where manager_id is null;
-- 11
select `first_name`,`last_name`,`salary`from `employees`
where salary>50000
order by salary desc;
-- 12
select `first_name`,`last_name`from `employees`
order by salary desc
limit 5;
-- 13
select `first_name`,`last_name`from `employees`
where department_id!=4;
-- 14
select * from `employees`
order by salary desc , first_name asc,last_name desc,middle_name asc;
-- 15
create view `v_employees_salaries`as
select first_name,last_name,salary from `employees`;
-- 16
create view `v_employees_job_titles`as
select concat_ws(' ',first_name,middle_name,last_name) as 'full_name',
job_title
 from `employees`;

-- 17
select distinct job_title from `employees`
order by job_title asc ;
-- 18
select * from `projects`
order by start_date,`name`
limit 10;
-- 19
select first_name,last_name,hire_date from `employees`
order by hire_date desc
limit 7;

-- 20????
-- 1 -eng,2-td,4-mark,11-is, department_id
-- select salary from employees
-- where department_id=1 or department_id=2 or department_id=4 or department_id=11 
-- order by salary;

-- 21
use geography;
select `peak_name` from `peaks`
order by peak_name;

-- 22
select country_name,population from `countries`
where continent_code='EU'
order by population desc;

-- 23
use geography;
select country_name,country_code,
if(`currency_code`='EUR','Euro','Not euro')
AS 'currency'
from `countries`
order by country_name asc;

-- 24
use diablo;
select `name` from `characters`
order by `name` asc;








