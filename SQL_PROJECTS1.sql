CREATE DATABASE EMPLOYEE_DETAIL_TABLE

CREATE TABLE EmployeeDetail(
EmployeeID int,
FirstName varchar(200),
LastName varchar(200),
Salary int,
JoiningDate datetime,
Department varchar(200),
Gender varchar(200)
)

insert into EmployeeDetail(EmployeeID,FirstName,LastName,Salary,JoiningDate,Department,Gender)
values(1,'Vikas','Ahlawat',600000,'2/12/2013 11:16','IT','Male')
insert into EmployeeDetail(EmployeeID,FirstName,LastName,Salary,JoiningDate,Department,Gender)
values(2,'nikita','Jain',530000,'2/14/2013 11:16','HR','Female')
insert into EmployeeDetail(EmployeeID,FirstName,LastName,Salary,JoiningDate,Department,Gender)
values(3,'Ashish','Kumar',1000000,'2/14/2013 11:16','IT','Male')
insert into EmployeeDetail(EmployeeID,FirstName,LastName,Salary,JoiningDate,Department,Gender)
values(4,'Nikhil','Sharma',480000,'2/15/2013 11:16','HR','Male')
insert into EmployeeDetail(EmployeeID,FirstName,LastName,Salary,JoiningDate,Department,Gender)
values(5,'anish','kadian',500000,'2/16/2013 11:16','Paroll','Male')

select * from EmployeeDetail

SELECT Firstname from EmployeeDetail

SELECT UPPER(FirstName) AS "First Name" FROM EmployeeDetail

SELECT CONCAT(FirstName, ' ', LastName) AS Name FROM EmployeeDetail

SELECT * FROM EmployeeDetail WHERE FirstName = 'Vikas'

SELECT * FROM EmployeeDetail WHERE FirstName LIKE 'a%'

SELECT * FROM EmployeeDetail WHERE FirstName LIKE '%h'

SELECT * FROM EmployeeDetail WHERE FirstName BETWEEN 'a' AND 'p'

SELECT * FROM EmployeeDetail WHERE Gender LIKE '_le' AND LEN(Gender) = 4

SELECT * FROM EmployeeDetail WHERE FirstName LIKE 'A____'

SELECT * FROM EmployeeDetail WHERE FirstName LIKE '%\%%'

SELECT DISTINCT Department FROM EmployeeDetail

SELECT MAX(Salary) AS HighestSalary FROM EmployeeDetail

SELECT MIN(Salary) AS LowestSalary FROM EmployeeDetail

SELECT FORMAT(JoiningDate, 'dd MMM yyyy') AS FormattedJoiningDate FROM EmployeeDetail

SELECT FORMAT(JoiningDate, 'HH:mm:ss') AS TimePart FROM EmployeeDetail

SELECT YEAR(JoiningDate) AS JoiningYear FROM EmployeeDetail

SELECT MONTH(JoiningDate) AS JoiningMonth FROM EmployeeDetail

SELECT GETDATE() AS CurrentDate

SELECT GETUTCDATE() AS UTCDate

SELECT * FROM EmployeeDetail WHERE YEAR(JoiningDate) = 2013

SELECT * FROM EmployeeDetail WHERE MONTH(JoiningDate) = 1

SELECT COUNT(*) AS EmployeeCount FROM EmployeeDetail

SELECT TOP 1 * FROM EmployeeDetail

SELECT * FROM EmployeeDetail WHERE FirstName IN ('Vikas', 'Ashish', 'Nikhil')

SELECT RTRIM(FirstName) AS TrimmedFirstName FROM EmployeeDetail

SELECT LTRIM(FirstName) AS TrimmedFirstName FROM EmployeeDetail

SELECT FirstName, CASE WHEN Gender = 'Male' THEN 'M' ELSE 'F' END AS GenderAbbreviation FROM EmployeeDetail

SELECT CONCAT('Hello', FirstName) AS GreetedFirstName FROM EmployeeDetail

SELECT * FROM EmployeeDetail WHERE Salary > 600000

SELECT * FROM EmployeeDetail WHERE Salary < 700000

SELECT * FROM EmployeeDetail WHERE Salary BETWEEN 500000 AND 600000


------------------------------------------------------------------------------------------

create table ProjectDetail(
ProjectDetailID int,
EmployeeDetailID int,
ProjectName varchar(200)
)

