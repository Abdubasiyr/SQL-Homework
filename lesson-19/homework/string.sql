-- Task 1: Create a stored procedure to calculate bonus for employees
CREATE PROCEDURE CalculateEmployeeBonus
AS
BEGIN
    -- Create temporary table
    CREATE TABLE #EmployeeBonus (
        EmployeeID INT,
        FullName NVARCHAR(200),
        Department NVARCHAR(100),
        Salary DECIMAL(10, 2),
        BonusAmount DECIMAL(10, 2)
    );

    -- Insert data into the temporary table
    INSERT INTO #EmployeeBonus (EmployeeID, FullName, Department, Salary, BonusAmount)
    SELECT 
        EmployeeID,
        FirstName + ' ' + LastName AS FullName,
        Department,
        Salary,
        Salary * BonusPercentage / 100 AS BonusAmount
    FROM Employees;

    -- Select data from temporary table
    SELECT * FROM #EmployeeBonus;
END;

-- Task 2: Create a stored procedure to update salary based on department and increase percentage
CREATE PROCEDURE UpdateSalaryByDepartment
    @DepartmentName NVARCHAR(100),
    @IncreasePercentage DECIMAL(5,2)
AS
BEGIN
    -- Update salary of employees in the specified department
    UPDATE Employees
    SET Salary = Salary + (Salary * @IncreasePercentage / 100)
    WHERE Department = @DepartmentName;

    -- Return the updated employees
    SELECT * FROM Employees WHERE Department = @DepartmentName;
END;

-- Task 3: MERGE operation to update, insert, and delete products
MERGE INTO Products_Current AS target
USING Products_New AS source
ON target.ProductID = source.ProductID
WHEN MATCHED THEN
    UPDATE SET target.ProductName = source.ProductName, target.Price = source.Price
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductID, ProductName, Price) VALUES (source.ProductID, source.ProductName, source.Price)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

-- Return the final state of Products_Current after MERGE
SELECT * FROM Products_Current;

-- Task 4: Reporting tree node types
SELECT 
    id,
    CASE 
        WHEN p_id IS NULL THEN 'Root'
        WHEN NOT EXISTS (SELECT 1 FROM Tree WHERE p_id = Tree.id) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree;

-- Task 5: Calculate confirmation rate for each user
SELECT 
    s.user_id,
    COALESCE(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 / COUNT(c.action), 0) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;

-- Task 6: Find employees with the lowest salary using subquery
SELECT * 
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- Task 7: Get product sales summary
CREATE PROCEDURE GetProductSalesSummary
    @ProductID INT
AS
BEGIN
    SELECT 
        p.ProductName,
        ISNULL(SUM(s.Quantity), NULL) AS TotalQuantitySold,
        ISNULL(SUM(s.Quantity * p.Price), NULL) AS TotalSalesAmount,
        MIN(s.SaleDate) AS FirstSaleDate,
        MAX(s.SaleDate) AS LastSaleDate
    FROM Products p
    LEFT JOIN Sales s ON p.ProductID = s.ProductID
    WHERE p.ProductID = @ProductID
    GROUP BY p.ProductName;
END;
