-- view connection errors

 

SELECT * 

FROM sys.event_log WHERE event_type = 'connection_failed' 
