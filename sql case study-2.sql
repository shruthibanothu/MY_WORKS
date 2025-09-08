--case study - 2--
-------------------
--Creating LOCATION Table
CREATE TABLE LOCATION
(
Location_ID INT PRIMARY KEY,
City Varchar(30)
)

INSERT INTO LOCATION (Location_ID, City)
VALUES 
(122, 'New York'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston');

--Creating DEPARTMENT Table
CREATE TABLE DEPARTMENT
(
Department_Id INT PRIMARY KEY,
Name VARCHAR(40),
Location_Id INT
FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
)

INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES
(10, 'Accounting', 122),
(20, 'Sales', 124),
(30, 'Research', 123),
(40, 'Operations', 167);

--Creating JOB Table
CREATE TABLE JOB
(
Job_ID INT PRIMARY KEY,
Designation VARCHAR(30)
)

INSERT INTO JOB (Job_ID, Designation)
VALUES
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President');

--Creating EMPLOYEE Table
CREATE TABLE EMPLOYEE
(
Employee_Id INT,
Last_Name VARCHAR(30),
First_Name VARCHAR(30),
Middle_Name CHAR(1),
Job_Id INT,
[Hire Date] DATE,
Salary INT,
Comm INT,
Department_Id INT,
FOREIGN KEY (Job_Id) REFERENCES JOB(Job_ID),
FOREIGN KEY (Department_Id) REFERENCES DEPARTMENT(Department_Id)
)

INSERT INTO EMPLOYEE (Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, [Hire Date], Salary, Comm, Department_Id)
VALUES
(7369, 'Smith', 'John', 'Q', 667, '17-Dec-84', 800, NULL, 20),
(7499, 'Allen', 'Kevin', 'J', 670, '20-Feb-85', 1600, 300, 30),
(755, 'Doyle', 'Jean', 'K', 671, '04-Apr-85', 2850, NULL, 30),
(756, 'Dennis', 'Lynn', 'S', 671, '15-May-85', 2750, NULL, 30),
(757, 'Baker', 'Leslie', 'D', 671, '10-Jun-85', 2200, NULL, 40),
(7521, 'Wark', 'Cynthia', 'D', 670, '22-Feb-85', 1250, 50, 30);


--Simple Queries:
--1. List all the employee details.
SELECT * FROM EMPLOYEE;

--2. List all the department details.
SELECT * FROM DEPARTMENT;

--3. List all job details.
SELECT * FROM JOB;

--4. List all the locations.
SELECT * FROM LOCATION;

--5. List out the First Name, Last Name, Salary, Commission for all Employees.
SELECT First_Name, Last_Name, Salary, Comm FROM EMPLOYEE;

--6. List out the Employee ID, Last Name, Department ID for all employees and alias Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id".
SELECT Employee_Id AS [ID of the Employee], Last_Name AS [Name of the Employee], Department_Id AS [Dep_id] FROM EMPLOYEE;

--7. List out the annual salary of the employees with their names only.
SELECT First_Name, Salary FROM EMPLOYEE;

--WHERE Condition:
--1. List the details about "Smith".
SELECT * FROM EMPLOYEE
WHERE Last_Name = 'Smith';

--2. List out the employees who are working in department 20.
SELECT * FROM EMPLOYEE
WHERE Department_Id = 20;

--3. List out the employees who are earning salary between 2000 and 3000.
SELECT * FROM EMPLOYEE
WHERE Salary BETWEEN 2000 AND 3000;

--4. List out the employees who are working in department 10 or 20.
SELECT * FROM EMPLOYEE
WHERE Department_Id = 10 OR Department_Id = 20;

--5. Find out the employees who are not working in department 10 or 30.
SELECT * FROM EMPLOYEE
WHERE Department_Id NOT IN (10, 30);

--6. List out the employees whose name starts with 'L'.
SELECT * FROM EMPLOYEE
WHERE First_Name LIKE 'L%';

--7. List out the employees whose name starts with 'L' and ends with 'E'.
SELECT * FROM EMPLOYEE
WHERE First_Name LIKE 'L%E';

--8. List out the employees whose name length is 4 and start with 'J'.
SELECT * FROM EMPLOYEE
WHERE LEN(First_Name) = 4 AND First_Name LIKE 'J%';

--9. List out the employees who are working in department 30 and draw the salaries more than 2500.
SELECT * FROM EMPLOYEE
WHERE Department_Id = 30 AND Salary > 2500;

--10. List out the employees who are not receiving commission.
SELECT * FROM EMPLOYEE
WHERE Comm IS NULL;

--ORDER BY Clause:
--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
SELECT Employee_Id, Last_Name FROM EMPLOYEE
ORDER BY Employee_Id ASC;

--2. List out the Employee ID and Name in descending order based on salary.
SELECT Employee_Id, First_Name FROM EMPLOYEE
ORDER BY Salary DESC;

--3. List out the employee details according to their Last Name in ascending-order.
SELECT * FROM EMPLOYEE
ORDER BY Last_Name ASC;

--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
SELECT * FROM EMPLOYEE
ORDER BY Last_Name ASC, Department_Id DESC;

--GROUP BY and HAVING Clause:
--1. List out the department wise maximum salary, minimum salary and average salary of the employees.
SELECT MAX(Salary) AS MAX_SALARY, MIN(Salary) AS MIN_SALARY, AVG(Salary) AS AVG_SALARY FROM EMPLOYEE
GROUP BY Department_Id;

--2. List out the job wise maximum salary, minimum salary and average salary of the employees.
SELECT MAX(Salary) AS MAX_SALARY, MIN(Salary) AS MIN_SALARY, AVG(Salary) AS AVG_SALARY FROM EMPLOYEE
GROUP BY Job_Id;

--3. List out the number of employees who joined each month in ascending order.
SELECT DATENAME(MONTH, Hire_Date) AS Month, COUNT(*) AS Total_Employees FROM EMPLOYEE
GROUP BY DATENAME(MONTH, Hire_Date)
ORDER BY Month ASC;

--4. List out the number of employees for each month and year in ascending order based on the year and month.
SELECT YEAR(Hire_Date) AS Year, DATENAME(MONTH, Hire_Date) AS Month, COUNT(*) AS Total_Employees FROM EMPLOYEE
GROUP BY YEAR(Hire_Date), DATENAME(MONTH, Hire_Date)
ORDER BY Year ASC, Month ASC;

--5. List out the Department ID having at least four employees.
SELECT Department_Id, COUNT(First_Name) AS Total_Employees FROM EMPLOYEE
GROUP BY Department_Id
HAVING COUNT(First_Name) >= 4;

--6. How many employees joined in February month.
SELECT COUNT(*) AS Total_Employees FROM EMPLOYEE
WHERE MONTH(Hire_Date) = 2;

--7. How many employees joined in May or June month.
SELECT COUNT(*) AS Total_Employees FROM EMPLOYEE
WHERE MONTH(Hire_Date) = 5 OR MONTH(Hire_Date) = 6;

--8. How many employees joined in 1985?
SELECT COUNT(*) AS Total_Employees FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985;

--9. How many employees joined each month in 1985?
SELECT DATENAME(MONTH, Hire_Date) AS Month, COUNT(*) AS Total_Employees FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985
GROUP BY DATENAME(MONTH, Hire_Date);

--10. How many employees were joined in April 1985?
SELECT COUNT(*) AS Total_Employees FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4;

--11. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
SELECT Department_Id, COUNT(*) AS Total_Employees FROM EMPLOYEE
WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4
GROUP BY Department_ID
HAVING COUNT(*) >= 3;

--Joins:
--1. List out employees with their department names.
SELECT E.Employee_Id, E.First_Name, D.Name, E.Salary, E.Job_Id FROM EMPLOYEE E
INNER JOIN DEPARTMENT D
ON E.Department_Id = D.Department_Id;


--2. Display employees with their designations.
SELECT E.Employee_Id, E.First_Name, E.Job_Id, E.Salary, J.Designation FROM EMPLOYEE E
INNER JOIN JOB J
ON E.Job_Id = J.Job_Id;

--3. Display the employees with their department names and city.
SELECT E.Employee_Id, E.First_Name, D.Name, E.Salary, E.Job_Id, L.City FROM EMPLOYEE E
INNER JOIN DEPARTMENT D
ON E.Department_Id = D.Department_Id
INNER JOIN LOCATION L
ON D.Location_Id = L.Location_ID;

--4. How many employees are working in different departments? Display with department names.
SELECT D.Name,  COUNT(*) AS Total_Employee FROM EMPLOYEE E
INNER JOIN DEPARTMENT D
ON E.Department_Id = D.Department_Id
GROUP BY D.Name;

--5. How many employees are working in the sales department?
SELECT D.Name,  COUNT(*) AS Total_Employee FROM EMPLOYEE E
INNER JOIN DEPARTMENT D
ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Sales'
GROUP BY D.Name;

--6. Which is the department having greater than or equal to 3 employees and display the department names in ascending order.
SELECT D.Name,  COUNT(*) AS Total_Employee FROM EMPLOYEE E
INNER JOIN DEPARTMENT D
ON E.Department_Id = D.Department_Id
GROUP BY D.Name
HAVING COUNT(*) >= 3
ORDER BY D.Name ASC;

--7. How many employees are working in 'Dallas'?
SELECT L.City, COUNT(*) AS Total_Employees FROM EMPLOYEE E
INNER JOIN DEPARTMENT D
ON E.Department_Id = D.Department_Id
INNER JOIN LOCATION L
ON D.Location_Id = L.Location_ID
WHERE L.City = 'Dallas'
GROUP BY L.City;

--8. Display all employees in sales or operation departments.
SELECT E.Employee_Id, E.First_Name, E.Last_Name, E.Job_Id, D.Name FROM EMPLOYEE E
INNER JOIN DEPARTMENT D
ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Sales' OR D.Name = 'Operations';

--CONDITIONAL STATEMENT
--1. Display the employee details with salary grades. Use conditional statement to create a grade column.
SELECT *,
    CASE
        WHEN E.Salary >= 2500 THEN 'A'
        WHEN E.Salary BETWEEN 2000 AND 2499 THEN 'B'
        WHEN E.Salary BETWEEN 1000 AND 1999 THEN 'C'
        ELSE 'D'
    END AS Salary_Grade
FROM EMPLOYEE E;

--2. List out the number of employees grade wise. Use conditional statement to create a grade column.
SELECT Salary_Grade, COUNT(*) AS Number_of_Employees
FROM (
    SELECT 
        CASE
            WHEN Salary >= 2500 THEN 'A'
            WHEN Salary BETWEEN 2000 AND 2499 THEN 'B'
            WHEN Salary BETWEEN 1000 AND 1999 THEN 'C'
            ELSE 'D'
        END AS Salary_Grade
    FROM EMPLOYEE
) AS GradedEmployees
GROUP BY Salary_Grade;

--3. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
SELECT Salary_Grade, COUNT(*) AS Number_of_Employees
FROM (
    SELECT 
        CASE
            WHEN Salary >= 2500 THEN 'A'
            WHEN Salary BETWEEN 2000 AND 2499 THEN 'B'
            WHEN Salary BETWEEN 1000 AND 1999 THEN 'C'
            ELSE 'D'
        END AS Salary_Grade
    FROM EMPLOYEE
	WHERE Salary BETWEEN 2000 AND 5000
) AS GradedEmployees
GROUP BY Salary_Grade;

--Subqueries:
--1. Display the employees list who got the maximum salary.
SELECT * FROM EMPLOYEE
WHERE Salary = (SELECT MAX(Salary) FROM EMPLOYEE);

--2. Display the employees who are working in the sales department.
SELECT * FROM EMPLOYEE
WHERE Department_Id = (
SELECT Department_Id FROM DEPARTMENT
WHERE Name = 'Sales');

--3. Display the employees who are working as 'Clerk'.
SELECT * FROM EMPLOYEE
WHERE Job_Id = (
SELECT Job_Id FROM JOB
WHERE Designation = 'Clerk');

--4. Display the list of employees who are living in 'Boston'.
SELECT * FROM EMPLOYEE
WHERE Department_Id = (
SELECT Department_Id FROM DEPARTMENT
WHERE Location_Id = (
SELECT Location_ID FROM LOCATION
WHERE City = 'Boston'
)
)

--5. Find out the number of employees working in the sales department.
SELECT COUNT(*) AS Number_of_Employees FROM EMPLOYEE
WHERE Department_Id = (
SELECT Department_Id FROM DEPARTMENT
WHERE Name = 'Sales');

--6. Update the salaries of employees who are working as clerks on the basis of 10%.
UPDATE EMPLOYEE
SET Salary = Salary * 1.1
WHERE Job_Id = (
SELECT Job_ID FROM JOB
WHERE Designation = 'Clerk'
)

--7. Display the second highest salary drawing employee details.
SELECT * FROM EMPLOYEE
WHERE Salary = (
  SELECT MAX(Salary) FROM EMPLOYEE
  WHERE Salary < (
    SELECT MAX(Salary) FROM EMPLOYEE
  )
);

--8. List out the employees who earn more than every employee in department 30.
SELECT * FROM EMPLOYEE
WHERE Salary > ALL (
SELECT Salary FROM EMPLOYEE
WHERE Department_Id = 30
)

--9. Find out which department has no employees.
SELECT * FROM DEPARTMENT
WHERE Department_Id NOT IN (
  SELECT DISTINCT Department_Id FROM EMPLOYEE
);

--10. Find out the employees who earn greater than the average salary for their department.
SELECT * FROM EMPLOYEE E
WHERE Salary > (
SELECT AVG(Salary) FROM EMPLOYEE
WHERE Department_Id = E.Department_Id
)