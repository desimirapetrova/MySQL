-- 1
use soft_uni;
select `first_name`,`last_name`from `employees`
where first_name like 'Sa%'
order by employee_id;

-- 2
select `first_name`,`last_name`from `employees`
where last_name like '%ei%'
order by employee_id;

-- 3?????
select `first_name` from `employees`
where hire_date  LIKE (hire_date BETWEEN'1995%' and '2005%')
order by employee_id;

-- 4
select `first_name`,`last_name`from `employees`
where job_title not like'%Engineer%'
order by employee_id;

-- 5
