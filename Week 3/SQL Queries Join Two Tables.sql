USE sakila;

SELECT * FROM film_actor; #actor and film id
SELECT * FROM actor; #actor_id
SELECT * FROM film; #film_id

#1.Which actor has appeared in the most films?

SELECT actor.first_name,actor.last_name, count(film_id) AS film_freq FROM actor
INNER JOIN film_actor AS film_ac
USING (actor_id)
GROUP BY film_ac.actor_id
ORDER BY film_freq desc
LIMIT 1;

#2.Most active customer aka the customer that has rented the most number of films

SELECT * FROM customer; #customer names, customer id, store id
SELECT * FROM rental; #rental id, customer id 

SELECT cus.first_name, cus.last_name, count(customer_id) AS rental_count FROM customer as cus
INNER JOIN rental AS ren
USING (customer_id)
GROUP BY ren.customer_id
ORDER BY rental_count desc
LIMIT 1;

#3.List number of films per category.
SELECT * FROM film; #film title, film id, 
SELECT * FROM film_category; #film id categ id 
SELECT * FROM category; #film categ, category_id

SELECT categ.name AS categ_name, count(category_id) AS film_freq FROM category AS categ
INNER JOIN film_category AS film_categ
USING (category_id)
GROUP BY category_id;

#4.Display the first and last names, as well as the address, of each staff member.

SELECT * FROM address; #address id, address
SELECT * FROM staff; # address id, first_name, last_name

SELECT s.first_name, s.last_name, a.address FROM staff AS s
INNER JOIN address as a
USING (address_id)
LIMIT 2;

#5.get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
SELECT * FROM film; #film title (title), language_id
SELECT * FROM language; #name (aka language) and language_id

SELECT f.title AS chosen_films, a.name FROM film AS f 
INNER JOIN language AS a
USING (language_id)
WHERE f.title LIKE "M%" AND language_id = 1
ORDER BY f.title desc;

#6.Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM payment; #amount, payment_date, staff_id, payment_id
SELECT * FROM staff; #staff_id, first and last name

SELECT s.first_name, s.last_name, sum(amount) AS total_amount FROM staff AS s
INNER JOIN payment AS p
USING (staff_id) 
WHERE p.payment_date BETWEEN "2005-08-01" AND "2005-08-30"
GROUP BY p.staff_id; 

#7.List each film and the number of actors who are listed for that film.

SELECT * FROM actor; #actor_id
SELECT * FROM film; #title, film_id
SELECT * FROM film_actor; #actor_id, film_id

SELECT f.title, count(actor_id) AS nr_films FROM film as f
INNER JOIN film_actor AS a
ON f.film_id = a.actor_id
GROUP BY f.film_id;

#8.Using the tables payment and customer and the JOIN command, list the total paid by each customer.
#List the customers alphabetically by last name.

SELECT * FROM payment; #customer id, amount
SELECT * FROM customer;

SELECT c.last_name, c.first_name, sum(amount) AS total FROM customer AS c
INNER JOIN payment AS p
USING (customer_id)
GROUP BY c.customer_id
ORDER BY c.last_name ASC;

#9.Write sql statement to check if you can find any actor who never particiapted in any film.

SELECT * FROM actor; #actor_id
SELECT * FROM film_actor; #actor_id

SELECT a.actor_id FROM actor AS a
INNER JOIN film_actor AS f
USING (actor_id)
WHERE actor_id IS NULL;

#10.get the addresses that have NO customers, and ends with the letter "e"
SELECT * FROM address; #address_id
SELECT * FROM customer; #customer_id address_id

SELECT address.address FROM address
LEFT JOIN customer
ON address.address_id = customer.address_id
WHERE address2 IS NULL AND address LIKE "%e";
