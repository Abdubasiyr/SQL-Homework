--1.
select p.firstName,
       p.lastName,
	   a.city,
	   a.state
from Person p
left join Address a on p.personId = a.personId

--2.
select a.name as Employee from Employee a
join Employee b on a.managerId = b.id
where a.salary > b.salary

--3.
select email as Email 
from Person
group by email 
having count(email) > 1

--4.
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
)

--5.
select distinct ParentName from girls where ParentName not in (select ParentName from boys)

--6.
select custid,
       sum(case when freight > 50 then freight else 0 end) as TotalSales,
	   min(freight) as LeastPurchase 
from Sales.Orders
group by custid

--7.
select * from Cart1 order by item desc
select * from Cart2 order by item desc

select isnull(c1.Item, '') as [Item Cart 1],
       isnull(c2.Item, '') as [Item Cart 2],
	   case when c1.item is not null and c2.item is not null then 0 
	        when c1.item is not null then 1 
			else 2 end
from Cart1 c1
full join Cart2 c2 on c1.Item = c2.Item
order by 3

--8.
select * from match1

SELECT 
    *,
    CASE
        WHEN CAST(LEFT(Score, CHARINDEX(':', Score) - 1) AS INT) 
             > CAST(RIGHT(Score, LEN(Score) - CHARINDEX(':', Score)) AS INT)
            THEN LEFT(Match, CHARINDEX('-', Match) - 1)

        WHEN CAST(LEFT(Score, CHARINDEX(':', Score) - 1) AS INT) 
             < CAST(RIGHT(Score, LEN(Score) - CHARINDEX(':', Score)) AS INT)
            THEN RIGHT(Match, LEN(Match) - CHARINDEX('-', Match))

        ELSE 'Draw'
    END AS Result
FROM match1

--9.
select name as Customers from Customers where name not in (
select name from Customers c
join Orders o on o.customerId = c.id 
)

--10.
select s.student_id,
       s.student_name,
	   e.subject_name,
	   count(e.subject_name) as attended_exams
from Students s
left join Examinations e on s.student_id = e.student_id
group by s.student_id,s.student_name,e.subject_name 
order by s.student_id, e.subject_name




