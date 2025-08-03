
-- View tha datas we are entered in the table

select * from membership_plan;
select * from members;
select * from instructors;
select * from classes;
select * from enrollments;

-- =====================
-- 1. MEMBERS TABLE
-- =====================

-- Update member name

update members set member_name='Jhon Seena' where member_id=103;

-- Find male and female members

select * from members where gender = 'male';
select * from members where gender = 'female';

-- Find the members with their names

select * from members where member_name like 'a%';
select * from members where member_name like '%r';
select * from members where member_name like '%john%';

-- count total members

select count(*) from members;

-- List members who join in specific month

select * from members where join_date>='2024-06-01' and join_date<'2024-07-30';

-- List members not enrolled in any class

select * from members where member_id not in (select member_id from enrollments);

-- Arrange members name in ascending and descending order

select * from members order by member_name asc;
select * from members order by member_name desc;

-- Count number of plans available in each id

select Plan_id,count(plan_id) from members group by plan_id;

-- List members whose membership is expire in next 1 month

select * from members where end_date between curdate() and curdate() + interval 1 month;

-- ============================
-- 2. MEMBERSHIP PLANS TABLE
-- ============================

-- Count members per plan type

select plan_name,count(*) from membership_plan group by plan_name;

-- Total amount of all plans

select sum(price) as Total_Income from membership_plan;

-- Average price of all plans

select avg(price) as Avg_of_total_plans from membership_plan;

-- Find membership plans less than 3000

select * from membership_plan where price<3000;

-- Find membership plans greater than 3000

select * from membership_plan where price>3000;

-- Order plan name ascending and descending

select * from membership_plan order by plan_name desc;
select * from membership_plan order by plan_name asc;

-- =================
-- 3. CLASS TABLE
-- =================

-- Count number of classes

select count(*) as total_classes from classes;

-- List classes scheduled in the evening

select * from Classes where class_schedule like '%PM%';

-- List classes taught by Instructor ID 201

select * from classes where instructor_id = 201;

-- Show classes ordered alphabetically

select * from classes order by class_name;

-- Count classes per instructor

select instructor_id, count(*) AS class_count from classes group by instructor_id;

-- Find classes without instructor

select * from classes where instructor_id is null;

-- Find classes starting with c

select * from classes where class_name like 'c%';

-- =======================
-- 4. INSTRUCTORS TABLE
-- =======================

-- Count instructors by role

select instructor_role,count(*) from instructors group by instructor_role;

-- Find instructors teaching more than 2 different classes

select instructor_id,count(distinct class_id) as class_count from classes 
group by instructor_id having class_count > 2;

-- Find instructors where name starts with r

select * from instructors where instructor_name like 'r%';

-- Find instructors who teach Body Building

select * from instructors where instructor_role='Body Building';

-- Show instructor names only

select instructor_name from instructors;

-- Order instructors by name

select * from instructors order by instructor_name;

-- Show instructor phone numbers

select instructor_name,phone_number from instructors;

-- Count total instructors

select count(*) from instructors;

-- count classes handled by instructors

select i.instructor_name,count(c.class_id) as total_classes from instructors as i inner join classes as c 
on i.instructor_id = c.instructor_id group by i.instructor_name;

-- List instructors not assigned to any class

select * from instructors where instructor_id not in(select instructor_id from classes);

-- ========================
-- 5. ENROLLMENTS TABLE
-- ========================

-- Count total enrollments

select count(*) from enrollments;

-- Count enrollments per class

select class_id,count(*) as total_enrolled from enrollments group by class_id;

-- Show members and their classes

select m.member_name, c.class_name from enrollments as e inner join 
members as m ON e.member_id=m.member_id inner join classes as c on e.class_id=c.class_id;

-- Find members enrolled in Barre

select m.member_name from enrollments as e join members as m on e.member_id=m.member_id
join classes as c on e.class_id=c.class_id where c.class_name='Barre';

-- Enrollments in the past 1 years

select * from enrollments where enroll_date>=curdate()-interval 1 year;

-- Count unique members enrolled in any class

select count(distinct member_id) from enrollments;

-- Count members enrolled in more than one class

select member_id,count(*) from enrollments group by member_id having count(*)>1;

-- Show enrollment date per member

select m.member_name,e.enroll_date from enrollments as e join members as m on e.member_id=m.member_id;

-- Sort enrollments by date

select * from enrollments order by enroll_date;

-- List members who have not enrolled in any class

select * from members where member_id not in(select distinct member_id from enrollments);

-- Top 5 classes by enrollment

select c.class_name,count(e.member_id) as enrollments from classes as c join enrollments as e 
on c.class_id=e.class_id group by c.class_id order by enrollments desc limit 5;

-- Members who have enrolled in multiple classes

select member_id,count(class_id) as total_classes from enrollments 
group by member_id having total_classes > 1;

-- ============================
-- ============================