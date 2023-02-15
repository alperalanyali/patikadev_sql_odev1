
-- 1.Soru
(
select first_name FROM actor
)
UNION 
(
SELECT first_name FROM customer
); -- 1.Soru

 -- 2.Soru
(
	SELECT first_name FROM actor
)
INTERSECT
(
	SELECT first_name FROM customer
);
 -- 2.Soru
-- 3.Soru
(
	SELECT first_name FROM actor
)
EXCEPT 
(
	SELECT first_name FROM customer
); 

-- 3.Soru
(
--4.Soru
SELECT first_name FROM actor

)

UNION ALL

(

SELECT first_name FROM customer

);

(

SELECT first_name FROM actor

)

INTERSECT ALL

(

SELECT first_name FROM customer

);

(

SELECT first_name FROM actor

)

EXCEPT

(

SELECT first_name FROM customer

); 

--4.Soru