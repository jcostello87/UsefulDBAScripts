-view storage breakdown

select sch.name + '.' + obj.name AS [Table Name],

       sum(reserved_page_count) * 8.0 as [size in KB],

                  sum(CASE WHEN part.index_id IN( 0,1 ) THEN part.row_count ELSE 0 END) AS [Rows]

from sys.dm_db_partition_stats part

JOIN sys.objects obj ON obj.object_id = part.object_id

JOIN sys.schemas sch ON sch.schema_id = obj.schema_id

group by sch.name + '.' + obj.name

ORDER by [size in KB] DESC;
