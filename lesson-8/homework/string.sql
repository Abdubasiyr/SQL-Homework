CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
)
INSERT INTO Customers (CustomerID, CustomerName, Country) VALUES
(1, 'John Doe', 'USA'),
(2, 'Jane Smith', 'UK'),
(3, 'Michael Johnson', 'Canada'),
(4, 'Sarah Brown', 'Australia'),
(5, 'David Green', 'USA'),
(6, 'Linda White', 'Canada'),
(7, 'James Black', 'UK'),
(8, 'Emily Blue', 'Australia'),
(9, 'Matthew Red', 'USA'),
(10, 'Olivia Yellow', 'Canada'),
(11, 'John Doe', 'Australia'),
(12, 'Jane Smith', 'Canada'),
(13, 'Michael Johnson', 'UK'),
(14, 'Sarah Brown', 'USA'),
(15, 'David Green', 'Canada'),
(16, 'Linda White', 'Australia'),
(17, 'James Black', 'USA'),
(18, 'Emily Blue', 'Canada'),
(19, 'Matthew Red', 'UK'),
(20, 'Olivia Yellow', 'Australia'),
(21, 'John Doe', 'Canada'),
(22, 'Jane Smith', 'Australia'),
(23, 'Michael Johnson', 'USA'),
(24, 'Sarah Brown', 'UK'),
(25, 'David Green', 'Australia'),
(26, 'Linda White', 'USA'),
(27, 'James Black', 'Canada'),
(28, 'Emily Blue', 'UK'),
(29, 'Matthew Red', 'Australia'),
(30, 'Olivia Yellow', 'USA'),
(31, 'John Doe', 'UK'),
(32, 'Jane Smith', 'USA'),
(33, 'Michael Johnson', 'Australia'),
(34, 'Sarah Brown', 'Canada'),
(35, 'David Green', 'UK'),
(36, 'Linda White', 'USA'),
(37, 'James Black', 'Australia'),
(38, 'Emily Blue', 'Canada'),
(39, 'Matthew Red', 'USA'),
(40, 'Olivia Yellow', 'UK')

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
)
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 400.00),
(4, 'Monitor', 200.00),
(5, 'Keyboard', 50.00),
(6, 'Mouse', 30.00),
(7, 'Printer', 150.00),
(8, 'Headphones', 100.00),
(9, 'Speakers', 80.00),
(10, 'Webcam', 60.00),
(11, 'Laptop', 1100.00),
(12, 'Smartphone', 750.00),
(13, 'Tablet', 420.00),
(14, 'Monitor', 220.00),
(15, 'Keyboard', 55.00),
(16, 'Mouse', 35.00),
(17, 'Printer', 160.00),
(18, 'Headphones', 120.00),
(19, 'Speakers', 90.00),
(20, 'Webcam', 65.00),
(21, 'Laptop', 1300.00),
(22, 'Smartphone', 850.00),
(23, 'Tablet', 380.00),
(24, 'Monitor', 210.00),
(25, 'Keyboard', 60.00),
(26, 'Mouse', 40.00),
(27, 'Printer', 170.00),
(28, 'Headphones', 130.00),
(29, 'Speakers', 95.00),
(30, 'Webcam', 70.00),
(31, 'Laptop', 1400.00),
(32, 'Smartphone', 900.00),
(33, 'Tablet', 430.00),
(34, 'Monitor', 230.00),
(35, 'Keyboard', 65.00),
(36, 'Mouse', 45.00),
(37, 'Printer', 180.00),
(38, 'Headphones', 140.00),
(39, 'Speakers', 100.00),
(40, 'Webcam', 75.00)

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)
INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity) VALUES
(1, 1, 2, '2023-01-15', 2),
(2, 2, 3, '2023-01-20', 1),
(3, 3, 5, '2023-02-15', 3),
(4, 4, 8, '2023-02-18', 1),
(5, 5, 6, '2023-03-10', 4),
(6, 6, 7, '2023-03-12', 2),
(7, 7, 9, '2023-03-20', 1),
(8, 8, 1, '2023-04-05', 1),
(9, 9, 4, '2023-04-10', 2),
(10, 10, 10, '2023-04-15', 1),
(11, 11, 3, '2023-05-01', 2),
(12, 12, 6, '2023-05-03', 1),
(13, 13, 2, '2023-05-10', 1),
(14, 14, 8, '2023-06-01', 3),
(15, 15, 5, '2023-06-02', 2),
(16, 16, 7, '2023-06-15', 2),
(17, 17, 9, '2023-06-20', 1),
(18, 18, 4, '2023-07-01', 3),
(19, 19, 1, '2023-07-05', 1),
(20, 20, 10, '2023-07-10', 1),
(21, 21, 6, '2023-08-01', 2),
(22, 22, 2, '2023-08-03', 3),
(23, 23, 3, '2023-08-10', 1),
(24, 24, 5, '2023-09-01', 1),
(25, 25, 7, '2023-09-05', 2),
(26, 26, 8, '2023-09-10', 3),
(27, 27, 4, '2023-09-15', 1),
(28, 28, 9, '2023-10-01', 1),
(29, 29, 1, '2023-10-05', 2),
(30, 30, 3, '2023-10-10', 1),
(31, 31, 6, '2023-11-01', 4),
(32, 32, 7, '2023-11-05', 3),
(33, 33, 5, '2023-11-10', 2),
(34, 34, 9, '2023-11-15', 1),
(35, 35, 8, '2023-12-01', 1),
(36, 36, 10, '2023-12-05', 2),
(37, 37, 4, '2023-12-10', 3),
(38, 38, 3, '2023-12-15', 2),
(39, 39, 2, '2023-12-20', 3),
(40, 40, 1, '2023-12-25', 1);

