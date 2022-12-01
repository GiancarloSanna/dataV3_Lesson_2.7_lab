Use sakila;

-- 1. How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.

SELECT count(f.title) AS number_of_films, c.name AS category_name
FROM film f
LEFT JOIN film_category
USING(film_id)
LEFT JOIN category c
USING(category_id)
GROUP BY category_name
ORDER BY number_of_films DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.

SELECT s.staff_ID, CONCAT( s.first_name, ' ',s.last_name) AS employee,
SUM(p.amount) AS sum
FROM staff s
JOIN payment p
USING(staff_id)
GROUP BY s.staff_ID;

-- 3. Which actor has appeared in the most films?

SELECT a.actor_id AS actor_id, CONCAT(a.first_name, " ", a.last_name) AS actor,
COUNT(fa.film_id) AS number_of_films
FROM actor a
JOIN film_actor fa
USING(actor_id)
GROUP BY actor
ORDER BY number_of_films DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT CONCAT(c.first_name, " ", c.last_name) AS customer,
COUNT(r.rental_id) AS films_rented
FROM customer c
JOIN rental r
USING(customer_id)
GROUP BY customer_id
ORDER BY films_rented DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT first_name, last_name, address
FROM staff
JOIN address
USING(address_id);

-- 6. List each film and the number of actors who are listed for that film.

SELECT f.film_id, title, COUNT(fa.actor_id) AS number_of_actors
FROM film f
JOIN film_actor fa
USING(film_id)
GROUP BY film_id
ORDER BY number_of_actors DESC;

-- 7. Using the tables payment and customer and the JOIN command,
-- list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.customer_id AS customr_id, 
c.first_name AS first_name,
c.last_name AS last_name,
SUM(amount) AS total_amount
FROM customer c
JOIN  payment p
USING(customer_id)
GROUP BY customer_id
ORDER BY c.last_name ASC;

-- 8. List number of films per category.

SELECT name, COUNT(fc.film_id) AS number_of_films
FROM category
JOIN film_category fc
USING(category_id)
GROUP BY category_id
ORDER BY number_of_films DESC;