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
--27
use [labor_sql];
go
SELECT *
FROM pc
WHERE model LIKE '%1%1%';
--28
use [labor_sql];
go
SELECT *
FROM outcome
WHERE DATEPART (mm, [date]) = 03;
--29
use [labor_sql];
go
SELECT *
FROM outcome_o
WHERE DATEPART (dd, [date]) = 14;
--30
use [labor_sql];
go
SELECT *
FROM ships
WHERE name LIKE 'W%n';
--31
use [labor_sql];
go
SELECT *
FROM ships
WHERE name LIKE '%e%e%';
--32
use [labor_sql];
go
SELECT name, launched
FROM ships
WHERE name NOT LIKE '%a';
--33
use [labor_sql];
go
SELECT name
FROM battles
WHERE name LIKE '% %' AND name NOT LIKE '%% %a';
--34
use [labor_sql];
go
SELECT *
FROM trip
WHERE DATEPART (HH, time_out) BETWEEN 12 AND 17;
--35
use [labor_sql];
go
SELECT *
FROM trip
WHERE DATEPART (HH, time_in) BETWEEN 17 AND 23;
--36
use [labor_sql];
go
SELECT *
FROM trip
WHERE DATEPART (HH, time_in) NOT BETWEEN 10 AND 21;
--37
use [labor_sql];
go
SELECT date
FROM pass_in_trip
WHERE place LIKE '1%';
--38
use [labor_sql];
go
SELECT date
FROM pass_in_trip
WHERE place LIKE '%c';
--39
use [labor_sql];
go
SELECT SUBSTRING (name, charindex (name,' ') + 1, 99) as name
FROM passenger
WHERE name LIKE '%% C%';
--40
use [labor_sql];
go
SELECT SUBSTRING (name, charindex (name,' ') + 1, 99) as name
FROM passenger
WHERE name NOT LIKE '%% J%';
--41
use [labor_sql];
go
SELECT 'середнє значення =' + cast(AVG(price) as varchar(20)) as AVG_price
FROM laptop;
--42
use [labor_sql];
go
SELECT
'модель: ' + cast(model as varchar(20)) as model,
'швидкість: ' + cast(speed as varchar(20)) as speed,
'память: ' + cast(ram as varchar(20)) as ram,
'діагональ: ' + cast(hd as varchar(20)) as hd,
'cd привід: ' + cast(cd as varchar(20)) as cd,
'ціна: ' + cast(price as varchar(20)) as price
FROM pc;
--43
use [labor_sql];
go
SELECT CONVERT (char(10),date, 102) as DATE
FROM income;
--44
use [labor_sql];
go
SELECT ship, battle,
    CASE
        WHEN result = 'sunk' THEN 'потоплений'
        WHEN result = 'damaged' THEN 'пошкоджений'
        WHEN result = 'OK' THEN 'цілий'
    END 
    AS result
FROM outcomes;
--45
use [labor_sql];
go
SELECT trip_no, date, 
		'ряд: ' + SUBSTRING(place,1,1) AS ряд,
		'місце: ' + SUBSTRING(place,2,1) AS місце
FROM pass_in_trip;
--46
use [labor_sql];
go
SELECT trip_no, plane, 
		'from ' + RTRIM(town_from) + ' to ' + town_to AS from_to,
		--'from ' + CONCAT_WS(' to ',rtrim(town_from), town_to) AS from_to,
		time_out, time_in
FROM trip;
--47
use [labor_sql];
go
	SELECT	LEFT(trip_no,1) + RIGHT(trip_no,1) +
			LEFT(plane,1) + RIGHT(TRIM(plane), 1) +
			LEFT(town_from,1) + RIGHT(TRIM(town_from),1) +
			LEFT(town_to,1) + RIGHT((town_to),1) +
			LEFT(convert(nvarchar(30),time_out, 126),1) + RIGHT(convert(nvarchar(30),time_out,126),1) +
			LEFT(convert(nvarchar(30),time_in, 126),1) + RIGHT(convert(nvarchar(30),time_in,126),1)
	AS data
FROM trip;
--48
use [labor_sql];
go
SELECT maker, COUNT(model) AS count_model
FROM product
WHERE type = 'PC'
GROUP BY maker
HAVING COUNT(DISTINCT model) > 1;
--49
use [labor_sql];
go
SELECT town, count(trip_no) as trip_no_count
FROM (
	SELECT trip_no, town_from town from trip
	UNION ALL
	SELECT trip_no, town_to town from trip
	) AS t
GROUP BY town
