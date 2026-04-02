-- rebuild indexes > 40%

  DECLARE @index_name nvarchar(500), @table_name nvarchar(500),  @message VARCHAR(500);

 

  DECLARE index_rebuild cursor FOR

    SELECT concat('[',I.name,']') as index_name, concat (S.name,'.',T.name) table_name FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS IST

    INNER JOIN sys.tables T on T.object_id = IST.object_id INNER JOIN sys.schemas S on T.schema_id = S.schema_id

    INNER JOIN sys.indexes I ON I.object_id = IST.object_id AND IST.index_id = I.index_id

    WHERE I.name is not null AND IST.avg_fragmentation_in_percent >= 40

               AND IST.page_count >= 1000 AND IST.index_type_desc <> 'HEAP'

 

open index_rebuild

 

Fetch NEXT from index_rebuild

INTO @index_name, @table_name

 

WHILE @@FETCH_STATUS = 0

BEGIN

 

PRINT ' '

    SELECT @message = 'Rebuilding index ' + @index_name + ' on table ' + @table_name

 

    PRINT @message

 

 

declare @alter varchar(500);

set @alter = 'ALTER INDEX ' + @index_name + ' ON ' + @table_name + ' REBUILD WITH (ONLINE = ON)';

 

exec(@alter);   

 

FETCH NEXT FROM index_rebuild

INTO @index_name, @table_name

END

CLOSE index_rebuild;

DEALLOCATE index_rebuild;
