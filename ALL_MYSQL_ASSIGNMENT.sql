-- assigment 1
use hr ;
-- 1  Display all information in the tables EMP and DEPT. 
select * from employees;
select * from departments;

-- 2 Display only the hire date and employee name for each employee. 
select hire_date,first_name from employees;


-- 3 Display the ename concatenated with the job ID, separated by a comma and space, andname the column Employee and Title 
select concat_ws(" ,",first_name ,  job_id) as title from employees;

-- 4 Display the hire date, name and department number for all clerks. 
select job_id,department_id hire_date, first_name 
from employees
where job_id = "clerks";

-- 5 Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT 

select * from employees;
select concat_ws(",",first_name,last_name,email,phone_number,hire_date)as output from employees;

-- 6. Display the names and salaries of all employees with a salary greater than 2000. 
select first_name,salary from employees
where salary >= 2000;

-- 7. Display the names and dates of employees with the column headers "Name" and "Start Date".
select first_name, hire_date   AS "NAME","STAR DATE" from employees;

-- 8. Display the names and hire dates of all employees in the order they were hired. 
select first_name,hire_date
from employees
order by hire_date;

-- 9. Display the names and salaries of all employees in reverse salary order. 
select first_name , salary
from employees
order by salary desc;

-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order. 
 select first_name ,commission_pct, salary,department_id 
 from employees
 where commission_pct
 order by salary desc;
 
--  11. Display the last name and job title of all employees who do not have a manager .
select last_name, job_id,manager_id 
from employees
where job_id <> manager;

-- 12. Display the last name, job, and salary for all employees whose job is sales representative or 
-- stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000,

select last_name,job_id, salary
from employees
where ( job_id between "seles_rev" and"st_clerk")
and salary <> 2500 or 3500 or 5000;
------ ----- ---- ----------------------------------------------------------- ---------------------------- -----------
--  assigment  2

-- 1) Display the maximum, minimum and average salary and commission earned. 
select max min,avg(salary ) and max ,min ,avg (commission_pct)
from employees
group by salary and commission_pct;


-- 2 Display the department number, total salary payout and total commission payout for each department. 
select department_id,sum(salary)as total_salary_payout,sum(commission_pct)as total_commission_pct_payout
from employees
group by department_id;


-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name.
select  (first_name) as " ",commission_pct as " "
from employees
where commission_pct is null;



-- 6) Display the employees name, department id and commission. If an Employee doesn'tearn the commission, then display as 'No commission'. Name the columns appropriately
select department_id, first_name as "appropriately",commission_pct as "no commission"
from employees
where commission_pct is  null;
 
 
-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee 
-- doesn't earn the commission, then display as 'No commission. Name the columns appropriately
 
 select first_name, salary * 2, commission_pct * 2
 from employees;
select  first_name as "appropriately",commission_pct as "no commission"
from employees
where commission_pct is  null;

-- 8) Display the employee's name, department id who have the first name same as another employee in the same department

select e1.first_name, e1.department_id from employees e1 join employees e2 on e1.first_name = e2.first_name
and e1.department_id = e2.department_id
and e1.employee_id <> e2.employee_id order by e1.department_id,e1.first_name; 

-- 9) Display the sum of salaries of the employees working under each Manager. 
select manager_id , sum(salary)
from employees
group by manager_id;

 -- 10) Select the Managers name, the count of employees working under and the department ID of the manager. 
select manager_id,count(manager )
from employees
group by manager_id;

-- 11) Select the employee name, department id, and the salary. Group the result with the
-- manager name and the employee last name should have second letter 'a! 
select first_name,department_id,salary
from employees; 

select count(manager), count(last_name) 
from employees
where manager like "_a%"
group by manager or last_name;

-- 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id. 
select department_id,avg(salary)
from employees
group by department_id
order by department_id;

-- 13) Select the maximum salary of each department along with the department id.
select department_id , max(salary)
from employees
group by  department_id;


-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1.
select commission_pct ,salary
where salary is not null 
 ; 
------------------------------------------------------------------------------------------------------ ----------------------------------------------------
-- assignment 3
-- 1Write a query that displays the employee's last names only from the string's 2-5th
-- position with the first letter capitalized and all other letters lowercase, Give each column an
-- appropriate label. 
select substring(last_name,2,5), last_name
from employees;

select last_name , concat(upper(substring(last_name,1,1)),lower(substring(last_name,2,5))) slicing from employees;

 -- 2 Write a query that displays the employee's first name and last name along with a " in
-- between for e.g. first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
-- month on which the employee has joined.

select concat("e ", first_name, last_name , " g") as name  
from employees;
select concat(" ram "  ,first_name,  last_name, "kumar")
from employees;
select concat_ws( "  Ram-Kumar" ,first_name, last_name)
from employees;

