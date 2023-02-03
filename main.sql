
--From the doctors table, fetch the details of doctors who work in the same hospital but in different speciality.

create table doctors
(
id int primary key,
name varchar(50) not null,
speciality varchar(100),
hospital varchar(50),
city varchar(50),
consultation_fee int
);

insert into doctors values
(1, 'Dr. Shashank', 'Ayurveda', 'Apollo Hospital', 'Bangalore', 2500),
(2, 'Dr. Abdul', 'Homeopathy', 'Fortis Hospital', 'Bangalore', 2000),
(3, 'Dr. Shwetha', 'Homeopathy', 'KMC Hospital', 'Manipal', 1000),
(4, 'Dr. Murphy', 'Dermatology', 'KMC Hospital', 'Manipal', 1500),
(5, 'Dr. Farhana', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1700),
(6, 'Dr. Maryam', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1500);



with cte as (
    select *,
    max(salary)over(partition by dept_name) as max_sal,
    min(salary)over(partition by dept_name) as min_sal
    from employee)
select distinct t1.emp_id,t1.emp_name,t1.dept_name,t1.salary,t1.max_sal,t1.min_sal
from cte t1
join cte t2
on t1.dept_name=t2.dept_name and (t1.salary=t2.max_sal or t1.salary=t2.min_sal)
