drop table departments;
create table departments(
	dept_no varchar primary key,
	dept_name varchar
);
select * from departments;

drop table dept_emp;
create table dept_emp(
	emp_no int,
	dept_no varchar,
	from_date varchar,
	to_date varchar
);
select * from dept_emp;

drop table dept_manager;
create table dept_manager(
	dept_no varchar,
	emp_no int,
	from_date varchar,
	to_date varchar
);
select * from dept_manager;

drop table employees;
create table employees(
	emp_no int primary key,
	birth_date varchar,
	first_name varchar,
	last_name varchar,
	gender varchar,
	hire_date varchar
);
select * from employees;

drop table salaries;
create table salaries(
	emp_no int,
	salary int,
	from_date varchar,
	to_date varchar
);
select * from salaries;

drop table titles;
create table titles(
	emp_no int,
	title varchar,
	from_date varchar,
	to_date varchar
);
select * from titles;


--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no, last_name, first_name, gender, salary from employees as e
inner join salaries as s
on (e.emp_no=s.emp_no)
order by emp_no asc;

--2. List employees who were hired in 1986.

select first_name, last_name, hire_date from employees
where hire_date like '1986%'
order by hire_date asc;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
 
select d.dept_no, dept_name, dm.emp_no, last_name, first_name, from_date, to_date from departments as d 
join dept_manager as dm
on (d.dept_no=dm.dept_no)
	join employees as e
	on(dm.emp_no=e.emp_no);

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no, first_name, last_name, dept_name from departments as d
join dept_emp as de
on (d.dept_no=de.dept_no)
	join employees as e
	on (e.emp_no=de.emp_no)
order by emp_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name from employees
where first_name='Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no, first_name, last_name, dept_name from departments as d
join dept_emp as de
on (d.dept_no=de.dept_no)
	join employees as e
	on (e.emp_no=de.emp_no)
where dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, 
--   first name, and department name.

select e.emp_no, last_name, first_name, dept_name from departments as d
join dept_emp as de
on (d.dept_no=de.dept_no)
	join employees as e
	on (e.emp_no=de.emp_no)
where dept_name='Sales' or dept_name='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(last_name)  as "last_name frequency" from employees
group by last_name
order by "last_name frequency" desc;