-- 3. Write a query to display the employee's last name and if half of the salary is greater than 
 --  ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
  --  1500 each. Provide each column an appropriate label.
  
  select last_name, salary,
  case
       when salary *0.5 >= 10000 then salary *1.1 +1500
       else salary *1.115 +1500
       end as new_salary_bonus
       from employees;
       
      -- 4 Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
		-- department id, salary and the manager name all in Upper case, if the Manager name
		-- consists of 'z' replace it with '$! .
        
        select concat(substrin(employees_id,1,2),"00" ,"E"), 4,"0" as formatted_employees_id,
		dipartment_id,
		(deparment_id,salary,manager) , 
        replace(upper(manager),"Z","$!"  )as manager_name
        from employees;
  
  -- 5. Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name 
--    starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees;' last names .

select concat(upper(substring(last_name,1,1)),lower(substring(last_name,2,5))) as formatted, 
   length(last_name)   from employees
   where last_name like "j%" or last_name like "a%" or last_name like "m%";

-- 6 Create a query to display the last name and salary for all employees. Format the salary to
-- be 15 characters long, left-padded with $. Label the column SALARY.
select last_name,salary
from employees;
select last_name,
       lpad(concat("$",salary)"$"),
       rpad(concat("15",salary)"123453657125367")
       from employees;
        
select last_name ,
     lpad(concat("15",salary),15,"123543672817623" ),rpad(concat("$"salary),1,"$") as "salary"
     from employees;
select last_name ,
       lpad(concat("$",salary),15,"$") from employees;
       
	
-- 7. Display the employee's name if it is a palindrome 
select first_name, reverse(first_name) from employees;

-- 8. Display First names of all employees with initcaps. 
select first_name, concat(upper(substr(first_name,1,1))) 
from employees;


-- 9 From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.
select street_address, concat_ws("   ", street_address)
from locations;

-- 11. Display the names and job titles of all employees with the same job as Trenna. 
 select   first_name from employees e inner join  jobs j
 on e. first_name = j.job_title;
 

-- 12. Display the names and department name of all employees working in the same city as Trenna.
select first_name,job_id , city
from employees
where city="trenaa";



-- 13. Display the name of the employee whose salary is the lowest. 
select first_name,min(salary)
from employees
group by first_name ;
-- 14. Display the names of all employees except the lowest paid.
select first_name , salary
from employees
where salary <=1200;

--------------------- ------------------------------------------ ----------------------------------------------------------------- ----------------------------
-- assignment_4
-- 1. Write a query to display the last name, department number, department name for all employees;

select e.last_name , d. department_name, e. last_name 
from employees e 
inner join departments d 
on e. department_id = d. department_id;

-- 2 Create a unique list of all jobs that are in department 4. Include the location of the department in the output.

-- 3   write a query to display the employee last name,department name,location id and city of
-- all employees who earn commission. 
select e.last_name , e.commission_pct,d. department_name ,d.location_id ,l.city  from employees e 
join   departments d 
on e . department_id = d . department_id 
join locations l 
 on l.location_id = d . department_id
 where e. last_name = e. commission_pct;
 
 
-- 4 Display the employee last name and department name of all employees who have an 'a' in their last name  
select e.last_name ,d.department_name from employees e 
join departments d
on e . department_id = d. department_id 
where e. last_name like "%a";
 
 -- 5  Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA. 
select e .last_name ,e. department_id , d . department_id , e. job_id , j . job_id,  j . job_title , d.department_name
from employees e
join departments d
on e. department_id =  d. department_id
join jobs j
on e.job_id = j . job_id
where e.  city=" atlanta";

-- 6. Display the employee last name and employee number along with their manager's last name and manager number. 
select e.last_name , e. employee_id as employees_number,e. manager, d.last_name ,d . manager_id as manager_naumber
from departments d
join employees e
on e. department_id  = d . department_id;


-- 6  display the employee last name and employee number along with their manager's last
-- name and manager number (including the employees who have no manager). 

select e.last_name ,e.employee_id as e_number , e . manager , d. manager_id 
from employees e
inner join departments d 
on d.manager_id = e . manager_id;

 
 -- 7  Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 
    select e . last_name , e.department_id as department_number , e . job_id ,d. department_id 
    from employees e 
    inner join departments d 
    on d . department_id = e . department_id
    where e . last_name = e . job_id;
 
 
 -- 8 Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 
 select  first_name ,job_id , salary , 
case
when salary >= 50000 then "A"
when salary>= 30000 then "B"
else "c "
end as grade 
from employees;
 
  

-- 10 Display the names and hire date for all employees who were hired before their
-- managers along withe their manager names and hire date. Label the columns as Employee
-- name, emp_hire_date,manager name,man_hire_date.
 select e. first_name  as emp_name , e. hire_date as emp_hire , e . manager as mgr_name 
 from employees e 
 inner join departments d 
 on e . department_id = d. department_id;
