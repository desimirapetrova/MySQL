CREATE PROCEDURE `usp_raise_salaries`(department_name varchar(45))
BEGIN
update employees as e
join departments as d
on e.department_id=d.department_id
set salary=salary*1.05
where d.`name`=department_name;
END