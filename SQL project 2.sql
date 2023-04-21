select * from [SQL Project 2]..Sheet1$;

--Total Episodes
select max(EpNo) from [SQL Project 2]..Sheet1$;
select count(distinct epno) from [SQL Project 2]..Sheet1$;

-- Pitches
select COUNT(distinct brand) from [SQL Project 2]..Sheet1$;

--Pitches who got Investment
select cast(sum(a.converted_not_converted) as float) / cast(count(*) as float) from (
select Sheet1$.[Amount Invested lakhs] , case when Sheet1$.[Amount Invested lakhs] > 0 then 1 else 0 end as converted_not_converted 
from [SQL Project 2]..Sheet1$) as a

--Total male
select sum(male) from [SQL Project 2]..Sheet1$;

--Total female
select sum(female) from [SQL Project 2]..Sheet1$;

--Gender ratio
select sum(female)/sum(male) from [SQL Project 2]..Sheet1$;

--Total Invested Amount
select sum(Sheet1$.[Amount Invested lakhs]) from [SQL Project 2]..Sheet1$;

--average equity taken
select avg(a.[Equity Taken %]) from
(select * from [SQL Project 2]..Sheet1$ where [Equity Taken %] > 0) as a

--highest deal taken
select max(Sheet1$.[Amount Invested lakhs]) from [SQL Project 2]..Sheet1$;

--highest equity taken
select max([Equity Taken %]) from [SQL Project 2]..Sheet1$;

--Startups having at least women
select sum(a.female_count) as startups_having_at_least_women from (
select female, case when female > 0 then 1 else 0 end as female_count from [SQL Project 2]..Sheet1$) as a

--Pitches converted having atleast one women
select * from [SQL Project 2]..Sheet1$

select sum(b.female_count) from (
select case when a.female > 0 then 1 else 0 end as female_count, a.* from (
select * from [SQL Project 2]..Sheet1$ where Deal! = ('No Deal')) as a) as b;

--average team members
select avg([Team members]) from [SQL Project 2]..Sheet1$;

--average amount invested per deal
select avg(a.[Amount Invested lakhs]) as amount_invested_per_deal from
(select * from [SQL Project 2]..Sheet1$ where Deal != ('No Deal')) as a;

--aveage age group of contastents
select * from [SQL Project 2]..Sheet1$;

select [Avg age], count([Avg age]) as contestants from [SQL Project 2]..Sheet1$ group by [Avg age] order by contestants desc;

--location group of contestants
select location, count(location) as contestants from [SQL Project 2]..Sheet1$ group by location order by contestants desc;

--sector group of contestants
select sector, count(sector) as contestants from [SQL Project 2]..Sheet1$ group by sector order by contestants desc;

--partner deal
select partners, count(partners) as contestants from [SQL Project 2]..Sheet1$ where Partners != '-' group by Partners order by contestants desc;

--making the matrix

select * from [SQL Project 2]..Sheet1$;

select 'Ashnner' as keyy, count([Ashneer Amount Invested]) from [SQL Project 2]..Sheet1$ where [Ashneer Amount Invested] is not null

select 'Ashnner' as keyy, count([Ashneer Amount Invested]) 
from [SQL Project 2]..Sheet1$ where [Ashneer Amount Invested] is not null and [Ashneer Amount Invested] != 0

select 'Ashnner' as keyy, sum(c.[Ashneer Amount Invested]), avg(c.[Ashneer Equity Taken %]) 
from (select * from [SQL Project 2]..Sheet1$ where [Ashneer Equity Taken %] != 0 and [Ashneer Equity Taken %] is not null) as c

--Join

select m.keyy, m.total_deals_present, m.total_deals, n.total_amount_invested, n.avg_equity_taken from 
(select a.keyy, a.total_deals_present, b.total_deals from (
select 'Ashnner' as keyy, count([Ashneer Amount Invested]) as total_deals_present from [SQL Project 2]..Sheet1$ where [Ashneer Amount Invested] is not null) 
as a

inner join (

select 'Ashnner' as keyy, count([Ashneer Amount Invested]) as total_deals 
from [SQL Project 2]..Sheet1$ where [Ashneer Amount Invested] is not null and [Ashneer Amount Invested] != 0) as b

on a.keyy = b.keyy) as m

inner join (

select 'Ashnner' as keyy, sum(c.[Ashneer Amount Invested]) as total_amount_invested, avg(c.[Ashneer Equity Taken %]) as avg_equity_taken 
from (select * from [SQL Project 2]..Sheet1$ where [Ashneer Equity Taken %] != 0 and [Ashneer Equity Taken %] is not null) as c) as n

on m.keyy = n.keyy


-- which is the startup in which the highest amount has been invested in each domain/sector

select c. * from (
select Brand, Sector, [Amount Invested lakhs], rank() over(partition by sector order by [Amount Invested lakhs] desc) as rnk 
from [SQL Project 2]..Sheet1$) as c
where c.rnk = 1;


--THE END--






