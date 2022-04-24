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

Select emp_no,
	first_name,
	last_name,
	dept_name
Into sales_team
From dept_info
Where dept_name = 'Sales'; 

Select emp_no,
	first_name,
	last_name,
	dept_name
Into sales_and_dev_team
From dept_info
Where dept_name In ('Sales','Development'); 
