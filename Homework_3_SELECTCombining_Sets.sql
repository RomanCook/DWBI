--CTE--01--
use [labor_sql];
go
;WITH Product_CTE as
(SELECT maker, model FROM product)
SELECT pr.model, pr.type, maker
FROM printer pr JOIN Product_CTE ON Product_CTE.model = pr.model
ORDER BY type;