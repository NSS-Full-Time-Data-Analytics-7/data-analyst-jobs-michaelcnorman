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
WHERE star_rating > 4;
-- 416

SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
-- 151

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY state;
-- KS

SELECT COUNT(Distinct(title))
FROM data_analyst_jobs;
-- 881

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';
-- 230

SELECT DISTINCT(company), AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY AVG(star_rating) DESC;
-- 41
-- American Express, 4.199999809

SELECT title
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';
-- 1669

SELECT COUNT(title), title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
	AND title NOT ILIKE '%Analytics%'
GROUP BY title;
-- Commonality amongs results (4 results) they are visualization specialists using Tableau

SELECT *
FROM data_analyst_jobs
WHERE days_since_posting > '21'
	AND domain IS NOT NULL
	AND skill ILIKE '%sql%'
ORDER BY days_since_posting;

SELECT days_since_posting, COUNT(domain), domain
FROM data_analyst_jobs
WHERE domain IS NOT NULL
	AND days_since_posting > '21'
	AND skill ILIKE '%sql%'
GROUP BY domain, days_since_posting
ORDER BY COUNT(domain) DESC;
-- 1. Banks & Finance (51) 2. Internet & Soft. (49) 3. Consulting (44) 4. Health Care (44)