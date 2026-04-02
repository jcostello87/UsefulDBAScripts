-- execute command for each database

DECLARE @command varchar(1000)  

    SELECT @command = 'USE ? ALTER ROLE [db_datareader] ADD MEMBER [feit-az-supplychain-readonly]'  

    EXEC sp_MSforeachdb @command
