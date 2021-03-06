--CTE--01--
use [labor_sql];
go
;WITH Product_CTE as
(SELECT maker, model FROM product)
SELECT pr.model, pr.type, maker
FROM printer pr JOIN Product_CTE ON Product_CTE.model = pr.model
ORDER BY type;
--CTE--05--
use [labor_sql];
go
;WITH num_CTE(num)
AS 
(SELECT num = 1 
UNION ALL
SELECT num + 1 FROM num_CTE WHERE num < 10000)
SELECT * FROM num_CTE
OPTION (MAXRECURSION 0);
--CTE--06--
use [labor_sql];
go
;WITH num_CTE(num)
AS 
(SELECT num = 1 
UNION ALL
SELECT num + 1 FROM num_CTE WHERE num < 100000)
SELECT * FROM num_CTE
OPTION (MAXRECURSION 0);
--CTE--08--
use [labor_sql];
go
SELECT DISTINCT maker
FROM product
WHERE type = 'PC' AND maker NOT IN
(SELECT DISTINCT maker FROM product WHERE type = 'laptop');
--CTE--11--
use [labor_sql];
go
SELECT DISTINCT maker
FROM product
WHERE type = 'PC' AND maker IN
(SELECT DISTINCT maker FROM product WHERE type = 'laptop');
