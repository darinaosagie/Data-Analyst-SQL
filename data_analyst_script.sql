---How many rows are in the data_analyst_jobs table?---
SELECT COUNT(*)
FROM data_analyst_jobs;
---Answer is 1793---

---Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?---
SELECT company
FROM data_analyst_jobs 
LIMIT 10;
---ANSWER is ExxonMobil

---How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?---
SELECT COUNT(CASE WHEN location = 'TN' THEN 'TN' END), 
	   COUNT(CASE WHEN location = 'KY' THEN 'KY'END)
FROM data_analyst_jobs;
---ANSWER is TN=21,KY=6---

---How many postings in Tennessee have a star rating above 4?---
SELECT COUNT(DISTINCT(star_rating))
FROM data_analyst_jobs
WHERE star_rating > 4
	AND location = 'TN';
---ANSWER is 3---

---How many postings in the dataset have a review count between 500 and 1000?---
SELECT *
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;
---ANSWER 151---

---Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY state
ORDER BY avg_rating DESC NULLS LAST;

---Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;
---ANSWER 881---

---How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';
---ANSWER is 230---

---Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs AS dj
WHERE review_count >5000;
GROUP BY dj.company

---Add the code to order the query in #9 from highest to lowest average star rating.
---Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs AS dj
WHERE review_count >5000
GROUP BY dj.company
ORDER BY avg_rating DESC NULLS LAST;
---ANSWER is GENERAL MOTORS 4.199999809000000

---Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title ILIKE '%ANALYST%';
---ANSWER is 774---

---How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT DISTINCT (title),location
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%' AND title NOT ILIKE '%analytics%'
---ANSWER is Tableau---

---BONUS---
SELECT COUNT(title)AS hard_to_fill_jobs, domain
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%' AND days_since_posting > 21 AND domain IS NOT NULL
GROUP BY domain 
ORDER BY hard_to_fill_jobs DESC;