select * 
from [portfolioProject].[dbo].[hr]
--------------------------------------------------------------------------------------------------------------------

--Change id name to emp_id 
exec sp_rename '[portfolioProject].[dbo].[hr].id' , 'emp_id', 
'COLUMN'

---------------------------------------------------------------------------------------------------------

--Change the birthdate and hire_date 


select convert (date, birthdate)
from [portfolioProject].[dbo].[hr]

alter table [portfolioProject].[dbo].[hr]
alter column birthdate date 


update [portfolioProject].[dbo].[hr]
set birthdate = convert (date, birthdate) 

------------------------------------------------------------------------------------------------------------------------------

--start with hire_date



select convert (date, hire_date)
from [portfolioProject].[dbo].[hr]


alter table [portfolioProject].[dbo].[hr]
alter column hire_date date 


update [portfolioProject].[dbo].[hr]
set hire_date = convert (date, hire_date) 


---------------------------------------------------------------------------------------------------------------------------------

--replace the null values in the termdate with 0s


select coalesce( 
                termdate, 
				'0000-00-00:00:00:00 UTC')
from [portfolioProject].[dbo].[hr]


update [portfolioProject].[dbo].[hr]
set termdate = coalesce( 
                termdate, 
				'0000-00-00:00:00:00 UTC')
----------------------------------------------------------------------------------------------------------------------

--get the age by the curent date 

alter table [portfolioProject].[dbo].[hr]
add age int

update [portfolioProject].[dbo].[hr]
set age = datediff(year,birthdate,getdate())

---------------------------------------------------------------------------------------------------------------------

--move age column to be next to birthdate
---this can be done manually 
----right click the table and the click 'design' and manullay drag the age column to be next to birthdate column 


-----------------------------------------------------------------------------------------------------------------------------


--check the youngest and oldest that have worked in the compaany

select min(age) as youngest ,
       max(age) as oldest 
from [portfolioProject].[dbo].[hr]

select * 
from [portfolioProject].[dbo].[hr] 
---------------------------------------------------------------------------------------------------------------------