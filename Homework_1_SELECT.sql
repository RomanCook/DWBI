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