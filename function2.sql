CREATE DEFINER=`root`@`localhost` FUNCTION `udf_top_paid_employee_by_store`(store_name VARCHAR(50)) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
RETURN (select
 concat_ws(' ',e.first_name,concat(e.middle_name,'.'),e.last_name,
 'works in store for',
 timestampdiff(year,e.hire_date,'2020-10-18'),
 'years')
 from stores as s
 join employees as e
 on s.id=e.store_id
 where s.`name`=store_name
  order by timestampdiff(year,e.hire_date,'2020-10-18')
 limit 1
 );
END