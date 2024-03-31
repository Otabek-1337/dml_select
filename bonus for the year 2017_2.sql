WITH RevenueByStaff AS (
    SELECT s.store_id,
           CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
           SUM(p.amount) AS total_revenue,
           ROW_NUMBER() OVER(PARTITION BY s.store_id ORDER BY SUM(p.amount) DESC) AS rank
    FROM staff s
    INNER JOIN payment p ON s.staff_id = p.staff_id
    INNER JOIN rental r ON p.rental_id = r.rental_id
    WHERE YEAR(p.payment_date) = 2017
    GROUP BY s.store_id, s.staff_id
)
SELECT store_id,
       staff_name,
       total_revenue
FROM RevenueByStaff
WHERE rank = 1
ORDER BY store_id;
WITH RevenueByStaff AS (
    SELECT s.store_id,
           CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
           SUM(p.amount) AS total_revenue,
           ROW_NUMBER() OVER(PARTITION BY s.store_id ORDER BY SUM(p.amount) DESC) AS rank
    FROM staff s
    INNER JOIN payment p ON s.staff_id = p.staff_id
    INNER JOIN rental r ON p.rental_id = r.rental_id
    WHERE YEAR(p.payment_date) = 2017
    GROUP BY s.store_id, s.staff_id
)
SELECT store_id,
       staff_name,
       total_revenue
FROM RevenueByStaff
WHERE rank = 1
ORDER BY store_id;
