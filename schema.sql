-- Create and use the database

create database gym;
use gym;

-- Create the tables

create table membership_plan(plan_id int primary key,plan_name varchar(30),price int,duration varchar(20));

create table members(member_id int primary key,member_name varchar(50),mailid varchar(30),
phone_number varchar(15),plan_id int,join_date date,foreign key(plan_id) references membership_plan(plan_id));

alter table members add column gender varchar(15);

create table instructors(instructor_id int primary key,instructor_name varchar(30),
instructor_role varchar(30),phone_number varchar(15));

create table classes(class_id int primary key,class_name varchar(30),class_schedule varchar(30),
instructor_id int,foreign key(instructor_id) references instructors(instructor_id));

create table enrollments(enroll_id int,member_id int,class_id int,enroll_date varchar(30),
foreign key(member_id) references members(member_id),foreign key(class_id) references classes(class_id));
