SELECT f.title AS movie_title,
       COUNT(*) AS rental_count,
       AVG(c.age) AS expected_age
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN customer c ON r.customer_id = c.customer_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;