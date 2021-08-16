-- Subqueries and JOINs
-- Lab

-- 1 Managers
select e.employee_id,concat(first_name,' ',last_name) as full_name,
d.department_id,d.`name` as department_name 
from employees as e 
right join departments as d
on e.employee_id=d.manager_id
order by employee_id
limit 5;

-- 2 Towns Addresses
select t.town_id, t.`name`as town_name,
a.address_text
from addresses as a
left join towns as t
on t.town_id=a.town_id
where t.town_id=32 or t.town_id=9 or t.town_id=15
order by t.town_id,a.address_id;

-- 3 employees without managers
select employee_id,first_name,last_name,department_id,
salary from employees as e
where manager_id is null;

-- 4 higher salary
select count(employee_id)
 from employees
where salary> (select avg(salary) from employees);