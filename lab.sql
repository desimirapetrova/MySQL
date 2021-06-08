-- 1
select department_id,count(id) as `Number of employees`
 from employees
 group by department_id
 order by department_id,`Number of employees`;
 
 -- 2
 select department_id,round(sum(salary)/count(department_id),2)
 from employees
 group by department_id
 order by department_id ;
  
-- 3
 select department_id ,min(salary) as `min_salary` from employees
 group by department_id
  having `min_salary`>800
 order by department_id;
 
 -- 4
 select category_id,count(*)
 from products
 where price>3
 group by category_id
 having category_id=2 ;
 
 -- 5
 select category_id,
 round(sum(price)/count(category_id),2)
 as `average_price`,
 round( min(price),2) as `cheapest product`,
 round(max(price),2)as `most expensive` 
 from products
 group by category_id
 order by category_id;
 
 
 
