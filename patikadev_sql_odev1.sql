SELECT TITLE, DESCRIPTION FROM FILM; 

SELECT * FROM FILM WHERE LENGTH>60 AND LENGTH <75;


SELECT * FROM FILM WHERE RENTAL_RATE = 0.99 
AND(REPLACEMENT_COST = 12.99 OR REPLACEMENT_COST = 28.99);

SELECT LAST_NAME FROM CUSTOMER WHERE FIRST_NAME = 'Mary';


SELECT * FROM film WHERE length<50 AND (rental_rate != 2.99 OR rental_rate != 4.99);