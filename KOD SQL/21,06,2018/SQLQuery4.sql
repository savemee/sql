CREATE TABLE Product (ID int, 
                      ProductName varchar(100),
                      Cost money);
CREATE TABLE SalesItem (ID int, 
                        SalesDate datetime, 
                        ProductID int, 
                        Qty int, 
                        TotalSalesAmt money);
INSERT INTO Product 
	VALUES (1,'Widget',21.99),
	       (2,'Thingamajig',5.38), 
		   (3,'Watchamacallit',1.96);
INSERT INTO SalesItem
	VALUES (1,'2014-10-1',1,1,21.99),
	       (2,'2014-10-2',3,1,1.96),
	       (3,'2014-10-3',3,10,19.60),
	       (4,'2014-10-3',1,2,43.98),
	       (5,'2014-10-3',1,2,43.98); 


SELECT * FROM 
Product CROSS JOIN SalesItem;

SELECT * FROM Product P INNER JOIN SalesItem S
ON P.ID = S.ProductID;

--drop table Cust
--drop table Sales
CREATE TABLE Cust (Id int, CustName varchar(20));
CREATE TABLE Sales (Id int identity
                    ,CustID int
					,SaleDate date
					,SalesAmt money);

select * from Cust
select * from Sales

SET NOCOUNT ON;
DECLARE @I int = 0;
DECLARE @Date date;
WHILE @I < 1000
BEGIN	
	SET @I = @I + 1;
	SET @Date = DATEADD(mm, -2, '2014-11-01');
	INSERT INTO Cust 
	VALUES (@I, 
	        'Customer #' + right(cast(@I+100000 as varchar(6)),5));
	WHILE @Date < '2014-11-01' 
	BEGIN
		IF @I%7 > 0
			INSERT INTO Sales (CustID, SaleDate, SalesAmt) 
			VALUES (@I, @Date, 10.00);
		SET @Date = DATEADD(DD, 1, @Date);
	END
END

declare @licznik int = 0;
while (@licznik <10)
begin
set @licznik = @licznik +1;
select @licznik;
end

SELECT CONVERT(CHAR(6),S1.SaleDate,112) AS SalesMonth, C.CustName, 
       ISNULL(SUM(S2.SalesAmt),0) AS TotalSales
FROM Cust C
CROSS JOIN  
(
SELECT SaleDate FROM Sales 
) AS S1
LEFT OUTER JOIN 
Sales  S2
ON C.ID = S2.CustID
AND S1.SaleDate = S2.SaleDate
GROUP BY CONVERT(CHAR(6),S1.SaleDate,112),C.CustName
HAVING ISNULL(SUM(S2.SalesAmt),0) = 0
ORDER BY CONVERT(CHAR(6),S1.SaleDate,112),C.CustName


