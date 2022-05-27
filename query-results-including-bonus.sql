--1
SELECT COUNT(*)
FROM data_analyst_jobs;
--1793

--2
SELECT *
FROM data_analyst_jobs
LIMIT 10;
-- ExxonMobil

--3
SELECT location,COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN'
OR location = 'KY'
GROUP BY location;
-- TN 21
-- KY 6

SELECT COUNT(star_rating)
FROM data_analyst_jobs
WHERE star_rating > 4
AND location = 'TN';
-- 3

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
-- 151

SELECT location AS state, ROUND(AVG(star_rating)) AS avg_rating
FROM data_analyst_jobs
GROUP BY state
ORDER BY AVG(star_rating) DESC NULLS LAST;
-- NE

SELECT COUNT(Distinct title)
FROM data_analyst_jobs;
-- 881

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';
-- 230

SELECT DISTINCT(company), ROUND(AVG(star_rating), 2) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL
GROUP BY company
ORDER BY ROUND(AVG(star_rating),2) DESC;
-- 40
-- American Express, 4.2

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';
-- 774

SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
	AND title NOT ILIKE '%Analytics%';
-- Commonality amongs results (4 results) they are visualization specialists using Tableau


/*Bonus Question*/
SELECT COUNT(title) AS num_jobs, domain AS industry
FROM data_analyst_jobs
WHERE skill ILIKE '%sql%'
	AND days_since_posting > '21'
	AND domain IS NOT NULL
GROUP BY domain
ORDER BY num_jobs DESC;
-- 1. Internet & Soft. (62)Banks & Finance (61) 2.  3. Consulting (57) 4. Health Care (52)