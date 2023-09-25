use ds6;
select* from country_and_race;

/*1 Changing MyUnknownColumn to Slno*/
alter table country_and_race rename column MyUnknownColumn to Slno;

/* 2 Selecting Total count Female from Table */
select count(Gender) as FemaleCount from country_and_race where Gender = 'Female';

/* 3 Selecting Total Count of Male from Table */
select count(Gender) as MaleCount from country_and_race where Gender = 'Male';

/* 4 Finding JobTitles */
select distinct JobTitle,count(JobTitle) as Count from country_and_race group by JobTitle ;

/*5 Finding average salary of Each JobTitle*/
select JobTitle,avg(Salary) as AVERAGE_SALARY from country_and_race group by JobTitle;


/* 6 Finding Maximum salary of Each JobTitle*/
select JobTitle,max(Salary) as Maximum_Salary 
from country_and_race group by JobTitle 
order by max(Salary) desc;


/*7 Finding Minimum salary of Each JobTitle*/
select JobTitle,min(Salary) as Minimum_Salary from country_and_race group by JobTitle;


/*8 Records Job Having Salary greather than '250000'*/
select * from country_and_race where Salary >= '25000';

/*9 Total Count of Age */
select distinct Age,count(Age) as Count from country_and_race group by Age;

/*10 Maximum Age From Table */
select max(Age) as Age from country_and_race ;

/* 11 Minimum Age From Table */
select min(Age) as Age from country_and_race ;

/* 12 Find out Details JobTitles  matching for Age 21 */
select JobTitle from country_and_race where Age = 21;

/*13 Select data that are NOT from USA*/
select * from country_and_race
where not Country = 'USA';

/*14 Finding out Datascientist from record*/
select * from country_and_race
where  JobTitle = 'Data Scientist';

/*15 datascientist with Salary Above 20000*/
select * from country_and_race 
where Salary >=20000 and JobTitle ='Data Scientist'order by Salary desc;

/*16 Job of PhD EducationLevel*/
select JobTitle from country_and_race where EducationLevel='PhD';


/* 17 .10 record with Master's EducationLevl*/
select *from country_and_race where EducationLevel = "Master's" limit 10;

/*18. Find the employee who salary matches the salary of any designation*/
select*from country_and_race where Salary in (select min(Salary) from country_and_race group by JobTitle);

/*19. Find the Employee who earn more than the avg salary*/
select * from country_and_race where Salary>(select avg(Salary) from country_and_race);

/*20. JobTitle with  Salary between  25000 and 113243 */
select JobTitle,Salary from country_and_race where Salary between 25000 and 113243;










