
-- Insert the values in the tables

insert into membership_plan(plan_id,plan_name,duration,price)
values
(1, 'Basic', '1 month', 1000),
(2, 'Standard', '3 months', 2500),
(3, 'Premium', '6 months', 4500),
(4, 'Annual', '1 year', 8000);

insert into members(member_id,member_name,gender,phone_number,mailid,join_date,plan_id)
values
(101, 'Arun Kumar', 'Male', '+91-9876543210', 'arun.kumar@example.com', '2025-01-10', 1, '2025-05-10'),
(102, 'Priya Ramesh', 'Female', '+91-9123456789', 'priya.ramesh@example.com', '2025-02-15', 3, '2025-08-15'),
(103, 'John Dsouza', 'Male', '+91-9988776655', 'john.d@example.com', '2025-03-05', 4, '2026-03-05'),
(104, 'Sangeetha Nair', 'Female', '+91-9090909090', 'sangeetha.nair@example.com', '2025-04-20', 2, '2025-07-20'),
(105, 'Vignesh Raj', 'Male', '+91-9001234567', 'vignesh.raj@example.com', '2025-05-01', 1, '2025-06-01'),
(106, 'Meena Joseph', 'Female', '+91-9512345678', 'meena.joseph@example.com', '2025-05-18', 4, '2026-05-18'),
(107, 'Rohit Sharma', 'Male', '+91-9786123456', 'rohit.sharma@example.com', '2025-06-01', 3, '2025-12-01'),
(108, 'Lakshmi Devi', 'Female', '+91-9654321789', 'lakshmi.devi@example.com', '2025-06-10', 1, '2025-07-10'),
(109, 'Anil Kapoor', 'Male', '+91-9898989898', 'anil.kapoor@example.com', '2025-06-01', 2, '2025-09-01'),
(110, 'Divya Menon', 'Female', '+91-9876123456', 'divya.menon@example.com', '2025-07-10', 4, '2026-07-10');

insert into instructors(instructor_id,instructor_name,instructor_role,phone_number)
values
(201, 'Karthik M', 'Body Building', '+91-9876123456'),
(202, 'Divya S', 'Nutrition Coaching', '+91-9812312312'),
(203, 'Ravi Kumar', 'Senior Fitness', '+91-9955667788');

insert into classes (class_id,class_name,instructor_id,class_schedule)
values
(301, 'Barre', 202, '5:30 PM - 7:00 PM'),
(302, 'Weight Training', 201, '6:00 AM - 7:30 AM'),
(303, 'CrossFit Blast',203, '7:30 PM - 9:00 PM');

insert into classes (class_id,class_name,instructor_id,class_schedule)
values
(304, 'Yoga', 202, '7:30 AM - 9:00 AM'),
(305, 'Strength Training', 201, '6:00 PM - 7:30 PM'),
(306, 'Cycling',203, '6:30 AM - 8:00 AM'),
(307, 'Circuit Training',201, 'Sunday - 8:00 AM - 9:00 AM');

insert into enrollments (enroll_id,member_id,class_id,enroll_date)
values
(401, 101, 303, '2025-01-17'),(402, 103, 302, '2025-03-12'),(403, 104, 301, '2025-04-27'),
(404, 106, 302, '2025-05-25'),(405, 107, 303, '2025-06-08'),(406, 110, 301, '2025-07-09'),
(407, 101, 305, '2025-01-20'),(408, 104, 304, '2025-03-15'),(409, 104, 307, '2025-04-30'),
(410, 107, 307, '2025-05-29'),(411, 106, 306, '2025-06-11');
