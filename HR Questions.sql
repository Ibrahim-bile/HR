--QUESTIONS for Analysis



-- 1. What is the gender breakdown of employees in the company?

select gender, count(*) as count 
from [portfolioProject].[dbo].[hr]
where termdate = '0000-00-00:00:00:00 UTC'
group by gender 

------------------------------------------------------------------------------------------------

-- 2. What is the race/ethnicity breakdown of employees in the company?


select race, count(*) as count 
from [portfolioProject].[dbo].[hr]
where termdate = '0000-00-00:00:00:00 UTC'
group by race  
order by count desc

-------------------------------------------------------------------------------------

-- 3. What is the age distribution of employees in the company?

select min(age) as youngest ,
       max(age) as oldest 
from [portfolioProject].[dbo].[hr]
where termdate = '0000-00-00:00:00:00 UTC'


select  
      case
        when age >= 18 and age <= 24 
then '18-24'
	    when age >= 25 and age <= 34 
then '25-34'
	    when age >= 35 and age<= 44
then '35-44'
        when age >= 45 and age <= 54 
then '45-54'
        when age >= 55 and age <= 64 
then '55-64'
		else '65+' 
		end as age_group ,gender,
		count(*) as count
from [portfolioProject].[dbo].[hr]
where termdate = '0000-00-00:00:00:00 UTC'
group by gender,
   case
        when age >= 18 and age <= 24 
then '18-24'
	    when age >= 25 and age <= 34 
then '25-34'
	    when age >= 35 and age<= 44
then '35-44'
        when age >= 45 and age <= 54 
then '45-54'
        when age >= 55 and age <= 64 
then '55-64'
		else '65+' 
		end
order by age_group, gender

---------------------------------------------------------------------------------------------------------------

-- 4. How many employees work at headquarters versus remote locations?

select location, count(*) as count 
from [portfolioProject].[dbo].[hr]
where termdate = '0000-00-00:00:00:00 UTC'
group by location

----------------------------------------------------------------------------------------------------------------------

-- 5. How does the gender distribution vary across departments and job titles?

select department, gender, count(*) as count 
from [portfolioProject].[dbo].[hr] 
where termdate = '0000-00-00:00:00:00 UTC'
group by department, gender 
order by department

-------------------------------------------------------------------------------------------------------

-- 6. What is the distribution of job titles across the company?

select jobtitle, count(*) as count 
from [portfolioProject].[dbo].[hr] 
where termdate = '0000-00-00:00:00:00 UTC'
group by jobtitle
order by jobtitle desc

--------------------------------------------------------------------------------------------------------------------

-- 7. Which department has the highest turnover rate?

select department, 
      count(*) as total_employees,
	  sum(case when termdate <> '0000-00-00:00:00:00 UTC' then 1 else 0 end) as turnover_employees,
	  round(100.0* sum(case when termdate <> '0000-00-00:00:00:00 UTC' then 1 else 0 end) / count(*), 2) as turnover_rate 
from [portfolioProject].[dbo].[hr] 
group by department 
order by turnover_rate desc

---------------------------------------------------------------------------------------------------------------------

-- 8. What is the distribution of employees across locations by city and state?

select location_state, count(*) as employee_count 
from [portfolioProject].[dbo].[hr] 
where termdate = '0000-00-00:00:00:00 UTC'
group by location_state
order by location_state 

------------------------------------------------------------------------------------------------------------------------

-- 9. What is the tenure distribution for each department?
select 
       department,
	   round(avg(datediff(YEAR,hire_date,getdate())),0) as avg_tenure 
from [portfolioProject].[dbo].[hr]
where termdate = '0000-00-00:00:00:00 UTC'
group by department

-------------------------------------------------------------------------------------------------------------------