------------------ ---------------------------- -------------------------------------------------------------------------- ----------------------------------------
-- assinment 5
-- 1 Write a query to display employee numbers and employee name (first name, last name) of all the sales employees who received an amount of 2000 in bonus. 
select employee_id as employees_namber , first_name ,last_name , commission_pct as bonus
from employees
where commission_pct = 2000;

-- 2 Fetch address details of employees belonging to the state CA. If address is null, provide default value N/A. 
 select e. first_name , l . city
 from employees e 
 inner join locations l 
 on e.city = l. city
 where  "CA" is null;
 
 -- 3 Write a query that displays all the products along with the Sales OrderID even if an order has never been placed for that product.


-- 4. Find the subcategories that have at least two different prices less than $15. 


-- 5 A. Write a query to display employees and their manager details. Fetch employee id,
-- employee first name, and manager id, manager name.
-- B. Display the employee id and employee name of employees who do not have manager. 
select employee_id , first_name , manager id , manager 
from employees;
select employee_id , first_name 
from employees
where manager is not null;

-- 6. A. Display the names of all products of a particular subcategory 15 and the names of their vendors.


-------------------------------------- ---------------------------------------------- ------------------------------------------------ ----------------------
-- assignment_6
-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES. 
select last_name , hire_date ,job_id
from employees
where job_id = "sales";

-- 2 Create a query to display the employee numbers and last names of all employees who
-- earn more than the average salary. Sort the results in ascending order of salary
select employee_id as employee_number ,last_name , avg(salary)
from employees
where last_name = salary
group by  employee_id;

-- 3  Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u 
select employee_id as employees_number , last_name 
from employees
where last_name like  "%u";

-- 4 Display the last name, department number, and job ID of all employees whose department location is ATLANTA. 
select e.last_name , e.department_id as department_number , e.job_id , l.city
from employees e 
inner join locations l 
on e.city =   l.city
where e.city= "atlanta";

-- 5. Display the last name and salary of every employee who reports to FILLMORE. 
select e.last_name , e.salary , d.last_name
from employees e
inner join departments d 
on e.department_id = d.department_id ;


-- 6  Display the department number, last name, and job ID for every employee in the OPERATIONS department. 
select e.department_id , d.last_name, d.department_name , e. job_id 
from employees e 
inner join departments  d 
on e.department_id = d.department_id 
where d.department_name ='operation';

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all
-- employees who earn more than the average salary and who work in a department with any
-- employee with a 'u'in their name.
select employee_id , last_name , avg(salary)
from employees
where last_name >= salary like "%u%"
group by employee_id;


 /* 8 Display the names of all employees whose job title is the same as anyone in the sales
dept */
select e.first_name ,department_name 
from employees e 
inner join jobs j 
on e.job_id = j. job_id 
join departments d 
on e.department_id  = d.department_id 
where d.department_name = "sales";

/*9 Write a compound query to produce a list of employees showing raise percentages,
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
given a 15% raise, and employees in department 6 are not given a raise.*/

/* 10 Write a query to display the top three earners in the EMPLOYEES table. Display their last
names and salaries.*/  
select last_name , max(salary) 
from employees
group by  last_name   
limit 3;
 


/*11  Display the names of all employees with their salary and commission earned. Employees
with a null commission should have O in the commission column  */
select first_name ,salary , 
       coalesce(commission_pct,0) as commission_pct
       from employees;

/*12 Display the Managers (name) with top three salaries along with their salaries and department information.*/
select e.manager , max(e.salary) 
from employees e
inner join departments d 
on e.department_id =d.department_id 
where e.manager = e.salary
group by e.manager
limit 3;
----------------------------------- -------------------------------------- -------------------------------------------------------- ---------------------------
-- assignment_7

/*1) Find the date difference between the hire date and resignation_date for all the
employees. Display in no. of days, months and year(1 year 3 months 5 days).
Emp_ID Hire Date Resignation_Date
1 1/1/2000 7/10/2013
2 4/12/2003 3/8/2017
3 22/9/2012 21/6/2015
4 13/4/2015 NULL
5 03/06/2016 NULL
6 08/08/2017 NULL
7 13/11/2016 NULL */

/*2 Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd,
yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)*/
-- 4) Display the count of days in the previoue
	select  datediff(
                      last_day(date_sub(now(),interval 1 quarter)),
                      date_sub(now(),interval 1 quarter ) + interval 1 day)as date ;
  -- 5) Fetch the previous Quarter's second week's first day's date 
select   date_add(
                       last_day(date_sub(now(),interval 1 quarter)),
                       interval 8 day
) as firat_day_second_week_previous_quarter;

-- 6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY) 

 -- 7 Calcuate experience of the employee till date in Years and months(example 1 year and 3 months
 
 
/*8) Find the number of days elapsed between first and last flights of a passenger.
9) Find the total duration in minutes and in seconds of the flight from Rostov to Moscow*/

  








