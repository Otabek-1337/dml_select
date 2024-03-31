SELECT s.store_id,
       CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
       SUM(p.amount) AS total_revenue
FROM staff s
INNER JOIN payment p ON s.staff_id = p.staff_id
INNER JOIN rental r ON p.rental_id = r.rental_id
WHERE YEAR(p.payment_date) = 2017
GROUP BY s.store_id, s.staff_id
HAVING total_revenue = (
    SELECT MAX(sub.total_revenue)
    FROM (
        SELECT s.store_id,
               s.staff_id,
               SUM(p.amount) AS total_revenue
        FROM staff s
        INNER JOIN payment p ON s.staff_id = p.staff_id
        INNER JOIN rental r ON p.rental_id = r.rental_id
        WHERE YEAR(p.payment_date) = 2017
        GROUP BY s.store_id, s.staff_id
    ) AS sub
    WHERE sub.store_id = s.store_id
)
ORDER BY s.store_id;
