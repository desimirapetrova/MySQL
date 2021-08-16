-- 1
use gringotts;
select count(id) as `count` from wizzard_deposits;

-- 2
select max(magic_wand_size) as `longest_magiic_wand` from wizzard_deposits;

-- 3
select deposit_group,max(magic_wand_size) as `longest_magiic_wand` from wizzard_deposits
group by deposit_group
order by `longest_magiic_wand`,deposit_group;

-- 4
select deposit_group from wizzard_deposits
group by deposit_group
having  min(magic_wand_size) 
limit 1;
 
 -- 5
 select deposit_group,sum(deposit_amount) as `total_sum` from wizzard_deposits
group by deposit_group
order by `total_sum`;

-- 6
select deposit_group,sum(deposit_amount) as `total_sum` from wizzard_deposits
where magic_wand_creator='Ollivander family'
group by deposit_group
order by deposit_group;

-- 7
select deposit_group,sum(deposit_amount) as `total_sum` from wizzard_deposits
where magic_wand_creator='Ollivander family'
group by deposit_group
having `total_sum`<150000
order by total_sum desc;

-- 8
select deposit_group,magic_wand_creator,min(deposit_charge)
 as `min_deposit_charge`
 from wizzard_deposits
 group by deposit_group,magic_wand_creator
 order by magic_wand_creator,deposit_group;

-- 9
select(
case 
when `age`between 0 and 10 then '[0-10]'
when `age`between 11 and 20 then '[11-20]'
when `age`between 21 and 30 then '[21-30]'
when `age`between 31 and 40 then '[31-40]'
when `age`between 41 and 50 then '[41-50]'
when `age`between 51 and 60 then '[51-60]'
else '[61+]'
end
)as `age_group`,count(*) as `wizzards_count`
from `wizzard_deposits`
group by age_group
order by age_group;

-- 10
select distinct left(first_name,1)
 as `first_letter`
 from wizzard_deposits
 where deposit_group='Troll Chest'
 order by first_name;
 
 -- 10.2
 select  left(first_name,1)
 as `first_letter`
 from wizzard_deposits
 where deposit_group='Troll Chest'
 group by `first_letter`
 order by first_name;
 
 -- 11
 select `deposit_group`,`is_deposit_expired`,avg(deposit_interest) as `average_interest`
 from wizzard_deposits
 where `deposit_start_date`>'1985-01-01'
 group by `deposit_group`,`is_deposit_expired`
 order by `deposit_group`desc,`is_deposit_expired`;
 
 -- 12
 use soft_uni;
 select department_id,min(salary) from employees
 where department_id in(2,5,7) and hire_date>'2000-01-01'
 group by department_id;
 
 -- 13?
 create table `hpe`as
 select * from `employees`
 where `salary`>30000 and `manager_id`!=42;
 
 update `hpe`
 set `salary`=`salary`+5000
 where `department_id`=1; 
 
 select `department_id`,avg(`salary`)as `avg_salary`
 from `hpe`
 group by `department_id`
 order by `department_id`;
 
 -- 14
  select department_id,max(salary) as `max_salary`
  from employees
 group by department_id
 having `max_salary`<30000 or `max_salary`>70000
 order by department_id;
 
 -- 15
 select count(salary) as `count_salary`
   from employees
 where manager_id is null;
 
 -- 16???
 select e.department_id,(
 select distinct e2.`salary`from `employees` as e2
 where e2.department_id=e.department_id
 order by salary desc
 limit 1 offset 2
 )as `max_salary`
 from employees as e
 group by e.department_id
  having max_salary is not null
 order by e.department_id;

 
 use soft_uni;
 -- 17?
  select e.first_name,e.last_name,e.department_id
  from employees as e
  where e.salary>(
  select avg(e2.salary)
  from `employees` as e2
  where e2.department_id=e.department_id
  )
 order by department_id,employee_id
 limit 10;
 
 -- 18
  select department_id,sum(salary) as `total_salary`
 from employees
 group by department_id
 order by department_id;