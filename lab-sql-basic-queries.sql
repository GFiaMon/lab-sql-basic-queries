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
SELECT COUNT(store_id) FROM store;


-- 	- 5.2 Determine the number of employees that the company has.  WRONG??
SELECT count(DISTINCT staff_id) from staff;


-- - 5.3 Determine how many films are available for rent and how many have been rented.
select count(film_id) from film;
select count(distinct(film_id)) from inventory; -- There are 42 Films for rent

-- - 5.4 Determine the number of distinct last names of the actors in the database.
select distinct last_name from actor;

-- 6 Retrieve the 10 longest films.
select title, length from film ORDER BY length desc limit 10;

-- 7  Use filtering techniques in order to:
-- 	- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT * from actor
where first_name = 'Scarlett';

-- 	- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes. 
-- 		- Hint: use LIKE operator. More information here.
select * from film
where title like '%ARMAGEDDON%' and length > 100;

-- 	- 7.3 Determine the number of films that include Behind the Scenes content
select * from film
where special_features like '%Behind the Scenes%';
 