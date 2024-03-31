SELECT a.actor_id,
       CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
       DATEDIFF(NOW(), MAX(r.rental_date)) AS days_since_last_role
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY a.actor_id
ORDER BY days_since_last_role DESC;