insert into ProjectDetail(ProjectDetailID,EmployeeDetailID,ProjectName)
values(1,1,'Task Track')
insert into ProjectDetail(ProjectDetailID,EmployeeDetailID,ProjectName)
values(2,1,'CLP')
insert into ProjectDetail(ProjectDetailID,EmployeeDetailID,ProjectName)
values(3,1,'Survey Management')
insert into ProjectDetail(ProjectDetailID,EmployeeDetailID,ProjectName)
values(4,2,'HR Management')
insert into ProjectDetail(ProjectDetailID,EmployeeDetailID,ProjectName)
values(5,3,'Task Track')
insert into ProjectDetail(ProjectDetailID,EmployeeDetailID,ProjectName)
values(6,3,'GRS')
insert into ProjectDetail(ProjectDetailID,EmployeeDetailID,ProjectName)
values(7,3,'DDS')
insert into ProjectDetail(ProjectDetailID,EmployeeDetailID,ProjectName)
values(8,4,'HR Management')
insert into ProjectDetail(ProjectDetailID,EmployeeDetailID,ProjectName)
values(9,6,'GL Management')

select * from ProjectDetail

SELECT Department, SUM(Salary) AS TotalSalary
FROM EmployeeDetail
GROUP BY Department

SELECT Department, SUM(Salary) AS TotalSalary
FROM EmployeeDetail
GROUP BY Department
ORDER BY TotalSalary ASC

SELECT Department, SUM(Salary) AS TotalSalary
FROM EmployeeDetail
GROUP BY Department
ORDER BY TotalSalary DESC

SELECT Department, COUNT(DISTINCT Department) AS TotalDepartments, SUM(Salary) AS TotalSalary
FROM EmployeeDetail
GROUP BY Department

SELECT Department, AVG(Salary) AS AverageSalary
FROM EmployeeDetail
GROUP BY Department
ORDER BY AverageSalary ASC

SELECT Department, MAX(Salary) AS MaxSalary
FROM EmployeeDetail
GROUP BY Department
ORDER BY MaxSalary ASC

SELECT Department, MIN(Salary) AS MinSalary
FROM EmployeeDetail
GROUP BY Department
ORDER BY MinSalary ASC

SELECT Department, MIN(Salary) AS MinSalary
FROM EmployeeDetail
GROUP BY Department
ORDER BY MinSalary ASC

SELECT *
FROM EmployeeDetail
JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID

SELECT E.FirstName, P.ProjectName
FROM EmployeeDetail E
JOIN ProjectDetail P ON E.EmployeeID = P.EmployeeDetailID
ORDER BY E.FirstName

SELECT E.EmployeeID, COALESCE(P.ProjectName, '-No Project Assigned') AS ProjectName
FROM EmployeeDetail E
LEFT JOIN ProjectDetail P ON E.EmployeeID = P.EmployeeDetailID
ORDER BY E.FirstName

SELECT E.FirstName, COALESCE(P.ProjectName, '-No Project Assigned') AS ProjectName
FROM EmployeeDetail E
LEFT JOIN ProjectDetail P ON E.EmployeeID = P.EmployeeDetailID
UNION
SELECT NULL AS EmployeeName, P.ProjectName
FROM ProjectDetail P
WHERE NOT EXISTS (SELECT 1 FROM EmployeeDetail WHERE EmployeeID = P.EmployeeDetailID)
ORDER BY FirstName, ProjectName

 SELECT EmployeeDetail.FirstName, ISNULL(ProjectDetail.ProjectName, '-No Project Assigned') AS ProjectName
FROM EmployeeDetail
LEFT JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID

 SELECT EmployeeDetail.FirstName, ISNULL(ProjectDetail.ProjectName, '-No Matching Employee') AS ProjectName
FROM EmployeeDetail
LEFT JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID

 SELECT EmployeeDetail.FirstName, ProjectDetail.ProjectName
FROM EmployeeDetail
FULL JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID

SELECT EmployeeDetailID, COUNT(ProjectDetailID) AS ProjectCount
FROM ProjectDetail
GROUP BY EmployeeDetailID
HAVING COUNT(ProjectDetailID) > 1

SELECT ProjectDetailID, COUNT(EmployeeDetailID) AS EmployeeCount
FROM ProjectDetail
GROUP BY ProjectDetailID
HAVING COUNT(EmployeeDetailID) > 1

SELECT * FROM EmployeeDetail
CROSS JOIN ProjectDetail








