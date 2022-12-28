SELECT FirstName,
       LastName,
       FORMAT(DateOfBirth, 'dd/MM/yyyy ')    AS DateOfBirth,
       JSON_VALUE(Addresses, '$[1].Street')  AS Street,
       JSON_VALUE(Addresses, '$[1].City')    AS City,
       JSON_VALUE(Addresses, '$[1].Company') AS Company
FROM [EF.Json].dbo.Person;


SELECT FirstName,
       LastName,
       FORMAT(DateOfBirth, 'dd/MM/yyyy ')    AS DateOfBirth,
       JSON_VALUE(Addresses, '$[1].Street')  AS Street,
       JSON_VALUE(Addresses, '$[1].City')    AS City,
       JSON_VALUE(Addresses, '$[1].Company') AS Company
FROM [EF.Json].dbo.Person;


DECLARE @Index AS NCHAR(1) = 1;
SELECT Id,
		FirstName,
		LastName,
		DateOfBirth,
		JSON_VALUE(Addresses, '$[' + @Index + '].Street') AS Street,
		JSON_VALUE(Addresses, '$[' + @Index + '].City') AS City,
		JSON_VALUE(Addresses, '$[' + @Index + '].Company') AS Company
FROM dbo.Person;