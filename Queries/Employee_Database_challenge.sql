--Create retirement_titles
Select e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
Into retirement_titles
From employees as e 
Left Join titles as ti 
On (e.emp_no = ti.emp_no)
Where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
Order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, emp_no DESC;

--Create retiring_titles
Select Count (title) as "count",title
Into retiring_titles
From unique_titles
Group By title
Order By count Desc;

--Create mentorship_eligibility table 
Select Distinct On (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
Into mentorship_eligibility
From employees as e
Inner Join dept_emp as de
On (e.emp_no = de.emp_no)
Inner Join titles as ti
On (e.emp_no = ti.emp_no)
Where (de.to_date = '9999-01-01')
	And (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31');
