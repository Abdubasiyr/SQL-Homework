--1. 
select substring('DATABASE', 1, 4)

--2.
select charindex('SQL', 'I love SQL Server')

--3.
select replace('Hello World', 'World', 'SQL')

--4.
select len('Microsoft SQL Server')

--5.
select right('Database', 3)

--6.
select 
len('apple') - len(replace('apple', 'a', '')) as [Apple a's],
len('banana') - len(replace('banana', 'a', '')) as [Banana a's],
len('grape') - len(replace('grape', 'a', '')) as [Grape a's]

--7.
select substring('abcdefg', 6, 2)

--8.
select substring('SQL is powerful', 5, 2), substring('I love databases', 3, 4)

--9.
select round(15.6789, 2)

--10.
select abs(-345.67)

--11.
select substring('ABCDEFGHI', 4, 3)

--12.
SELECT REPLACE('Microsoft', 'Mic', 'XXX')

--13.
select charindex(' ', 'SQL Server 2025')

--14.
select concat('FirstName', ',', 'LastName')

--15.
select substring('The database is very efficient', charindex('is', 'The database is very efficient'), 2)

--16.
SELECT 
SUBSTRING('INV1234', PATINDEX('%[0-9]%', 'INV1234'), LEN('INV1234')), 
substring('ORD5678', PATINDEX('%[0-9]%', 'ORD5678'), LEN('ORD5678'))

--17.
select ceiling(99.5)

--18.
select datediff(day, '2025-01-01', '2025-03-15')

--19.
select datename(month, '2025-06-10')

--20.
select datepart(week, '2025-04-22')

--21.
select 
substring('user1@gmail.com', charindex('@', 'user1@gmail.com') + 1, len('user1@gmail.com')), 
substring('admin@company.org', charindex('@', 'admin@company.org') + 1, len('admin@company.org'))

--22.
select right('experience', 1)

--23.
SELECT FLOOR(RAND() * (500 - 100 + 1)) + 100 AS RandomNumber

--24.
SELECT FORMAT(9876543, 'N0') AS FormattedNumber

--25.
CREATE TABLE Customers (FullName VARCHAR(100)); INSERT INTO Customers VALUES ('John Doe'), ('Jane Smith')

SELECT 
    LEFT(Fullname, CHARINDEX(' ', Fullname) - 1) AS FirstName,
    RIGHT(Fullname, LEN(fullname) - CHARINDEX(' ', Fullname)) AS LastName
FROM Customers

--26.
select replace('SQL Server is great', ' ', '-')

--27.
SELECT FORMAT(42, '00000') AS PaddedNumber

--28.
select right('SQL is fast and efficient', 9)

--29.
select replace('Error: Connection failed', 'Error:', '')

--30.
select datediff(minute, '08:15:00', '09:45:00')






