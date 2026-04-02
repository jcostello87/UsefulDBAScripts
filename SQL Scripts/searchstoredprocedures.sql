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
