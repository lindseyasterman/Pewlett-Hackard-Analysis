--Retirement eligibility
Select Count(*) 
From employees
Where birth_date Between '1952-01-01' And '1955-12-31'

Select Count (*)
From employees
Where birth_date Between '1952-01-01' And '1952-12-31'

Select Count (*)
From employees
Where birth_date Between '1953-01-01' And '1953-12-31'

Select Count (*)
From employees
Where birth_date Between '1954-01-01' And '1954-12-31'

Select Count (*)
From employees
Where birth_date Between '1955-01-01' And '1955-12-31'

Select Count (*)
From employees
Where (birth_date Between '1952-01-01' And '1955-12-31')
And (hire_date Between '1985-01-01' And '1988-12-31')

Select first_name, last_name
Into retirement_info
From employees
Where (birth_date Between '1952-01-01' And '1955-12-31')
And (hire_date Between '1985-01-01' And '1988-12-31')

Select * From retirement_info