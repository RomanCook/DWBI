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
--join--14--
use [labor_sql];
go
SELECT DISTINCT plane, name
FROM trip
JOIN company ON trip.id_comp = company.id_comp;
--join--15--
use [labor_sql];
go
SELECT name, date
FROM passenger
JOIN pass_in_trip ON passenger.id_psg = pass_in_trip.id_psg;
--join--16--
use [labor_sql];
go
SELECT pc.model as model, pc.speed as speed, pc.hd as hd
FROM pc
JOIN product ON pc.model = product.model 
WHERE (pc.hd = 10 or pc.hd = 20) AND maker = 'A'
UNION
SELECT l.model as model, l.speed as speed, l.hd as hd
FROM laptop l
JOIN product ON l.model = product.model 
WHERE (l.hd = 10 or l.hd = 20) AND maker = 'A'
ORDER BY speed
--join--17--
use [labor_sql];
go
SELECT *
FROM(SELECT maker, type FROM product) as p1
PIVOT(count(type) FOR type IN (pc, laptop, printer)) as p2
--join--18--
use [labor_sql];
go
SELECT 'average price' as avg_, [11],[12],[14],[15]
FROM(SELECT price, screen FROM laptop) as p1
PIVOT(avg(price) FOR screen IN([11],[12],[14],[15])) as p2;
--join--19--
use [labor_sql];
go
SELECT *
FROM laptop l
CROSS APPLY(
SELECT p.maker FROM product p WHERE l.model = p.model) m
--join--20--
use [labor_sql];
go
SELECT *
FROM laptop
CROSS APPLY(
SELECT MAX(price) as max_price
FROM laptop l JOIN product p ON l.model = p.model
GROUP BY maker) m
--join--21--
SELECT *
FROM laptop l1
CROSS APPLY(
SELECT TOP(1) * FROM laptop l2
WHERE l1.model < l2.model OR 
(l1.model = l2.model AND l1.code < l2.code)
order by l2.model, l2.code) mm
order by l1.model, l1.code
--join--22--
use [labor_sql];
go
SELECT *
FROM laptop l1
OUTER APPLY(
SELECT TOP(1) * FROM laptop l2
WHERE l1.model < l2.model OR 
(l1.model = l2.model AND l1.code < l2.code)
order by l2.model, l2.code) mm
order by l1.model, l1.code
--join--23--
use [labor_sql];
go
SELECT maker, model, p.type from ( 
select distinct type from product
) p
cross apply (
select top (3) * from product pr where pr.type=p.type) pp
--join--24--
use [labor_sql];
go
SELECT code, name, value 
FROM laptop
CROSS APPLY (
VALUES('hd', hd), ('ram', ram)
,('screen', screen), ('speed', speed)
)
A (name, value);
