use Lesson5


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    StockQuantity INT
)

INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(1, 'Laptop', 'Electronics', 999.99, 50),
(2, 'Smartphone', 'Electronics', 799.99, 100),
(3, 'Tablet', 'Electronics', 499.99, 200),
(4, 'Wireless Mouse', 'Electronics', 29.99, 500),
(5, 'Keyboard', 'Electronics', 49.99, 300),
(6, 'Monitor', 'Electronics', 199.99, 150),
(7, 'Headphones', 'Electronics', 89.99, 400),
(8, 'Smartwatch', 'Electronics', 159.99, 50),
(9, 'Camera', 'Electronics', 499.99, 75),
(10, 'Smart TV', 'Electronics', 699.99, 30),
(11, 'Sofa', 'Furniture', 299.99, 20),
(12, 'Dining Table', 'Furniture', 399.99, 15),
(13, 'Office Chair', 'Furniture', 99.99, 50),
(14, 'Bookshelf', 'Furniture', 129.99, 35),
(15, 'Lamp', 'Furniture', 29.99, 60),
(16, 'Bed', 'Furniture', 499.99, 10),
(17, 'Refrigerator', 'Appliances', 799.99, 25),
(18, 'Washing Machine', 'Appliances', 699.99, 20),
(19, 'Air Conditioner', 'Appliances', 599.99, 10),
(20, 'Microwave', 'Appliances', 99.99, 100),
(21, 'Jacket', 'Clothing', 79.99, 100),
(22, 'Jeans', 'Clothing', 49.99, 150),
(23, 'T-Shirt', 'Clothing', 19.99, 200),
(24, 'Sweater', 'Clothing', 39.99, 120),
(25, 'Dress', 'Clothing', 59.99, 80),
(26, 'Shoes', 'Clothing', 89.99, 50),
(27, 'Boots', 'Clothing', 119.99, 60),
(28, 'Socks', 'Clothing', 5.99, 500),
(29, 'Scarf', 'Clothing', 14.99, 100),
(30, 'Hat', 'Clothing', 24.99, 75),
(31, 'Blender', 'Appliances', 49.99, 200),
(32, 'Toaster', 'Appliances', 29.99, 150),
(33, 'Electric Kettle', 'Appliances', 39.99, 300),
(34, 'Coffee Maker', 'Appliances', 89.99, 50),
(35, 'Hair Dryer', 'Beauty', 39.99, 120),
(36, 'Shampoo', 'Beauty', 19.99, 300),
(37, 'Conditioner', 'Beauty', 14.99, 400),
(38, 'Nail Polish', 'Beauty', 9.99, 200),
(39, 'Body Lotion', 'Beauty', 15.99, 150),
(40, 'Perfume', 'Beauty', 49.99, 60)

