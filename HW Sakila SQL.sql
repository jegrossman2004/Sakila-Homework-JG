USE sakila;

#QUESTION 1:
SELECT 
    a.first_name, a.last_name
FROM
    actor a
        JOIN
    film_actor fa ON a.actor_id = fa.actor_id
        JOIN
    film f ON fa.film_id = f.film_id
WHERE
    f.title LIKE 'ACADEMY DINOSAUR';



#QUESTION 2:
SELECT 
    c.name, COUNT(f.film_id) AS film_count
FROM
    category c
        JOIN
    film_category fc ON c.category_id = fc.category_id
        JOIN
    film f ON fc.film_id = f.film_id
GROUP BY c.category_id;






#QUESTION 3:

SELECT 
    f.rating, AVG(f.rental_duration) AS avg_duration
FROM
    film f
GROUP BY f.rating;




#QUESTION 4:

SELECT 
    c.first_name, c.last_name, COUNT(r.rental_id) AS rentals
FROM
    customer c
        JOIN
    rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;





#QUESTION 5:
SELECT 
    s.store_id, COUNT(r.rental_id) AS rentals
FROM
    store s
        JOIN
    staff st ON s.store_id = st.store_id
        JOIN
    rental r ON st.staff_id = r.staff_id
GROUP BY s.store_id
ORDER BY rentals DESC
LIMIT 1;



#QUESTION 6:

SELECT 
    c.name, COUNT(r.rental_id) AS rentals
FROM
    category c
        JOIN
    film_category fc ON c.category_id = fc.category_id
        JOIN
    film f ON fc.film_id = f.film_id
        JOIN
    inventory i ON f.film_id = i.film_id
        JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY c.category_id
ORDER BY rentals DESC
LIMIT 1;


#QUESTION 7:

SELECT 
    c.name, AVG(f.rental_rate) AS avg_rental_rate
FROM
    category c
        JOIN
    film_category fc ON c.category_id = fc.category_id
        JOIN
    film f ON fc.film_id = f.film_id
GROUP BY c.category_id;

#QUESTION 8:
SELECT 
    f.title, MAX(r.rental_date) AS last_rental_date
FROM
    rental r
        JOIN
    inventory i ON i.inventory_id = r.inventory_id
        JOIN
    film f ON i.film_id = f.film_id
GROUP BY f.film_id
HAVING last_rental_date < '2024-01-08'
ORDER BY last_rental_date DESC;


#QUESTION 9:
SELECT 
    c.first_name, c.last_name, SUM(p.amount) AS total_spending
FROM
    customer c
        JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

#QUESTION 10:
SELECT 
    l.name, AVG(f.length) AS avg_length
FROM
    film f
        JOIN
    language l ON f.language_id = l.language_id
GROUP BY l.language_id;