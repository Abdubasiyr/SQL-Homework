-- === Задача 1: Все дистрибьюторы по всем регионам с нулями ===
WITH AllRegions AS (
  SELECT DISTINCT Region FROM #RegionSales
),
AllDistributors AS (
  SELECT DISTINCT Distributor FROM #RegionSales
),
AllCombos AS (
  SELECT r.Region, d.Distributor
  FROM AllRegions r CROSS JOIN AllDistributors d
)
SELECT 
  ac.Region, ac.Distributor, 
  ISNULL(rs.Sales, 0) AS Sales
FROM AllCombos ac
LEFT JOIN #RegionSales rs 
  ON ac.Region = rs.Region AND ac.Distributor = rs.Distributor
ORDER BY ac.Region, ac.Distributor;
GO

-- === Задача 2: Менеджеры с ≥5 прямыми подчинёнными ===
SELECT e1.name
FROM Employee e1
JOIN (
  SELECT managerId
  FROM Employee
  WHERE managerId IS NOT NULL
  GROUP BY managerId
  HAVING COUNT(*) >= 5
) e2 ON e1.id = e2.managerId;
GO

-- === Задача 3: Товары с ≥100 заказанными единицами в феврале 2020 ===
SELECT p.product_name, SUM(o.unit) AS unit
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
GO

-- === Задача 4: Вендор с макс. количеством заказов для каждого клиента ===
WITH VendorCounts AS (
  SELECT CustomerID, Vendor, COUNT(*) AS cnt
  FROM Orders
  GROUP BY CustomerID, Vendor
),
RankedVendors AS (
  SELECT *, RANK() OVER (PARTITION BY CustomerID ORDER BY cnt DESC) AS rk
  FROM VendorCounts
)
SELECT CustomerID, Vendor
FROM RankedVendors
WHERE rk = 1;
GO

-- === Задача 5: Проверка, является ли число простым ===
DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2;
DECLARE @is_prime BIT = 1;

WHILE @i <= SQRT(@Check_Prime)
BEGIN
  IF @Check_Prime % @i = 0
  BEGIN
    SET @is_prime = 0;
    BREAK;
  END
  SET @i = @i + 1;
END

IF @Check_Prime < 2
    SET @is_prime = 0;

IF @is_prime = 1
  PRINT 'This number is prime';
ELSE
  PRINT 'This number is not prime';
GO

-- === Задача 6: Статистика по устройствам ===
WITH LocationCount AS (
  SELECT Device_id, Locations, COUNT(*) AS cnt
  FROM Device
  GROUP BY Device_id, Locations
),
Ranked AS (
  SELECT *, RANK() OVER (PARTITION BY Device_id ORDER BY cnt DESC) AS rk
  FROM LocationCount
),
Aggregated AS (
  SELECT Device_id, COUNT(DISTINCT Locations) AS no_of_location, SUM(cnt) AS no_of_signals
  FROM LocationCount
  GROUP BY Device_id
)
SELECT a.Device_id, a.no_of_location, r.Locations AS max_signal_location, a.no_of_signals
FROM Aggregated a
JOIN Ranked r ON a.Device_id = r.Device_id AND r.rk = 1;
GO

-- === Задача 7: Сотрудники с зарплатой выше средней по отделу ===
SELECT e.EmpID, e.EmpName, e.Salary
FROM Employee e
JOIN (
  SELECT DeptID, AVG(Salary) AS avg_salary
  FROM Employee
  GROUP BY DeptID
) d ON e.DeptID = d.DeptID
WHERE e.Salary > d.avg_salary;
GO

-- === Задача 8: Подсчёт выигрыша в лотерее ===
WITH WinningNumbers AS (
  SELECT 25 AS Number UNION ALL SELECT 45 UNION ALL SELECT 78
),
MatchCount AS (
  SELECT TicketID, COUNT(*) AS matched
  FROM Tickets t
  JOIN WinningNumbers w ON t.Number = w.Number
  GROUP BY TicketID
)
SELECT SUM(
  CASE 
    WHEN matched = 3 THEN 100
    WHEN matched > 0 THEN 10
    ELSE 0
  END
) AS TotalPrize
FROM MatchCount;
GO

-- === Задача 9: Траты по платформам: Mobile, Desktop, Both ===
WITH UserPlatform AS (
  SELECT DISTINCT User_id, Spend_date,
    MAX(CASE WHEN Platform = 'Mobile' THEN 1 ELSE 0 END) AS is_mobile,
    MAX(CASE WHEN Platform = 'Desktop' THEN 1 ELSE 0 END) AS is_desktop
  FROM Spending
  GROUP BY User_id, Spend_date
),
Spendings AS (
  SELECT Spend_date, Platform, SUM(Amount) AS Total_Amount, COUNT(DISTINCT User_id) AS Total_users
  FROM (
    SELECT s.User_id, s.Spend_date, 
      CASE 
        WHEN up.is_mobile = 1 AND up.is_desktop = 1 THEN 'Both'
        WHEN up.is_mobile = 1 THEN 'Mobile'
        WHEN up.is_desktop = 1 THEN 'Desktop'
      END AS Platform,
      s.Amount
    FROM Spending s
    JOIN UserPlatform up ON s.User_id = up.User_id AND s.Spend_date = up.Spend_date
    WHERE NOT (up.is_mobile = 1 AND up.is_desktop = 1 AND s.Platform NOT IN ('Mobile', 'Desktop'))
  ) AS derived
  GROUP BY Spend_date, Platform
)
SELECT d.date AS Spend_date, p.Platform, ISNULL(s.Total_Amount, 0) AS Total_Amount, ISNULL(s.Total_users, 0) AS Total_users
FROM (SELECT DISTINCT Spend_date AS date FROM Spending) d
CROSS JOIN (SELECT 'Mobile' AS Platform UNION ALL SELECT 'Desktop' UNION ALL SELECT 'Both') p
LEFT JOIN Spendings s ON s.Spend_date = d.date AND s.Platform = p.Platform
ORDER BY d.date, 
  CASE p.Platform WHEN 'Mobile' THEN 1 WHEN 'Desktop' THEN 2 ELSE 3 END;
GO

-- === Задача 10: Де-группировка таблицы ===
WITH Numbers AS (
  SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL 
  SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL 
  SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
)
SELECT g.Product, 1 AS Quantity
FROM Grouped g
JOIN Numbers n ON n.n <= g.Quantity;
GO
