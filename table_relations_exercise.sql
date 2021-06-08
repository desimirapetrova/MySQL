-- 1 	One-To-One Relationship
create database test78;
use test78;

create table passports(
passport_id int primary key auto_increment ,
passport_number varchar(30)unique
);
alter table `passports`auto_increment=101;
insert into passports(passport_number)
values
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2');
create table `people`(
person_id int primary key auto_increment,
first_name  varchar(50) ,
salary decimal(10,2) ,
passport_id int unique ,
constraint fk_passport_id
foreign key (passport_id)
references passports(passport_id)
);
insert into people
values
(1,'Roberto',43300.00,102),
(2,'Tom',56100.00,103),
(3,'Yana',60200.00,101);

-- 2 one-to-many ralationship
create table manufacturers(
manufacturer_id int primary key auto_increment,
`name` varchar(20),
estabilished_on date);

insert into manufacturers(`name`,`estabilished_on`)
values
('BMW','1916-03-01'),
('Tesla','2003-01-01'),
('Lada','1966-05-01');


create table models(
model_id int primary key ,
`name` varchar(30),
manufacturer_id int,
constraint fk_manufacturer_id
foreign key (manufacturer_id)
references manufacturers(manufacturer_id)
);
insert into `models`
values
(101,'X1',1),
(102,'i6',1),
(103,'Model S',2),
(104,'Model X',2),
(105,'Model 3',2),
(106,'Nova',3);

-- 3 Mant-to-Many ralationship
create table exams(
exam_id int primary key auto_increment,
`name`varchar(30));
alter table `exams`auto_increment=101;

insert into exams(`name`)
values
('Spring MVC'),
('Neo4j'),
('Oracle 11g');

create table students(
student_id int primary key auto_increment,
`name`varchar(30));
insert into students(`name`)
values
('Mila'),
('Toni'),
('Ron');
create table students_exams(
student_id int ,
exam_id int,
constraint pk_students_exams
primary key(student_id,exam_id),
constraint fk_students_exams_students
foreign key(student_id)
references students(student_id),
constraint  fk_students_exams_exams
foreign key (exam_id)
references exams(exam_id)
);
insert into students_exams
values
(1,101),
(1,102),
(2,101),
(3,103),
(2,102),
(2,103);

-- 4 self-referencing
create table teachers(
teacher_id int primary key auto_increment,
`name`varchar(30) not null,
manager_id int
);
alter table teachers auto_increment=101;
insert into teachers(`name`,manager_id)
values
('John',null),
('Maya',106),
('Silvia',106),
('Ted',105),
('Mark',101),
('Greta',101);

alter table teachers
add constraint fk_teachers_managers
foreign key(manager_id)
references teachers(teacher_id);

-- 5
create database online_store_database;
use online_store_database;

create table items(
item_id int primary key auto_increment,
`name`varchar(50),
item_type_id int
);

create table item_types(
item_type_id int primary key auto_increment,
`name`varchar(50)
);
alter table items
add constraint fk_item_type_id
foreign key(item_type_id)
references item_types(item_type_id);

create table order_items(
order_id int  ,
item_id int,
constraint pk_item_order_id
primary key(order_id,item_id),
constraint fk_item_id
foreign key (item_id)
references items(item_id));

create table orders(
order_id int primary key auto_increment,
customer_id int);

alter table order_items
add constraint fk_order_id
foreign key(order_id)
references orders(order_id);

create table customers(
customer_id int primary key auto_increment,
`name`varchar(50),
birthday date,
city_id int);

alter table orders
add constraint fk_customer_id
foreign key(customer_id)
references customers(customer_id);

create table cities(
city_id int primary key auto_increment,
`name`varchar(50));

alter table customers
add constraint fk_city_id
foreign key (city_id)
references cities(city_id);

-- 6

create database university;
use  university;

create table subjects(
subject_id int primary key auto_increment,
subject_name varchar(50));

create table students(
student_id int primary key auto_increment,
student_number varchar(12),
student_name varchar(50),
major_id int);

create table agenda(
student_id int,
subject_id int,
constraint pk_subject_student_id
primary key (subject_id,student_id) ,
constraint fk_subject_id
foreign key (subject_id)
references subjects(subject_id),
constraint fk_student_id
foreign key (student_id)
references students(student_id)
);

create table majors(
major_id int primary key auto_increment,
`name`varchar(50));

alter table students
add constraint fk_major_id
foreign key (major_id)
references majors(major_id);

create table payments(
payment_id int primary key auto_increment,
payment_date date,
payment_amount decimal(8,2),
student_id int,
constraint fk_payment_student_id
foreign key (student_id)
references students(student_id));

-- 7
use geography;
select mountain_range ,peak_name,elevation
from mountains 
as a
join peaks as b
on a.id=b.mountain_id
where a.id=17
order by elevation desc;


