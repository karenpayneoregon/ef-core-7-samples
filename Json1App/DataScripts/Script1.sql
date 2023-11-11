SELECT FirstName,
       LastName,
       FORMAT(DateOfBirth, 'dd/MM/yyyy ') AS DateOfBirth,
       JSON_VALUE(Addresses, '$[0].Street') AS Street,
       JSON_VALUE(Addresses, '$[0].City') AS City,
       JSON_VALUE(Addresses, '$[0].Company') AS Company
FROM [EF.Json].dbo.Person;


    SELECT FirstName,
           LastName,
           FORMAT(DateOfBirth, 'dd/MM/yyyy ') AS DateOfBirth,
           JSON_VALUE(Addresses, '$[1].Street') AS Street,
           JSON_VALUE(Addresses, '$[1].City') AS City,
           JSON_VALUE(Addresses, '$[1].Company') AS Company
    FROM [EF.Json].dbo.Person;


    DECLARE @Index AS NCHAR(1) = 1;
    SELECT  Id,
		    FirstName,
		    LastName,
		    DateOfBirth,
		    JSON_VALUE(Addresses, '$[' + @Index + '].Street') AS Street,
		    JSON_VALUE(Addresses, '$[' + @Index + '].City') AS City,
		    JSON_VALUE(Addresses, '$[' + @Index + '].Company') AS Company
    FROM dbo.Person;


    DECLARE @cnt INT = 0;
    WHILE @cnt < 2
    BEGIN
        SELECT Id,
               FirstName,
               LastName,
               DateOfBirth,
               JSON_VALUE(Addresses, '$[' + CAST(@cnt AS nvarchar(1)) + '].Street') AS Street,
               JSON_VALUE(Addresses, '$[' + CAST(@cnt AS nvarchar(1)) + '].City')   AS City,
               JSON_VALUE(Addresses, '$[' + CAST(@cnt AS nvarchar(1)) + '].Company') AS Company
        FROM dbo.Person;
        SET @cnt = @cnt + 1;
    END;