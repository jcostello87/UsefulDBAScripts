--search stored procedures

SELECT DISTINCT obj.Name Storedprocedurename 

FROM syscomments sc  

INNER JOIN sysobjects obj ON sc.Id = obj.ID  

WHERE sc.TEXT LIKE '%tblFuture_Forecast_Header%'

OR   sc.TEXT LIKE '%tblFuture_Forecast_Details%'

OR  sc.TEXT LIKE '%tblFuture_Forecast_Control_Forms%'

OR sc.TEXT LIKE '%tblFuture_Forecast_Output_Whse_Vision%'

OR sc.TEXT LIKE '%tblFuture_Forecast_Control_Whse%'

OR sc.TEXT LIKE '%tblFuture_Forecast_MPV%'

OR sc.TEXT LIKE '%tvCurrentGPH%'

OR sc.TEXT LIKE '%tblFuture_Forecast_Details%'

AND TYPE = 'P' 

--look for columns

select * from INFORMATION_SCHEMA.columns where column_name = 'Whse'

 

--look for indexes

select top 100

i.name as indexName,c.name as columnName, i.type_desc

from sys.indexes i

inner join sys.index_columns ic on i.object_id= ic.object_id and i.index_id=ic.index_id

inner join sys.columns c on ic.object_id=c.object_id ANd ic.column_id = c.column_id

WHERE c.name like '%request_id%'
