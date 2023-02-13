SELECT AVG(rental_rate) FROM film; -- 1.Soru

SELECT COUNT(title) FROM film where title LIKE 'C%' -- 2.Soru

SELECT MAX(length) FROM film where rental_rate = 0.99 -- 3.Soru

SELECT 
	COUNT(DISTINCT replacement_cost) 
FROM film 
WHERE length> 150 -- 4.Soru