CREATE TABLE EmployeeDepartments (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
)
INSERT INTO EmployeeDepartments (EmployeeID, EmployeeName, DepartmentName) VALUES
(1, 'John Doe', 'HR'),
(2, 'Jane Smith', 'IT'),
(3, 'Michael Johnson', 'Sales'),
(4, 'Sarah Brown', 'Marketing'),
(5, 'David Green', 'Finance'),
(6, 'Linda White', 'IT'),
(7, 'James Black', 'Sales'),
(8, 'Emily Blue', 'HR'),
(9, 'Matthew Red', 'Marketing'),
(10, 'Olivia Yellow', 'Finance'),
(11, 'John Doe', 'Finance'),
(12, 'Jane Smith', 'Sales'),
(13, 'Michael Johnson', 'IT'),
(14, 'Sarah Brown', 'HR'),
(15, 'David Green', 'Sales'),
(16, 'Linda White', 'Marketing'),
(17, 'James Black', 'Finance'),
(18, 'Emily Blue', 'IT'),
(19, 'Matthew Red', 'HR'),
(20, 'Olivia Yellow', 'Sales'),
(21, 'John Doe', 'Marketing'),
(22, 'Jane Smith', 'HR'),
(23, 'Michael Johnson', 'Finance'),
(24, 'Sarah Brown', 'IT'),
(25, 'David Green', 'HR'),
(26, 'Linda White', 'Sales'),
(27, 'James Black', 'Marketing'),
(28, 'Emily Blue', 'Finance'),
(29, 'Matthew Red', 'HR'),
(30, 'Olivia Yellow', 'IT'),
(31, 'John Doe', 'Sales'),
(32, 'Jane Smith', 'Marketing'),
(33, 'Michael Johnson', 'HR'),
(34, 'Sarah Brown', 'Finance'),
(35, 'David Green', 'Marketing'),
(36, 'Linda White', 'HR'),
(37, 'James Black', 'IT'),
(38, 'Emily Blue', 'Finance'),
(39, 'Matthew Red', 'Sales'),
(40, 'Olivia Yellow', 'HR')

--Homework
--Easy-Level Tasks(10)
--1.
select c.CustomerName,
       o.OrderDate
from Customers c
inner join Orders o on c.CustomerID = o.CustomerID;


--2.


--3.
select p.ProductID,
       p.ProductName,
       c.CategoryName,
	   p.Price
from Products p
inner join Categories c on p.ProductID = c.CategoryID


--4.
select c.CustomerName,
       o.OrderDate
from Customers c
left join Orders o on c.CustomerID = o.CustomerID;


--5.


--6.
select p.ProductName,
       c.CategoryName
from Categories c 
cross join Products p;


--7.
select c.CustomerID,
	   c.CustomerName,
	   o.OrderID,
	   o.Orderdate,
	   c.Country,
	   o.Quantity
