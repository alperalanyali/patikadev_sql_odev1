SELECT * 
FROM film 
WHERE title LIKE '%n'
ORDER BY LENGTH
LIMIT 5 -- 1.SORU

SELECT *
FROM film
WHERE title LIKE '%n'
ORDER BY LENGTH 
LIMIT 5
OFFSET 5 ;-- 2.SORU


SELECT last_name
FROM customer 
WHERE store_id = 1
ORDER BY last_name desc
OFFSET 4 --3.SORU