select [ProductName] as [Name] from Products;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20)
)

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '555-1234', '123 Elm St', 'New York', 'NY', '10001'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-2345', '456 Oak St', 'Los Angeles', 'CA', '90001'),
(3, 'Alice', 'Johnson', 'alicej@example.com', '555-3456', '789 Pine St', 'Chicago', 'IL', '60601'),
(4, 'Bob', 'Brown', 'bobbrown@example.com', '555-4567', '101 Maple St', 'Houston', 'TX', '77001'),
(5, 'Charlie', 'Davis', 'charliedavis@example.com', '555-5678', '202 Birch St', 'Phoenix', 'AZ', '85001'),
(6, 'David', 'Martinez', 'davidm@example.com', '555-6789', '303 Cedar St', 'San Diego', 'CA', '92101'),
(7, 'Emily', 'Garcia', 'emilyg@example.com', '555-7890', '404 Redwood St', 'Dallas', 'TX', '75201'),
(8, 'Frank', 'Hernandez', 'frankh@example.com', '555-8901', '505 Willow St', 'Austin', 'TX', '73301'),
(9, 'Grace', 'Lopez', 'gracel@example.com', '555-9012', '606 Aspen St', 'Miami', 'FL', '33101'),
(10, 'Helen', 'Gonzalez', 'heleng@example.com', '555-0123', '707 Fir St', 'San Francisco', 'CA', '94101'),
(11, 'Irene', 'Perez', 'irenep@example.com', '555-1234', '808 Maple Ave', 'Seattle', 'WA', '98101'),
(12, 'Jack', 'Wilson', 'jackw@example.com', '555-2345', '909 Oak Ave', 'Denver', 'CO', '80201'),
(13, 'Kim', 'Anderson', 'kima@example.com', '555-3456', '111 Pine Ave', 'Boston', 'MA', '02101'),
(14, 'Liam', 'Thomas', 'liamt@example.com', '555-4567', '222 Cedar Ave', 'Atlanta', 'GA', '30301'),
(15, 'Megan', 'Taylor', 'megant@example.com', '555-5678', '333 Redwood Ave', 'Washington', 'DC', '20001'),
(16, 'Nathan', 'Moore', 'nathanm@example.com', '555-6789', '444 Willow Ave', 'Detroit', 'MI', '48201'),
(17, 'Olivia', 'Jackson', 'oliviaj@example.com', '555-7890', '555 Birch Ave', 'Portland', 'OR', '97201'),
(18, 'Paul', 'White', 'paulw@example.com', '555-8901', '666 Maple Blvd', 'Minneapolis', 'MN', '55101'),
(19, 'Quincy', 'Lee', 'quincyl@example.com', '555-9012', '777 Oak Blvd', 'Charlotte', 'NC', '28201'),
(20, 'Rachel', 'Harris', 'rachelh@example.com', '555-0123', '888 Pine Blvd', 'Las Vegas', 'NV', '89101'),
(21, 'Sam', 'Clark', 'samc@example.com', '555-1234', '999 Cedar Blvd', 'Orlando', 'FL', '32801'),
(22, 'Tina', 'Allen', 'tinaallen@example.com', '555-2345', '1010 Redwood Blvd', 'New Orleans', 'LA', '70112'),
(23, 'Ursula', 'Scott', 'ursulas@example.com', '555-3456', '1111 Willow Blvd', 'Tampa', 'FL', '33601'),
(24, 'Victor', 'Adams', 'victora@example.com', '555-4567', '1212 Birch Blvd', 'Cleveland', 'OH', '44101'),
(25, 'Walter', 'Baker', 'walterb@example.com', '555-5678', '1313 Oak Blvd', 'Columbus', 'OH', '43201'),
(26, 'Xander', 'Nelson', 'xandern@example.com', '555-6789', '1414 Cedar Blvd', 'Indianapolis', 'IN', '46201'),
(27, 'Yvonne', 'Carter', 'yvonnec@example.com', '555-7890', '1515 Maple Dr', 'Kansas City', 'MO', '64101'),
(28, 'Zane', 'Mitchell', 'zanem@example.com', '555-8901', '1616 Redwood Dr', 'Salt Lake City', 'UT', '84101'),
(29, 'Anna', 'Roberts', 'annar@example.com', '555-9012', '1717 Willow Dr', 'Birmingham', 'AL', '35203'),
(30, 'Ben', 'King', 'benk@example.com', '555-0123', '1818 Birch Dr', 'Nashville', 'TN', '37201'),
(31, 'Chloe', 'Green', 'chloeg@example.com', '555-1234', '1919 Oak Dr', 'Boulder', 'CO', '80301'),
(32, 'Daniel', 'Evans', 'daniele@example.com', '555-2345', '2020 Cedar Dr', 'Sacramento', 'CA', '94201'),
(33, 'Ella', 'Collins', 'ellac@example.com', '555-3456', '2121 Redwood Dr', 'Louisville', 'KY', '40202'),
(34, 'Finn', 'Morris', 'finnm@example.com', '555-4567', '2222 Willow St', 'Cincinnati', 'OH', '45202'),
(35, 'Grace', 'Lee', 'gracel@example.com', '555-5678', '2323 Birch St', 'Baltimore', 'MD', '21201'),
(36, 'Holly', 'Martinez', 'hollym@example.com', '555-6789', '2424 Oak St', 'St. Louis', 'MO', '63101'),
(37, 'Ian', 'Robinson', 'ianr@example.com', '555-7890', '2525 Cedar St', 'Fort Worth', 'TX', '76101'),
(38, 'Jasmine', 'Walker', 'jasminew@example.com', '555-8901', '2626 Redwood St', 'Raleigh', 'NC', '27601'),
(39, 'Kyle', 'Young', 'kyley@example.com', '555-9012', '2727 Willow St', 'Pittsburgh', 'PA', '15201'),
(40, 'Liam', 'Harris', 'liamh@example.com', '555-0123', '2828 Birch St', 'Richmond', 'VA', '23220')