from Customers c
inner join Orders o on c.CustomerID = o.CustomerID;


--8.
select p.ProductID,
       p.ProductName,
	   o.Quantity
from Products p 
cross join Orders o 
where o.Quantity > 500;

--9.
select e.Name,
       d.DepartmentName
from Employees e
inner join Departments d on e.DepartmentID = d.DepartmentID;


--10.
select e.EmployeeID,
       e.Name,
	   d.DepartmentName,
	   e.Salary,
	   e.Hiredate
from Employees e
join Departments d on e.DepartmentID <> d.DepartmentID;


--Medium-Level tasks (10)
--11.
select c.CustomerName,
       sum(o.Quantity) as SumOfOrders
from Customers c
inner join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerName;


--12.
--No table


--13.
select Employees.Name,
       Departments.DepartmentName,
	   Employees.Salary
from Employees
cross join Departments
where Employees.Salary > 5000;


--14.
--No data


--15.
--No data


--16.
select p.ProductName,
       s.SaleAmount
from Products p
left join Sales s on p.ProductID = s.ProductID;


--17.
select e.Name,
       e.Salary,
	   d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where e.Salary > 4000 and DepartmentName = 'Human Resources';


--18.
select s.SaleDate,
       o.Quantity,
	   s.SaleAmount
from Sales s
join Orders o on s.SaleDate >= o.Orderdate;


--19.
--No data


--20.
--No data


--Hard-Level Tasks(10)
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100)
);
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255)
);

INSERT INTO Authors (AuthorID, Name) VALUES 
(1, 'J.K. Rowling'),
(2, 'J.R.R. Tolkien'),
(3, 'George R.R. Martin'),
(4, 'Terry Pratchett'),
(5, 'Neil Gaiman');

INSERT INTO Books (BookID, Title) VALUES 
(101, 'Harry Potter and the Sorcerers Stone'),
(102, 'The Lord of the Rings'),
(103, 'A Game of Thrones'),
(104, 'Good Omens'),
(105, 'The Colour of Magic');

select * from Authors 
select * from Books

CREATE TABLE Books_Authors (
    AuthorID INT,
    BookID INT,
    PRIMARY KEY (AuthorID, BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Books_Authors (AuthorID, BookID) VALUES 
(1, 101), -- J.K. Rowling wrote "Harry Potter"
(2, 102), -- J.R.R. Tolkien wrote "The Lord of the Rings"
(3, 103), -- George R.R. Martin wrote "A Game of Thrones"
(4, 104), -- Terry Pratchett co-wrote "Good Omens"
(5, 104), -- Neil Gaiman co-wrote "Good Omens"
(4, 105);


--21.
select a.AuthorID, a.Name, b.Title from Authors a
join  Books_Authors ba on a.AuthorID = ba.AuthorID
join Books b on b.BookID = ba.BookID;


--22.
select p.ProductName,
       c.CategoryName,
	   p.ProductID
from Products p
inner join Categories c on p.ProductID = c.CategoryID
where CategoryName != 'Electronics';


--23.
select o.ProductID,
       p.ProductName,
	   o.Quantity
from Orders o 
cross join Products p 
where o.Quantity > 100;


--24.
select e.Name,
       d.DepartmentName,
	   e.Salary,
	   e.HireDate
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
WHERE DATEDIFF(YEAR, e.HireDate, GETDATE()) > 5;


--25.
select e.Name,
       d.DepartmentName,
	   e.Salary
from Employees e 
inner join Departments d on e.DepartmentID = d.DepartmentID

select e.Name,
       d.DepartmentName,
	   e.Salary
from Employees e 
left join Departments d on e.DepartmentID = d.DepartmentID;


--26.
--No data


--27.
select c.CustomerName,
       o.CustomerID,
	   c.Country,
	   o.Quantity
from Customers c 
inner join Orders o on c.CustomerID = o.CustomerID
where o.Quantity >= 10;


--28.
--No data


--29.
select e.Name,
       d.DepartmentName,
	   d.DepartmentID,
	   e.Salary
from Employees e 
left join Departments d on e.DepartmentID = d.DepartmentID
where DepartmentName = 'Marketing';


--30.
select s.SaleDate,
       o.Quantity,
	   s.SaleAmount
from Sales s
join Orders o on s.SaleDate <= o.Orderdate;






