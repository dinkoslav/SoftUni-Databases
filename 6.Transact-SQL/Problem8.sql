DECLARE @firstName nvarchar(50),		@lastName nvarchar(50),		@townName nvarchar(50),		@secondFirstName nvarchar(50),		@secondLastName nvarchar(50)DECLARE firstEmployeeAndAddressesCursor CURSOR READ_ONLY FOR	SELECT e.FirstName, e.LastName, t.Name	FROM Employees e	JOIN Addresses a	ON e.AddressID = a.AddressID	JOIN Towns t	ON a.TownID = t.TownIDOPEN firstEmployeeAndAddressesCursorFETCH NEXT FROM firstEmployeeAndAddressesCursor INTO @firstName, @lastName, @townNameWHILE @@FETCH_STATUS = 0	BEGIN		DECLARE secondEmployeeAndAddressesCursor CURSOR READ_ONLY FOR		SELECT e.FirstName, e.LastName		FROM Employees e		JOIN Addresses a		ON e.AddressID = a.AddressID		JOIN Towns t		ON a.TownID = t.TownID		WHERE t.Name = @townName		OPEN secondEmployeeAndAddressesCursor		FETCH NEXT FROM secondEmployeeAndAddressesCursor INTO @secondFirstName, @secondLastName		WHILE @@FETCH_STATUS = 0			BEGIN				PRINT 'Town: ' + @townName + ' | ' + 'Employee 1: ' + @firstName + ' ' + @lastName +					' | Employee 2: ' + @secondFirstName + ' ' + @secondLastName				FETCH NEXT FROM secondEmployeeAndAddressesCursor INTO @secondFirstName, @secondLastName			END		CLOSE secondEmployeeAndAddressesCursor		DEALLOCATE secondEmployeeAndAddressesCursor		FETCH NEXT FROM firstEmployeeAndAddressesCursor INTO @firstName, @lastName, @townName	ENDCLOSE firstEmployeeAndAddressesCursorDEALLOCATE firstEmployeeAndAddressesCursor