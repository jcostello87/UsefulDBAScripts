-- drop tables from schema

SET FOREIGN_KEY_CHECKS = 0;

SET GROUP_CONCAT_MAX_LEN = 10240;

 

SELECT CONCAT('DROP TABLE IF EXISTS `', table_name, '`;')

FROM information_schema.tables

WHERE table_schema = 'your_database_name'

INTO @drop_tables;

 

PREPARE stmt FROM @drop_tables;

EXECUTE stmt;

DEALLOCATE PREPARE stmt;

 

SET FOREIGN_KEY_CHECKS = 1;

 

 

DECLARE @SqlStatement NVARCHAR(MAX)

SELECT @SqlStatement =

    COALESCE(@SqlStatement, N'') + N'DROP TABLE [DBO1].' + QUOTENAME(TABLE_NAME) + N';' + CHAR(13)

FROM INFORMATION_SCHEMA.TABLES

WHERE TABLE_SCHEMA = 'DBO1' and TABLE_TYPE = 'BASE TABLE'

 

PRINT @SqlStatement
