select * from Person.Person

select * from Person.Person where PersonType = ANY(select PersonType from Person.Person where EmailPromotion = 0);


-- cte
use AdventureWorks2014
go

WITH MonthlyProductSales AS
(
SELECT CONVERT(CHAR(7),ModifiedDate,120) AS YearMonth
, ProductID
, SUM(LineTotal) AS SumLineTotal
FROM Sales.SalesOrderDetail
GROUP BY ProductId, CONVERT(CHAR(7),ModifiedDate,120)
)
-- SELECT statement referencing CTE
SELECT * FROM MonthlyProductSales
WHERE YearMonth = '2008-06';

SELECT OrderYear, TerritoryID, 
       [1], [2], [3], [4] 
	    
FROM
(SELECT Year([OrderDate]) AS OrderYear
        ,TerritoryID 
        , ((Month([OrderDate])-1)/3) + 1 as OrderQtr
	   ,1 Num
FROM [Sales].[SalesOrderHeader]
WHERE Year([OrderDate]) in (2005,2006)) AS SourceTable
PIVOT
(
COUNT(Num)  
FOR [OrderQtr] IN ([1], [2], [3], [4])
) AS PivotTable
ORDER BY OrderYear, TerritoryID;