
SELECT PostalCode, StateProvinceID,
       RANK() OVER 
         (PARTITION BY StateProvinceID
		  ORDER BY PostalCode ASC) AS RankingValue
FROM Person.Address 
WHERE StateProvinceID IN (23,46);

SELECT PostalCode, StateProvinceID,
       DENSE_RANK() OVER 
         (PARTITION BY StateProvinceID
		  ORDER BY PostalCode ASC) AS RankingValue
FROM Person.Address 
WHERE StateProvinceID IN (23,46);

SELECT PostalCode, StateProvinceID,
       NTILE(2) OVER 
         (ORDER BY PostalCode ASC) AS NTileValue
FROM Person.Address 
WHERE StateProvinceID IN (23,46);


SELECT PostalCode, StateProvinceID,
       ROW_NUMBER() OVER 
		 (ORDER BY PostalCode ASC) AS RowNumber
FROM Person.Address 
WHERE StateProvinceID IN (46,23);


