-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  
-- 
--  DELIVERABLE 1
-- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
--  create a Retirement Titles table that holds 
-- all the titles of current employees who were born between 
-- January 1, 1952 and December 31, 1955. 
-- Because some employees may have multiple titles in the database—
-- for example, due to promotions—you’ll need to use the DISTINCT ON statement 
-- to create a table that contains the most recent title of each employee. 
-- Then, use the COUNT() function to create a final table that has 
-- the number of retirement-age employees by most recent job title.

select e.emp_no
,e.first_name
,e.last_name
,t.title
,t.from_date
,t.to_date
into retire_titles
from employees e
left join titles t
on e.emp_no = t.emp_no
where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by 1
;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no
,r.first_name
,r.last_name
,r.title
INTO unique_titles
FROM retire_titles r
ORDER BY r.emp_no, r.to_date DESC;

-- retrieve the number of employees by their most recent job title who are about to retire.
select u.title, count(u.title)
into retiring_titles
from unique_titles u
group by u.title
order by 2 desc
;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  
-- 
--  DELIVERABLE 2
-- 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- create a mentorship-eligibility table that holds 
-- the current employees who were born between 
-- January 1, 1965 and December 31, 1965.

SELECT DISTINCT ON (e.emp_no) e.emp_no
,e.first_name
,e.last_name
,e.birth_date
,de.from_date
,de.to_date
,t.title
INTO mentors
FROM employees e
LEFT JOIN dept_emp de on e.emp_no = de.emp_no
LEFT JOIN titles t on e.emp_no = t.emp_no
WHERE de.to_date='9999-01-01'
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY 1
;
















