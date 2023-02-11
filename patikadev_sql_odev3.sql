SELECT * FROM Country WHERE country like 'A%a'; -- 1.Soru

SELECT * FROM country WHERE country LIKE '______' AND country LIKE '%n'; -- 2.soru

SELECT title FROM film WHERE title ILIKE '%t%t%t%t%'; -- 3.soru


SELECT * FROM film WHERE title LIKE 'C%' AND length > 90 AND rental_rate = 2.99  -- 4.soru