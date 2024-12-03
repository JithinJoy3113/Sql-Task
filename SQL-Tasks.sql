CREATE TABLE employeeDetails
	(empId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(), 
	empName VARCHAR(25), 
	job VARCHAR(50), 
	salary NUMERIC);

INSERT into employeeDetails 
(empName, job, salary)
values 
('Jithin', 'Software Engineer Trainee',15000),
('Dinil', 'Associate Software Engineer', 18000),
('Ram', 'Senior Software Engineer', 25000);

SELECT*FROM employeeDetails;

--cursor

DECLARE detailsCursor 
CURSOR SCROLL 
FOR 
SELECT * FROM employeeDetails;

OPEN detailsCursor;

FETCH ABSOLUTE 3 FROM detailsCursor;

close detailsCursor;

--Function

CREATE FUNCTION salaryIncrease(@Salary NUMERIC(10, 2))
RETURNS NUMERIC
AS 
BEGIN
	RETURN @Salary + 3000;
END;

SELECT dbo.salaryIncrease(salary)
AS 
	newSalary 
FROM employeeDetails;


--Procedure

CREATE PROCEDURE getDataByName
	@empName VARCHAR(25)
AS 
BEGIN
	SELECT *
	FROM employeeDetails 
	WHERE empName=@empName;
END;

EXEC getDataByName @empName = 'Ram';

--Trigger

CREATE TRIGGER IncreaseSalary ON 
	employeeDetails 
AFTER 
UPDATE 
AS 
BEGIN 
UPDATE employeeDetails
SET 
	salary=salary+2000;
END;

UPDATE employeeDetails 
SET 
	salary=salary+2000;






