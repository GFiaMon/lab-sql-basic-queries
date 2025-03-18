-- LAB SQL 1 Sakila
-- 1. Display all available tables in the Sakila database.
USE sakila;
show tables;

-- 2. Retrieve all the data from the tables actor, film and customer.
SELECT * from actor;
SELECT * from film; 
SELECT * from customer;

/*
3. Retrieve the following columns from their respective tables:
	- 3.1 Titles of all films from the film table
	- 3.2 List of languages used in films, with the column aliased as language from the language table
	- 3.3 List of first names of all employees from the staff table  
*/
SELECT title from film;
SELECT distinct name as language from language;
SELECT first_name from staff;

-- 4. Retrieve unique release years.
SELECT distinct release_year from film;

-- 	- 5.1 Determine the number of stores that the company has.
SELECT COUNT(DISTINCT store_id) FROM store;


-- 	- 5.2 Determine the number of employees that the company has.  WRONG??
SELECT count(DISTINCT staff_id) from staff;


-- - 5.3 Determine how many films are available for rent and how many have been rented.
					-- To count films available for rent, assume each entry in the inventory table represents a rentable film
SELECT COUNT(*) as available_films FROM inventory;
					-- To count how many films have been rented, consider the rentals table
SELECT COUNT(DISTINCT inventory_id) as rented_films FROM rental;
                    
-- - 5.4 Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) as distinct_actor_last_names FROM actor;

-- 6 Retrieve the 10 longest films.
select title, length from film ORDER BY length desc limit 10;

-- 7  Use filtering techniques in order to:
-- 	- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT * from actor
where first_name = 'Scarlett';

-- 	- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes. 
-- 		- Hint: use LIKE operator. More information here.

SELECT title, length FROM film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

-- 	- 7.3 Determine the number of films that include Behind the Scenes content
SELECT 
    COUNT(*)
    AS films_with_bts
FROM
    film
WHERE
    special_features LIKE '%Behind the Scenes%';
 