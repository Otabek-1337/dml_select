WITH ActorActivity AS (
    SELECT a.actor_id,
           CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
           DATEDIFF(NOW(), MAX(r.rental_date)) AS days_since_last_role,
           ROW_NUMBER() OVER(ORDER BY DATEDIFF(NOW(), MAX(r.rental_date)) DESC) AS rank
    FROM actor a
    LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
    LEFT JOIN film f ON fa.film_id = f.film_id
    LEFT JOIN inventory i ON f.film_id = i.film_id
    LEFT JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY a.actor_id
)
SELECT actor_id, actor_name, days_since_last_role
FROM ActorActivity
WHERE rank <= 5;