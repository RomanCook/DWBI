--join--01--
use [labor_sql];
go
SELECT product.maker, product.type, pc.speed, pc.hd
FROM PC
INNER JOIN product ON product.model = pc.model
WHERE hd > 8;
--join--02--
use [labor_sql];
go
SELECT DISTINCT maker
FROM product
INNER JOIN pc ON product.model = pc.model
WHERE speed > 600;
--join--03--
use [labor_sql];
go
SELECT DISTINCT maker
FROM product
INNER JOIN laptop ON product.model = laptop.model
WHERE speed < 500;
--join--04--
use [labor_sql];
go
SELECT DISTINCT A.model as model_1, B.model as model_2, A.hd, A.ram
FROM laptop A, laptop B
WHERE A.hd = B.hd and A.ram = B.ram AND B.model < A.model;
--join--05--
use [labor_sql];
go
SELECT A.country, A.type, B.type
FROM classes A JOIN classes B ON A.country=B.country
WHERE A.type='bb' AND B.type='bc';
--join--06--
use [labor_sql];
go
SELECT pc.model, product.maker
FROM pc
JOIN product ON pc.model = product.model
WHERE price < 600;
--join--07--
use [labor_sql];
go
SELECT printer.model, product.maker
FROM printer
JOIN product ON printer.model = product.model
WHERE price > 300;
--join--08--
use [labor_sql];
go
SELECT product.maker, PC.model as model, PC.price as price
FROM PC
JOIN product ON PC.model = product.model
UNION
SELECT product.maker, Laptop.model as model, Laptop.price as price
FROM laptop
JOIN product ON laptop.model = product.model
--join--09--
use [labor_sql];
go
SELECT product.maker, PC.model as model, PC.price as price
FROM PC
JOIN product ON PC.model = product.model
--join--10--
use [labor_sql];
go
SELECT p.maker, p.type, l.model, l.speed
FROM laptop l
JOIN product p ON l.model = p.model
--join--11--
use [labor_sql];
go
SELECT name, launched
FROM ships;
--join--12--
use [labor_sql];
go
SELECT name, date
FROM battles
JOIN outcomes ON battles.name = outcomes.battle
WHERE result <> 'sunk';
--join--13--
use [labor_sql];
go
SELECT name, country
FROM ships
JOIN classes ON ships.class = classes.class