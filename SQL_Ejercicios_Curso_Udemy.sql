-- Ejercicios curso SQL Udemy con mas de 50 ejercicios

SELECT * FROM sakila.actor;


SELECT actor_id as identificacion FROM sakila.actor;

-- DISTINCT se utiliza para traer los datos unicos de un campo 
SELECT distinct staff_id FROM sakila.PAYMENT;

-- Order BY nos ordena los datos de una manera acendente o desendente, de forma numerica 1,2,3... y alfabetica 
-- a,b,c,d...

SELECT * FROM sakila.country ORDER BY country DESC; 

SELECT * FROM sakila.country ORDER BY country ASC; 

-- Consulta store_id, first_name y last_name de la tabla customer de la base de datos sakila.

SELECT store_id, first_name , last_name
FROM sakila.customer;

-- Cambia el nombre de las columnas store_id, first_name y last_name a Tienda, Nombre y Apellido respectivamente.

SELECT store_id AS Tienda, first_name AS Nombre, last_name AS Apellido
FROM sakila.customer;


-- Ordena de manera descendente la columna Apellido
SELECT *
FROM sakila.customer
ORDER BY last_name DESC;

-- Consulta la tabla payment de la base de datos sakila.
SELECT *
FROM sakila.payment;

-- ¿Cuál es la cantidad mas baja y mas alta de la columna amount?
SELECT MAX(amount) AS Cantidad_mas_alta, MIN(amount) AS Cantidad_mas_baja
FROM sakila.payment;

select distinct amount from sakila.payment order by amount asc;

-- where se utiliza para sacar información con una condicion 
-- Consulta description, release_year de la tabla film de la base de datos sakila.
.-- Filtra la información donde title sea IMPACT ALADDIN
SELECT description,release_year 
FROM sakila.film
WHERE title = 'IMPACT ALADDIN';

-- Consulta la tabla payment de la base de datos sakila.
-- Filtra la información donde amount sea mayor a 0.99.

SELECT *
FROM sakila.payment
WHERE amount > 0.99;

-- Operadores AND, OR, NOT...Estos operadores son usados para agregar mas de una condicíon con el AND se deben cumplir 
-- las condiciones que se asignen para que traiga informacion la tabla, de lo contrario no traera y con el OR se
--  debe cumplir al menos una condicion para que traiga informacion la tabla

-- Consulta la tabla payment de la base de datos sakila.

-- Filtra la información donde customer_id sea igual a 36, amount sea mayor a 0.99 y staff_id sea igual a 1.

SELECT *
FROM sakila.payment
WHERE customer_id = 36 AND amount > 0.99 AND staff_id = 1;

-- Consulta la tabla rental de la base de datos sakila.

-- Filtra la información donde staff_id no sea 1, customer_id sea mayor a 250 y inventory_id sea menor de 100.

SELECT * 
FROM sakila.rental
WHERE staff_id NOT 1 AND customer_id > 250 AND inventory_id < 100;

-- OPERADOR IN El operador IN de SQL filtra un conjunto de resultados en función de una lista de valores. La lista 
-- de valores puede ser simplemente listada o es proporcionada por una declaración SELECT separada 
-- (esto se llama una subconsulta). El operador IN siempre se utiliza dentro de la cláusula WHERE.

-- Consulta la tabla film_text de la base de datos sakila.

-- Filtra la información donde title  sea ZORRO ARK, VIRGIN DAISY, UNITED PILOT

SELECT *
FROM sakila.film_text
WHERE title IN ('ZORRO ARK', 'VIRGIN DAISY', 'UNITED PILOT');

-- Consulta la tabla city de la base de datos sakila.

-- Filtra la información donde city sea Chiayi, Dongying, Fukuyama y Kilis.

SELECT * 
FROM sakila.city
WHERE city IN ('Chiayi', 'Dongying', 'Fukuyama' , 'Kilis');

-- Operqador Between registros para buscar en un rango 
-- Consulta la tabla payment de la base de datos sakila.
-- Filtra la información donde amount esté entre 2.99 y 4.99,  staff_id sea igual a 2 y customer_id sea 1 y 2.

SELECT * 
FROM sakila.payment
WHERE amount BETWEEN 2.99 AND 4.99 AND staff_id = 2 AND customer_id IN (1,2);

-- Consulta la tabla film de la base de datos sakila.

-- Filtra la información donde rental_rate esté entre 0.99 y 2.99, length sea menor igual de 50  y replacement_cost 
-- sea menor de 20.

SELECT *
FROM sakila.film
WHERE rental_rate BETWEEN 0.99 AND 2.99 AND length <= 50 AND replacement_cost < 20

-- Consulta la tabla film de la base de datos sakila.

-- Filtra la información donde release_year sea igual a 2006  y title empiece con ALI.

SELECT *
FROM sakila.film 
WHERE release_year = 2006 AND title LIKE 'ALI%'

-- Consulta la tabla address de la base de datos sakila.

-- Realiza un INNER JOIN con las tablas city y country

-- Mostrar las columnas address, city, country

SELECT a.address AS direccion, c.city AS Ciudad, y.country AS Pais
FROM sakila.address a
INNER JOIN sakila.city c
ON a.city_id = c.city_id
INNER JOIN sakila.country y
ON c.country_id = y.country_id

-- Consulta la tabla customer de la base de datos sakila.

-- Realiza un LEFT JOIN con las tablas store y address

-- Mostrar las columnas first_name, address, store_id

SELECT c.first_name AS NOMBRE, a.address AS DIRECCION, s.store_id ID_TIENDA
FROM sakila.customer c
LEFT JOIN sakila.store s
ON c.store_id = s.store_id
LEFT JOIN sakila.address a
ON c.address_id = a.address_id

-- Consulta la tabla rental de la base de datos sakila.

-- Realiza un COUNT de  la columna rental_id

SELECT COUNT(rental_id) 
FROM sakila.rental;

-- Consulta la tabla payment de la base de datos sakila.

-- Realiza un MAX de  la columna amount

SELECT MAX(amount)
FROM sakila.payment;

-- Consulta la tabla rental de la base de datos sakila.

-- Realiza un MAX de  la columna rental_date 


SELECT MAX(rental_date)
FROM sakila.rental
GROUP BY customer_id;
