USE sakila;

#1.List all films whose length is longer than the average of all the films.
SELECT * FROM film;

SELECT title FROM film
WHERE length > (SELECT AVG(length) 
				FROM film);
                
#2. How many copies of the film Hunchback Impossible exist in the inventory system?

#Inventory, Film
SELECT * FROM inventory; # inventory_id, film_id
SELECT * FROM film; #title, film_id

SELECT count(film_id) AS total FROM inventory
WHERE film_id IN (SELECT film_id
				FROM film
                WHERE title IN ("Hunchback Impossible"));
                
#3.Use subqueries to display all actors who appear in the film Alone Trip.

SELECT * FROM actor; #actor_id, first_name, last_name
SELECT * FROM film; #film_id, title
SELECT * FROM film_actor; #film_id, actor_id

SELECT first_name, last_name FROM actor
WHERE actor_id IN (SELECT actor_id FROM film_actor
					WHERE film_id IN (SELECT film_id FROM film
					WHERE title = "Alone Trip"));
                    
#4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

SELECT * FROM category; #category_id, name
SELECT * FROM film; #title, film_id 
SELECT * FROM film_category; #film_id, category_id

SELECT title FROM film
WHERE film_id IN (SELECT film_id FROM film_category
					WHERE category_id IN (SELECT category_id
					FROM category 
                    WHERE name = "Family"));
                    
                    
#5.Get name and email from customers from Canada using subqueries. 

SELECT * FROM customer; #first_name, last_name, email, address_id, customer_id
SELECT * FROM country; # country, country_id
SELECT * FROM address; #address_id, address, #city_id
SELECT * FROM city; #city_id #country_id

SELECT first_name, last_name, email FROM customer
WHERE address_id IN (SELECT address_id FROM address WHERE city_id IN 
(SELECT city_id FROM city WHERE country_id IN (SELECT country_id FROM country 
WHERE country = ("Canada"))));

#Do the same with joins. Note that to create a join, 
#you will have to identify the correct tables with their primary keys and foreign keys, 
#that will help you get the relevant information.


SELECT first_name, last_name, email FROM customer
INNER JOIN address
USING (address_id) 
JOIN city USING (city_id) 
JOIN country USING (country_id) 
WHERE country = ("Canada");