select * from Customers as Client;


CREATE TABLE Products_Discontinued (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products_Discontinued (ProductID, ProductName, Price) VALUES
(21, 'DVD Player', 70.00),
(22, 'MP3 Player', 50.00),
(23, 'CRT Monitor', 100.00),
(24, 'Fax Machine', 120.00),
(25, 'Pager', 30.00),
(26, 'VCR', 90.00),
(27, 'Blackberry Phone', 150.00),
(28, 'MiniDisc Player', 80.00),
(29, 'Plasma TV', 600.00),
(30, 'Dot Matrix Printer', 200.00),
(31, 'Slide Projector', 250.00),
(32, 'Camcorder', 400.00),
(33, 'Floppy Disk Drive', 40.00),
(34, 'Cassette Player', 35.00),
(35, 'Typewriter', 180.00),
(36, 'Analog Camera', 220.00),
(37, 'Game Boy', 120.00),
(38, 'Handheld PDA', 175.00),
(39, 'Walkie Talkie', 90.00),
(40, 'Portable CD Player', 55.00);

select ProductName from Products
union 
select ProductName from Products_Discontinued;

select * from Products
intersect 
select * from Products_Discontinued;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)

INSERT INTO Orders VALUES
(1, 1, 2, '2024-01-10', 1, 800.00),
(2, 2, 3, '2024-01-11', 2, 800.00),
(3, 3, 4, '2024-01-12', 1, 250.00),
(4, 4, 5, '2024-01-13', 3, 150.00),
(5, 5, 6, '2024-01-14', 1, 30.00),
(6, 6, 7, '2024-01-15', 2, 300.00),
(7, 7, 8, '2024-01-16', 1, 200.00),
(8, 8, 9, '2024-01-17', 4, 40.00),
(9, 9, 10, '2024-01-18', 1, 10.00),
(10, 10, 11, '2024-01-19', 2, 360.00),
(11, 11, 12, '2024-01-20', 1, 500.00),
(12, 12, 13, '2024-01-21', 1, 25.00),
(13, 13, 14, '2024-01-22', 2, 60.00),
(14, 14, 15, '2024-01-23', 3, 135.00),
(15, 15, 16, '2024-01-24', 1, 80.00),
(16, 16, 17, '2024-01-25', 1, 60.00),
(17, 17, 18, '2024-01-26', 2, 40.00),
(18, 18, 19, '2024-01-27', 5, 50.00),
(19, 19, 20, '2024-01-28', 2, 50.00),
(20, 20, 21, '2024-01-29', 1, 60.00),
(21, 21, 22, '2024-02-01', 1, 100.00),
(22, 22, 23, '2024-02-02', 1, 15.00),
(23, 23, 24, '2024-02-03', 2, 180.00),
(24, 24, 25, '2024-02-04', 3, 15.00),
(25, 25, 26, '2024-02-05', 4, 100.00),
(26, 26, 27, '2024-02-06', 1, 450.00),
(27, 27, 28, '2024-02-07', 1, 600.00),
(28, 28, 29, '2024-02-08', 1, 500.00),
(29, 29, 30, '2024-02-09', 2, 240.00),
(30, 30, 31, '2024-02-10', 1, 350.00),
(31, 31, 32, '2024-02-11', 1, 450.00),
(32, 32, 33, '2024-02-12', 1, 40.00),
(33, 33, 34, '2024-02-13', 2, 100.00),
(34, 34, 35, '2024-02-14', 3, 120.00),
(35, 35, 36, '2024-02-15', 1, 60.00),
(36, 36, 37, '2024-02-16', 1, 35.00),
(37, 37, 38, '2024-02-17', 2, 110.00),
(38, 38, 39, '2024-02-18', 1, 40.00),
(39, 39, 40, '2024-02-19', 3, 120.00),
(40, 40, 1, '2024-02-20', 1, 1200.00)

select * from Products
union all
select * from Orders;

select distinct CustomerName, Country from Customers;


select 
    ProductID,
	ProductName,
	Category,
	Price,
	case 
	    when Price > 100 then 'High'
		when Price <= 100 then 'Low'
	end as [PriceGroup]
from Products;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE
)

INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary, HireDate) VALUES
(1, 'John Doe', 1, 55000.00, '2020-01-01'),
(2, 'Jane Smith', 2, 65000.00, '2019-03-15'),
(3, 'Mary Johnson', 3, 45000.00, '2021-05-10'),
(4, 'James Brown', 1, 60000.00, '2018-07-22'),
(5, 'Patricia Davis', 4, 70000.00, '2017-08-30'),
(6, 'Michael Miller', 2, 75000.00, '2020-12-12'),
(7, 'Linda Wilson', 3, 48000.00, '2016-11-02'),
(8, 'David Moore', 4, 85000.00, '2021-09-01'),
(9, 'Elizabeth Taylor', 1, 60000.00, '2019-05-18'),
(10, 'William Anderson', 2, 64000.00, '2020-04-10'),
(11, 'Susan Thomas', 3, 47000.00, '2017-01-25'),
(12, 'Joseph Jackson', 4, 78000.00, '2016-09-30'),
(13, 'Karen White', 1, 59000.00, '2018-06-10'),
(14, 'Steven Harris', 2, 71000.00, '2021-07-15'),
(15, 'Nancy Clark', 3, 45000.00, '2020-02-20'),
(16, 'George Lewis', 4, 80000.00, '2019-11-10'),
(17, 'Betty Lee', 1, 55000.00, '2017-04-05'),
(18, 'Samuel Walker', 2, 72000.00, '2021-03-22'),
(19, 'Helen Hall', 3, 49000.00, '2018-10-16'),
(20, 'Charles Allen', 4, 90000.00, '2015-08-11'),
(21, 'Betty Young', 1, 53000.00, '2020-05-17'),
(22, 'Frank King', 2, 67000.00, '2021-02-02'),
(23, 'Deborah Scott', 3, 47000.00, '2019-07-09'),
(24, 'Matthew Green', 4, 76000.00, '2021-01-15'),
(25, 'Sandra Adams', 1, 54000.00, '2020-06-21'),
(26, 'Paul Nelson', 2, 71000.00, '2018-12-03'),
(27, 'Margaret Carter', 3, 46000.00, '2020-08-19'),
(28, 'Anthony Mitchell', 4, 82000.00, '2021-04-10'),
(29, 'Lisa Perez', 1, 60000.00, '2021-03-05'),
(30, 'Christopher Roberts', 2, 69000.00, '2019-09-24'),
(31, 'Jessica Gonzalez', 3, 47000.00, '2017-12-13'),
(32, 'Brian Moore', 4, 85000.00, '2018-11-05'),
(33, 'Dorothy Evans', 1, 59000.00, '2019-06-11'),
(34, 'Matthew Carter', 2, 70000.00, '2020-01-29'),
(35, 'Rachel Martinez', 3, 51000.00, '2021-06-06'),
(36, 'Daniel Perez', 4, 83000.00, '2021-07-01'),
(37, 'Catherine Roberts', 1, 60000.00, '2020-09-19'),
(38, 'Ronald Murphy', 2, 68000.00, '2017-02-04'),
(39, 'Angela Jenkins', 3, 52000.00, '2018-04-23'),
(40, 'Gary Wright', 4, 87000.00, '2021-01-10')

select Country, count(*) as EmployeeCount 
from Employees
where Department = 'Sales'
group by Country;


SELECT Category, COUNT(ProductID) AS ProductCount  
FROM Products  
GROUP BY Category;


select 
    ProductName,
	Category,
	Price,
	StockQuantity,
	iif(StockQuantity > 100, 'Yes', 'No') as StockCategory
from Products;

select * from Orders
inner join Customers 
on Orders.OrderID = Customers.CustomerID

select * from Products
except
select * from Products_Discontinued;

select ProductName from Products 
union 
Select ProductName from Products_Discontinued;

select OrderID,
    CustomerID,
    ProductID,
    OrderDate,
    Quantity,
    TotalAmount,
	case 
	    when Quantity >= 5 then 'Eligible'
		else 'Not Eligible'
	end as [AssignColumn]
from Orders;


select *,
     iif(Price > 100, 'Expensive', 'Affordable') as ConditionalColumn
from Products;


select *,
    iif(Salary > 6000, 'Found',
	   iif(Age < 25, 'Found', 'Not Found') as EmployeesS
from Employees;


	   





