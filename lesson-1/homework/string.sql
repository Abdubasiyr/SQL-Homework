--1.Data is numbers, quantities, information, graphs, measurement, observations, facts
--A database is an electronically stored, systematic collection of data that can include words, numbers, images, videos, and other types of files.
-- A database is usually controlled by a database management system (DBMS).
--A relational database defines database relationships in the form of tables. The tables are related to each other - based on data common to each.
--2. access, configure, manage, administer, and develop all components of SQL Server
--3.Windows Authentication mode and mixed mode
--4. 
create database SchoolDB
--5.
create table Students (
             StudentID INT PRIMARY KEY,
			 Name VARCHAR(50),
			 Age INT
)
--6. SQL Server is a relational database management system (RDBMS) developed by Microsoft. It is used to store, retrieve, and manage data for enterprise-level applications.
--SQL Server Management Studio (SSMS) is an integrated environment for managing any SQL infrastructure. Use SSMS to access, configure, manage, administer, and develop all components of SQL Server
--Structured query language (SQL) is a programming language for storing and processing information in a relational database. 
--7.
/* SQL commands are categorized into five main types: **DQL, DML, DDL, DCL, and TCL**. Here’s a breakdown with examples:

---

### 1. **DQL (Data Query Language)**
- **Purpose**: Used to retrieve data from a database.
- **Main Command**: `SELECT`
- **Example**:
  ```sql
  SELECT * FROM Students WHERE Age > 18;
  ```
  *Retrieves all students older than 18.*

---

### 2. **DML (Data Manipulation Language)**
- **Purpose**: Used to modify data in tables.
- **Commands**: `INSERT`, `UPDATE`, `DELETE`
- **Examples**:
  ```sql
  -- Insert a new student
  INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'John Doe', 20);
  
  -- Update a student's age
  UPDATE Students SET Age = 21 WHERE StudentID = 1;
  
  -- Delete a student record
  DELETE FROM Students WHERE StudentID = 1;
  ```
  *Modifies data within the table without changing its structure.*

---

### 3. **DDL (Data Definition Language)**
- **Purpose**: Used to define and modify database structures.
- **Commands**: `CREATE`, `ALTER`, `DROP`, `TRUNCATE`
- **Examples**:
  ```sql
  -- Create a new table
  CREATE TABLE Students (
      StudentID INT PRIMARY KEY,
      Name VARCHAR(50),
      Age INT
  );
  
  -- Add a new column
  ALTER TABLE Students ADD Gender VARCHAR(10);
  
  -- Delete the table completely
  DROP TABLE Students;
  
  -- Remove all records but keep the structure
  TRUNCATE TABLE Students;
  ```
  *Affects the schema (structure) of the database.*

---

### 4. **DCL (Data Control Language)**
- **Purpose**: Used to manage user permissions.
- **Commands**: `GRANT`, `REVOKE`
- **Examples**:
  ```sql
  -- Grant read access to a user
  GRANT SELECT ON Students TO User1;
  
  -- Revoke access from a user
  REVOKE SELECT ON Students FROM User1;
  ```
  *Controls user access and privileges.*

---

### 5. **TCL (Transaction Control Language)**
- **Purpose**: Manages transactions in SQL.
- **Commands**: `COMMIT`, `ROLLBACK`, `SAVEPOINT`
- **Examples**:
  ```sql
  BEGIN TRANSACTION;
  
  -- Try to insert a record
  INSERT INTO Students (StudentID, Name, Age) VALUES (2, 'Jane Doe', 22);
  
  -- Save changes
  COMMIT;
  
  -- Example of rollback
  BEGIN TRANSACTION;
  DELETE FROM Students WHERE Age < 18;
  ROLLBACK; -- Undo the delete operation
  ```
  *Ensures data consistency in case of errors.*

---

### ?? **Summary Table:**
| Category | Purpose | Commands |
|----------|---------|-----------|
| **DQL** | Retrieve data | `SELECT` |
| **DML** | Modify data | `INSERT`, `UPDATE`, `DELETE` |
| **DDL** | Modify structure | `CREATE`, `ALTER`, `DROP`, `TRUNCATE` |
| **DCL** | Manage permissions | `GRANT`, `REVOKE` |
| **TCL** | Manage transactions | `COMMIT`, `ROLLBACK`, `SAVEPOINT` |
*/ 

--8.
insert into Students values
(1, 'Roger', 16),
(2, 'Mark', 14),
(3, 'Alex', 17)
--9.
/* Open SSMS (SQL Server Management Studio) and connect to the SQL Server instance.

In the Object Explorer, expand Databases.

Right-click on SchoolDB, go to Tasks ? Back Up….

In the Back Up Database window:

Database: Select SchoolDB.

Backup Type: Choose Full.

Backup Destination: Click Add, then choose a path and filename (e.g., C:\Backups\SchoolDB.bak).

Click OK to start the backup. /*
