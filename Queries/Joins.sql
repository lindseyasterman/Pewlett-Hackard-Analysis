-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
From retirement_info as ri
Left Join dept_emp as de
On ri.emp_no = de.emp_no;

Select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
Into current_emp
From retirement_info as ri
Left Join dept_emp as de
On ri.emp_no = de.emp_no
Where de.to_date = ('9999-01-01');


Select Count (*) From current_emp;

--Employee count by department number 
Select Count (ce.emp_no), de.dept_no
Into counts_by_dept
From current_emp as ce
Left Join dept_emp as de
On ce.emp_no = de.emp_no
Group by de.dept_no
Order by de.dept_no;

Select * From counts_by_dept;

Select * From salaries
Order by to_date Desc;

Select emp_no,
	first_name,
	last_name,
	gender
Into emp_info
From employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

Select e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
Into emp_info
From employees as e
Inner Join salaries as s
On (e.emp_no = s.emp_no)
Inner Join dept_emp as de
On (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');
	
-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
Select * From manager_info

Select ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
Into dept_info
From current_emp as ce
Inner Join dept_emp as de
On (ce.emp_no = de.emp_no)
Inner Join departments as d
On (de.dept_no = d.dept_no);