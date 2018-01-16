insert into [dbo].[student] (student_name) values('Ramesh') 

drop procedure fetchEDWData

/*--------------------CREATE PROCEDURE---------------------*/

EXEC fetchEDWData

create procedure fetchEDWData
as
BEGIN

select * from student

END

/*------------------ALTER PROCEDURE----------------------*/

ALTER procedure [dbo].[fetchEDWData]
as
BEGIN

PRINT 'Before SELECT statement';

select * from student

PRINT 'After SELECT statement';

END

/*------------------PROCEDURE with IN param------------------------*/

EXEC fetchEDWData 8


ALTER procedure [dbo].[fetchEDWData](@std_id int)
as
BEGIN

PRINT 'Before SELECT statement';

select * from student where student_id=@std_id

PRINT 'After SELECT statement';

END


/*--------------------PROCEDURE with IN and OUT param----------------------*/

declare @name VARCHAR(200)
EXEC fetchEDWData 2, @studentname=@name output
select @name

ALTER procedure [dbo].[fetchEDWData](@std_id int,@studentname VARCHAR(200)  OUT)
as
BEGIN

PRINT 'Before SELECT statement';

select @studentname=student_name from student where student_id=@std_id

PRINT 'After SELECT statement';

END



/*--------------------PROCEDURE  OUT COUNT(*) param----------------------*/

declare @count int
EXEC countData @std_count=@count output
select @count

alter procedure [dbo].[countData](@std_count int OUT)
as
BEGIN

select @std_count=count(*) from student 

END


/*--------------------PROCEDURE multiple OUT  param----------------------*/

declare @count int,@n1 varchar(20),@n2 varchar(20)
EXEC countData @std_count=@count output,@name1=@n1 output,@name2=@n2 output
select @count as Total_Count, @n1 as 'Name for id 1', @n2  as 'Name for id 2'

alter procedure [dbo].[countData](@std_count int OUT, @name1 varchar(20) out, @name2 varchar(20) out)
as
BEGIN

select @std_count=count(*) from student 
select @name1=student_name from student where student_id='1'
select @name2=student_name from student where student_id='2'

END

--try catch--------------------------------------------------

exec uspTryCatchTest


CREATE PROCEDURE uspTryCatchTest
AS
BEGIN TRY
    SELECT 1/0
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH