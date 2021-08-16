CREATE DEFINER=`root`@`localhost` FUNCTION `ufn_count_employees_by_town`(town_name varchar(45)) RETURNS int
    DETERMINISTIC
BEGIN
declare e_count int;
set e_count:=(select count(employee_id)
from employees as e 
 join addresses as a
on e.address_id=a.address_id
join towns as t
on a.town_id=t.town_id
where t.`name`=town_name);
RETURN e_count;
END