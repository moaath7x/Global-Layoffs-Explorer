use `world_layoffs`;

select max(total_laid_off), max(percentage_laid_off)
from clean_data;

select * 
from layoffs_staging2
where percentage_laid_off = 1
-- order by total_laid_off desc;
order by funds_raised_millions desc;

select company, sum(total_laid_off)
from clean_data
group by company
order by 2 desc;

select min(`date`), max(`date`)
from clean_data;

select industry, sum(total_laid_off)
from clean_data
group by industry
order by 2 desc;

select country, sum(total_laid_off)
from clean_data
group by country
order by 2 desc;

select year(`date`), sum(total_laid_off)
from clean_data
group by year(`date`)
order by 1 desc;

select stage, sum(total_laid_off)
from clean_data
group by stage
order by 2 desc;

select * 
from clean_data;

select substring(`date`,1, 7) as month_off, sum(total_laid_off)
from clean_data
where substring(`date`,1, 7) is not null
group by month_off
order by 1 asc;

with Rolling_Total as 
(
select substring(`date`,1, 7) as month_off, sum(total_laid_off) as total_off
from clean_data
where substring(`date`,1, 7) is not null
group by month_off
order by 1 asc
)
select month_off, total_off ,
sum(total_off) over(order by month_off) as rolling_total
from Rolling_Total;

select company, year(`date`), sum(total_laid_off)
from clean_data
group by company, year(`date`)
order by 3 desc;

select company, year(`date`), sum(total_laid_off)
from clean_data
group by company, year(`date`);

with company_year (company, years, total_laid_off) as
(
select company, year(`date`), sum(total_laid_off)
from clean_data
group by company, year(`date`)
), Company_Year_Rank as 
(
select *, dense_rank() over (partition by years order by total_laid_off desc) as Ranking
from company_year
where years is not null
)
select * from Company_Year_Rank
where ranking <= 5
;
