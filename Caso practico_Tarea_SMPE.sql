--CASO PRÁCTICO SAMANTHA MICHELLE PINEDA ESPARZA--

SELECT *
FROM menu_items;

--b. Explorar la tabla “menu_items” para conocer los productos del menú--

--b.1. Encontrar el número de artículos en el menú: 32 artículos--
SELECT COUNT(menu_item_id)
FROM menu_items;

--b.2.1 ¿Cuál es el artículo menos caro? MIN= Edamame --
SELECT *
FROM menu_items
ORDER BY price ASC
LIMIT 1;

--b.2.2 ¿Cuál es el artículo más caro en el menú? MAX = Shrimp Scampi --
SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 1;

--b.3. ¿Cuántos platos americanos hay en el menú? = 6 --
SELECT COUNT (category)
FROM menu_items
WHERE category ='American'

--b.4. ¿Cuál es el precio promedio de los platos? = 13.2859--
SELECT AVG (price)
FROM menu_items;

--c.Explorar la tabla “order_details” para conocer los datos que han sido recolectados--

SELECT *
FROM order_details;

--c.1  ¿Cuántos pedidos únicos se realizaron en total? = 32--
SELECT COUNT (DISTINCT (item_id))
FROM order_details;

--c.2. ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos? = 440 / 2675 / 3473 / 4305 / 443--
SELECT order_id, COUNT (order_id)
FROM order_details
GROUP BY order_id
ORDER BY 2 DESC
LIMIT 5;

--c.3.1 ¿Cuándo se realizó el primer pedido? 2023-01-01 11:38:36--
SELECT order_date, order_time
FROM order_details
ORDER BY order_date ASC
LIMIT 1;

--c.3.2 ¿Cuándo se realizó el último pedido? 2023-03-31 11:22:20--
SELECT order_date, order_time
FROM order_details
ORDER BY order_date DESC
LIMIT 1;

--c.4 ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?= 308--
SELECT COUNT (DISTINCT (order_id))
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-05';

--d) /* Usar ambas tablas para conocer la reacción de los clientes respecto al menú.--
-- Realizar un left join entre entre order_details y menu_items con el identificador item_id(tabla order_details) y menu_item_id(tabla menu_items).--
SELECT *
FROM order_details AS A1
LEFT JOIN menu_items AS A2
ON A1.item_id = A2.menu_item_id;

--e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas--
--El objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y--
--utiliza los resultados obtenidos para llegar a estas conclusiones.--

--e.1 ¿Cuál es la comida que menos se vende? = Chicken Tacos = 123--
SELECT item_name, COUNT (item_name)
FROM order_details AS A1
LEFT JOIN menu_items AS A2
ON A1.item_id = A2.menu_item_id
GROUP BY item_name
ORDER BY COUNT (item_name) ASC
LIMIT 2;

--e.2 ¿Cuál es la comida que más se vende? = Hamburger= 622--
SELECT item_name, COUNT (item_name)
FROM order_details AS A1
LEFT JOIN menu_items AS A2
ON A1.item_id = A2.menu_item_id
GROUP BY item_name
ORDER BY COUNT (item_name) DESC
LIMIT 1;

--e.3 ¿Cuál categoria de comida es la más vendida?=- Asian = 3470--
SELECT category, COUNT (category)
FROM order_details AS A1
LEFT JOIN menu_items AS A2
ON A1.item_id = A2.menu_item_id
GROUP BY category
ORDER BY COUNT (category) DESC
LIMIT 1;

--e.4 ¿Cuál categoria de comida es la menos vendida?=- American = 2734--
SELECT category, COUNT (category)
FROM order_details AS A1
LEFT JOIN menu_items AS A2
ON A1.item_id = A2.menu_item_id
GROUP BY category
ORDER BY COUNT (category) ASC
LIMIT 2;

--e.5 ¿Cuál es la comida que da mayor ganancia? = Korean Beef Bowl = 10554.60--
SELECT item_name, SUM (price)
FROM order_details AS A1
LEFT JOIN menu_items AS A2
ON A1.item_id = A2.menu_item_id
GROUP BY item_name
ORDER BY SUM (price) DESC;
