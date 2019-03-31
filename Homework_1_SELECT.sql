--1
use [labor_sql];
go
SELECT DISTINCT maker
FROM product
WHERE type = 'laptop'
ORDER BY maker;
--2
use [labor_sql];
go
SELECT model, ram, screen, price
FROM laptop
WHERE price > 1000
ORDER BY ram ASC, price DESC;
--3
use [labor_sql];
go
SELECT *
FROM printer
WHERE color = 'y'
ORDER BY price DESC;
--4
use [labor_sql];
go
SELECT model, speed, hd, cd, price
FROM pc
WHERE price < 600 AND (cd = '12x' or cd = '24x')
ORDER BY price DESC;
--5
use [labor_sql];
go
SELECT name, class
FROM ships
ORDER BY name;
--6
use [labor_sql];
go
SELECT *
FROM pc
WHERE price > 800 AND speed > 500
ORDER BY price DESC;
--7
use [labor_sql];
go
SELECT *
FROM printer
WHERE [type] != 'matrix' AND price < 300
ORDER BY [type] DESC;
--8
use [labor_sql];
go
SELECT model, speed
FROM pc
WHERE price BETWEEN 400 AND 600
ORDER BY hd;
--9
use [labor_sql];
go
SELECT model, speed, hd, price
FROM laptop
WHERE screen > 12
ORDER BY price DESC;
--10
use [labor_sql];
go
SELECT model, [type], price
FROM printer
WHERE price < 300
ORDER BY price DESC;
--11
use [labor_sql];
go
SELECT model, ram, price
FROM laptop
WHERE ram = 64
ORDER BY screen;
--12
use [labor_sql];
go
SELECT model, ram, price
FROM pc
WHERE ram > 64
ORDER BY hd;
--13
use [labor_sql];
go
SELECT model, speed, price
FROM pc
WHERE speed BETWEEN 500 AND 750
ORDER BY hd DESC;
--14
use [labor_sql];
go
SELECT *
FROM outcome_o
WHERE [out] > 2000
ORDER BY [date] DESC;
--15
use [labor_sql];
go
SELECT *
FROM income_o
WHERE inc BETWEEN 5000 AND 10000
ORDER BY inc;
--16
use [labor_sql];
go
SELECT *
FROM income
WHERE point = 1
ORDER BY inc;
--17
use [labor_sql];
go
SELECT *
FROM outcome
WHERE point = 2
ORDER BY [out];
--18
use [labor_sql];
go
SELECT *
FROM classes
WHERE country = 'Japan'
ORDER BY [type] DESC;
--19
use [labor_sql];
go
SELECT name, launched
FROM ships
WHERE launched BETWEEN 1920 AND 1942
ORDER BY launched DESC;
--20
use [labor_sql];
go
SELECT ship, battle, result
FROM outcomes
WHERE battle = 'Guadalcanal' AND result != 'sunk'
ORDER BY ship DESC;
--21
use [labor_sql];
go
SELECT ship, battle, result
FROM outcomes
WHERE result = 'sunk'
ORDER BY ship DESC;
--22
use [labor_sql];
go
SELECT class, displacement
FROM classes
WHERE displacement > 40000
ORDER BY type;
--23
use [labor_sql];
go
SELECT trip_no, town_from, town_to
FROM trip
WHERE town_to = 'London'
ORDER BY time_out;
--24
use [labor_sql];
go
SELECT trip_no, plane, town_from, town_to
FROM trip
WHERE plane = 'TU-134'
ORDER BY time_out DESC;
--25
use [labor_sql];
go
SELECT trip_no, plane, town_from, town_to
FROM trip
WHERE plane != 'IL-86'
ORDER BY plane;
--26
use [labor_sql];
go
SELECT trip_no, town_from, town_to
FROM trip
WHERE town_to != 'Rostov'
ORDER BY plane;
