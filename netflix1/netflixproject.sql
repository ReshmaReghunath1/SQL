use ds6;
 select * from netflix1;
 
 
 
 /* Qn 1. Movie released in United Kingdom in each year*/
 select title,release_year from netflix1
 where country ='United Kingdom'  
 order by release_year asc;
 
 /* Qn 2. Movie from India and listed in genre 'Action & Adventure, Comedies, Dramas'*/
 select * from netflix1  
 where listed_in ='Action & Adventure, Comedies, Dramas'
 and country ='India';
 
 /* Qn 3. Total movies released in the netflix in each year*/ 
 select distinct release_year,count(release_year) 
 from netflix1 
 group by release_year 
 order by release_year desc;
 
 /* Qn 4. Total Motu Patlu series released in each on neflix*/ 
select title ,release_year
from netflix1 where title like 'Motu%%';

 /* Qn 5. Movies which have duration of 1 Season on neflix*/ 
 select title,director,country,date_added from netflix1 
 where duration ='1 Season' 
 order by date_added limit  5;
 
 /*Qn 6. Movies were directors are not given in data */
select title,country,release_year from netflix1 where director ='Not Given' and duration ='1 Season' order by release_year desc;

 /*Qn 7. Which Movies is oldest as per the given data set  */
select title from netflix1 where release_year = (select  min(release_year) from netflix1);

/*Qn 8.Write query to fetch movie released after 2021 and name should start with B
 and released before 2021 and movie name should start with S and not from India */ 
Select 
distinct(title),release_year,country from netflix1
where release_year > 2020 and title like 'B%%' or release_year < 2021 and title like'S%%' 
and not country= 'India' order by title desc;
 
/*Qn 8.Write query to fetch movie and Tv Show from India and UnitedStates */ 
select * from netflix1 where country='India'
union all
(select * from netflix1 where country='United States');

/*Qn 9.Write query to fetch directors from India */ 
 select director from netflix1 where country = 'India' and type = 'Movie';
 

/*Qn 10 .Write a query to fetch the year with top number of movie release */
select release_year,
COUNT(*) as "Total Number of Movie"
from netflix1
group by 1 
order by 2 desc
limit 1;

/*Qn 10 .Write a query to fetch the directors and number their  movie release */
select director,
COUNT(*) as "Total Number of Movie"
from netflix1
group by 1 
order by 2 desc
limit 5;
 