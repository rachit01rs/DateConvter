
-- using cast and convert
SELECT * FROM dbo.PersonalDetails
SELECT SUBSTRING('1maxrs@gmail.com',8,9)
 
CREATE TABLE emp (ID INT ,NAME NVARCHAR(50),DATEOFBIRTH DATETIME)
SELECT GETDATE() AS CURRENTDATE
SELECT *FROM dbo.emp
SELECT ID,NAME,DATEOFBIRTH, CAST(DATEOFBIRTH AS nvarchar) AS convertedDOB FROM dbo.emp
SELECT ID,NAME,DATEOFBIRTH,CONVERT(nvarchar ,DATEOFBIRTH) AS convertedDOB FROM dbo.emp
CREATE TABLE RegistedDate(ID INT ,RegisteredDate DATETIME2,Total INT)
--CAST BY USING	count 
SELECT * FROM dbo.RegistedDate
SELECT CAST(RegisteredDate AS DATE) AS RegisteredDate ,COUNT(id) AS Total
FROM dbo.RegistedDate
GROUP BY CAST(RegisteredDate AS DATE)
-- print 10 random numuber is 
DECLARE @counter INT 
SELECT @counter=1
WHILE(@counter<=10)
BEGIN
    PRINT FLOOR(RAND()*100)
	SET @counter=@counter+1
END
-- scalar function 

CREATE FUNCTION CalculateAge(@DOB  DATE) 
RETURNS INT 
AS
BEGIN
DECLARE @Age INT
SET @DOB='08/12/1990'
SET @Age =DATEDIFF(YEAR,@DOB,GETDATE()) -
   CASE
		WHEN (MONTH (@DOB)>  MONTH (GETDATE ())) OR
		     (MONTH (@DOB)= MONTH (GETDATE ())  AND DAY (@DOB) >DAY (GETDATE ()))
	
	THEN 1 
	ELSE 0
	END 
SELECT @Age
END
    