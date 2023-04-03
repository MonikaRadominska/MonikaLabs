USE sakila;

#Explore tables by selecting all columns from each table or using the in built review features for your client.

SELECT * FROM actor; #actors
SELECT * FROM category; #film categories 
SELECT * FROM city; #cities and country ids
SELECT city FROM city; #closer look at just cities
SELECT * FROM customer; #customer names and their emails 
SELECT * FROM film; #films and descriptions, og languages missing, release year same for all
SELECT * FROM film_text; #film titles and their descriptions
SELECT * FROM inventory; #film ids and store ids
SELECT * FROM language; #all langauges used and their ids
SELECT * FROM payment; #payment amount and date
SELECT * FROM staff; #two staff members
SELECT * FROM store; #two store ids

#Select one column from a table. Get film titles.

SELECT title FROM film; 

#Select one column from a table and alias it.

SELECT first_name AS act_names FROM actor;

#Get unique list of film languages under the alias language. 
#Note that we are not asking you to obtain the language per each film, 
#but this is a good time to think about how you might get that information in the future.

SELECT name AS language FROM language;

#5.1 Find out how many stores does the company have?

SELECT * FROM address;
SELECT * FROM store; #two store ids

SELECT address_id, address FROM address
LIMIT 2; #two stores 

#5.2 Find out how many employees staff does the company have?
SELECT * FROM staff; #two staff members
SELECT count(staff_id) from staff; 

SELECT first_name, last_name FROM staff; #to print staff members

#5.3 Return a list of employee first names only?
SELECT first_name AS staff_names FROM staff;