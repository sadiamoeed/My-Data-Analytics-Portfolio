-- Data Cleaning Project 1

-- tips:
-- 0) create a copy of the raw data table
-- 1) Remove Duplicates
-- 2) Standarize
-- 3) Nulls or Blank values  ( either remove or populate decide carefully)
-- 4) Remove irrelevant columns

use world_layoffs;
select *
FROM layoffs;

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT * 
FROM layoffs;

SELECT *
FROM layoffs_staging;

WITH duplicate_cte AS 
(
select * ,
row_number() OVER (partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) row_num
FROM layoffs_staging)
DELETE 
FROM duplicate_cte
WHERE row_num>1;

select *
FROM layoffs_staging
WHERE company='Casper';

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT  INTO layoffs_staging2
select * ,
row_number() OVER (partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) row_num
FROM layoffs_staging;


SET SQL_SAFE_UPDATES = 0;
DELETE
FROM layoffs_staging2
WHERE row_num >1;

-- standardizing


SELECT * 
FROM layoffs_staging2;

SELECT company, TRIM(company)
FROM layoffs_staging2;

Update layoffs_staging2
SET company=TRIM(company);

SELECT DISTINCT(country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(trailing "." FROM country)
WHERE country like "United States%";


select `date`, str_to_date(`date`,'%m/%d/%Y')
FROM layoffs_staging2;

update layoffs_staging2
SET `date`= str_to_date(`date`,'%m/%d/%Y');




ALTER TABLE  layoffs_staging2
MODIFY column `date` DATE;

SELECT  * 
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company=t2.company
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2
SET industry= null
WHERE industry='';

SELECT * 
FROM layoffs_staging2
WHERE company LIKE "Bally%";



UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company=t2.company
SET t1.industry=t2.industry    
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;


SELECT * 
FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;










