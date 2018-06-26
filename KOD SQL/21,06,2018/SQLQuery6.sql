CREATE TABLE dbo.Product
    (
      ID INT IDENTITY ,
      ProductName VARCHAR(100) ,
      Price MONEY
    );
INSERT  INTO dbo.Product
VALUES  ( 'Red Santa Suit', 199.99 ),
        ( 'Candy Canes', 1.99 ),
        ( 'Fake Snow', 2.99 ),
        ( 'Red Bells', 49.99 ),
        ( 'LED Lights', 6.99 );

CREATE TABLE dbo.SearchString
    (
      ID INT IDENTITY ,
      String VARCHAR(100)
    );

INSERT  INTO dbo.SearchString
VALUES  ( 'Red' ),
        ( 'Lights' ),
        ( 'Star' );
GO

CREATE FUNCTION dbo.FindProductLike
    (
      @FindString VARCHAR(100)
    )
RETURNS TABLE
AS
RETURN
    ( SELECT    ProductName ,
                Price
      FROM      dbo.Product
      WHERE     ProductName LIKE '%' + @FindString + '%'
    );

use ETL_TEST 
go
SELECT  *
FROM    dbo.SearchString AS S
        CROSS APPLY dbo.FindProductLike(S.String);



IF object_id('CustPref') IS NOT NULL DROP TABLE CustPref;
GO
CREATE TABLE CustPref(CustID int identity, CustName varchar(20), 
             Pref1Type varchar(20),  Pref1Data varchar(100),
             Pref2Type varchar(20),  Pref2Data varchar(100),
			Pref3Type varchar(20),  Pref3Data varchar(100),
			 Pref4Type varchar(20),  Pref4Data varchar(100),
			 );
GO
INSERT INTO CustPref (CustName, Pref1Type, Pref1Data,
                                Pref2Type, Pref2Data, 
                                Pref3Type, Pref3Data,
                                Pref4Type, Pref4Data)
VALUES 
	('David Smith','Pool', 'Yes',
	              'Children', 'Yes',
				  'Bed', 'King',
				  'Pets', 'No'),
	('Randy Johnson','Vehicle', 'Convertible',
	              'PriceRange', '$$$',
				  null, null,
				  null, null),
	('Dr. John Fluke','Email', 'DrJ@Pain.com',
	              'Office Phone', '555-444-9845',
				  'Emergency Phone', '555-444-9846',
				  null,null);
SELECT * FROM CustPref;
GO






SELECT CustId, CustName, PrefType, PrefValue   
FROM    (SELECT CustID, CustName
         , Pref1Type, Pref1Data, Pref2Type, Pref2Data 
		 , Pref3Type, Pref3Data, Pref4Type, Pref4Data 
   FROM CustPref) Pref
UNPIVOT
   (PrefValue FOR PrefValues IN 
      (Pref1Data, Pref2Data, Pref3Data, Pref4Data) )AS UP1
UNPIVOT
   (PrefType FOR PrefTypes IN 
      (Pref1Type, Pref2Type, Pref3Type, Pref4Type)
 
) AS UP2 
WHERE 
substring(PrefValues,5,1) = substring(PrefTypes,5,1);
GO


PRINT N'This message was printed on '  
    + RTRIM(CAST(GETDATE() AS nvarchar(30)))  
    + N'.';  
GO


RAISERROR (N'<\<%*.*s>>', -- Message text.  
           10, -- Severity,  
           1, -- State,  
           7, -- First argument used for width.  
           3, -- Second argument used for precision.  
           N'abcde'); -- Third argument supplies the string.  
-- The message text returned is: <<    abc>>.  
GO  
