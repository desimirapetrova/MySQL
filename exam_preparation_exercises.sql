-- 2 insert
insert into coaches(first_name,last_name,salary,coach_level)
select  first_name,last_name,salary*2 as salary,
char_length(first_name)as coach_level from players
where age>=45;
 
 -- 3 update
 update coaches as c
 join players_coaches as pc
 on c.id=pc.coach_id
 set coach_level=coach_level+1
 where first_name  like 'A%';
 
 -- 4 delete
 delete from coaches
 where first_name in(select first_name from players where age>=45);
 delete from players
 where age>=45;
  
  -- 5 players
  select first_name,age,salary from players
  order by salary desc;
  
  -- 6
  select p.id ,concat(first_name,' ',last_name)full_name,age,`position`,hire_date 
  from players as p
  join skills_data as s
  on p.skills_data_id=s.id
  where age<23 and `position`='A' and hire_date is null and s.strength>50
  order by salary,age;
  
  -- 7
  select `name`as team_name,established,fan_base,count(p.id)as players_count
  from teams as t
  left join players as p
  on p.team_id=t.id
  group by t.id
  order by players_count desc,fan_base desc;
  
  -- 8
  select max(s.speed) as max_speed,tow.`name` as town_name
  from players as p
   join skills_data as s
  on p.skills_data_id=s.id
 right  join teams as t
  on p.team_id=t.id
  join stadiums as st
  on st.id=t.stadium_id
  right join towns as tow
  on tow.id=st.town_id
    where t.`name` !='Devify'
  group by tow.`name`
  order by max_speed desc,town_name ;

  -- 9
  select c.`name`,
  count(p.id)as total_count_of_players,
  sum(p.salary) as total_sum_of_salaries
  from players as p
   join teams as ts
  on p.team_id=ts.id
  join stadiums as st
  on st.id=ts.stadium_id
   join towns as t
  on t.id=st.town_id
  right join countries as c
  on c.id=t.country_id
  group by c.`name`
  order by total_count_of_players desc,c.`name`;

-- 11
CALL udp_find_playmaker (20, 'Skyble');
select avg(speed) from skills_data
;
SELECT udf_stadium_players_count ('Jaxworks') as `count`; 
