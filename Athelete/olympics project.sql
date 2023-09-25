use ds6;
select * from athlete_events;


/* Qn 1. Fetch the details of Youngest Athelets to win Gold medal*/
select distinct Name,Age,Medal from athlete_events where Age =
(select min(Age) from athlete_events where  Medal ='Gold' ) and Medal ='Gold';


/* Qn 2. Fetch the details of Oldest Athelets to win Gold medal*/
select Name,Age,Medal from athlete_events where Age =
(select max(Age) from athlete_events where  Medal ='Gold' )and Medal ='Gold';

/*Qn 3. List down total Gold,Silver,Bronze medals won by each country*/
select Team,
 sum(case when Medal = 'Gold' then 1 else 0 end)as Gold,
 sum(case when Medal = 'Silver' then 1 else 0 end)as Silver,
 sum(case  when Medal = 'Bronze' then 1 else 0 end)as Bronze
from athlete_events
group by Team ;

/*Qn 4. List down the Team's who have Gold ,silver,Bronze */
select Team ,sum(case when Medal in('Gold','Silver','Bronze') then 1 else 0 end)
from athlete_events group by Team limit 10;


/*Qn 5.Fetch Total Medal Received by India*/
select Team,
SUM(case when Medal = 'Gold' then 1 else 0 end) as Gold,
       SUM(case when Medal = 'Silver' then 1 else 0 end) as Silver,
       SUM(case when Medal = 'Bronze' then 1 else 0 end) as Bronze
       
from athlete_events
where Team = 'India';

/*Qn 6.Fetch the Detail of Gold medal win by india in 2008*/
select *
 from athlete_events where 
 Team = 'India' and Medal ='Gold' and year = 2008;
 
 /*Qn 7.Fetch the Detail Total Male and Female participated from each Country*/
 select Team, 
  COUNT(case when Sex ='M' then 1 end) as male,
  COUNT(case when Sex='F' then 1 end) as female ,
   COUNT(*)as total_Participated
  from athlete_events  group by Team;
 
 /*Qn 8.Fetch the Detail Total Male and Female participated from each Year*/ 
select max(Year),
  count(case when Sex ='M' then 1 end) as male,
  COUNT(case when Sex='F' then 1 end) as female 
  from athlete_events  group by Year;
  
/*Qn 9.Fetch top 5 countries in terms of the total number of medals*/
select Team, COUNT(Medal) as medal_won
from athlete_events
where Medal is not null
group by Team
order by medal_won desc
limit 5;

/*Qn 10.Fetch the top 5 sports in which female athletes have won the most medals.*/
select Sport,count(Medal) as Medal_count
from athlete_events
where Sex ='F' 
group by Sport
order by  Medal_count desc
limit 5;


