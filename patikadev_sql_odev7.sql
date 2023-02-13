SELECT rating 
FROM film
GROUP BY rating; -- 1.Soru


SELECT  
	replacement_cost,
	COUNT(replacement_cost)
FROM film
GROUP BY replacement_cost
HAVING COUNT(replacement_cost) > 50; -- 2. Soru

SELECT 
		country_id, 
		COUNT(country_id) 
FROM city
GROUP BY country_id
ORDER BY COUNT(country_id) DESC -- 3. Soru

LIMIT 1;