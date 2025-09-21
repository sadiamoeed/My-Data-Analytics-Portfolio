-- exploratory data anaysis


SELECT *
FROM layoffs_staging2;


SELECT industry,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT country,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

SELECT YEAR(`date`),SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;


SELECT SUBSTRING(`date`,1,7) AS Month, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY  `Month`
ORDER BY  1 ASC;


WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`,1,7) AS Month, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY  `Month`
ORDER BY  1 ASC)

SELECT `Month`,total_off,
SUM(total_off) OVER (ORDER BY  `Month`) AS rolling_total
FROM Rolling_Total;

SELECT company,SUM(total_laid_off)
FROM layoffs_staging2
group by company
order by 2 DESC;

SELECT company,YEAR(`date`),
SUM(total_laid_off)
FROM layoffs_staging2
group by company,YEAR(`date`)
ORDER BY 3 DESC;


With company_year(company,years,total_laid_off) As
(SELECT company,YEAR(`date`) AS year,
SUM(total_laid_off)
FROM layoffs_staging2
group by company,YEAR(`date`)
),
Company_Year_Rank AS
(

SELECT *, 
dense_rank() OVER (partition by years order by total_laid_off DESC) AS ranking
FROM company_year 
WHERE years IS NOT NULL
ORDER BY  ranking ASC)

select * 
FROM  Company_Year_Rank
WHERE Ranking<=5
; 