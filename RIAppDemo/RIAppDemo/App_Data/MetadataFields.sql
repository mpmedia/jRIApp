WITH XMLNAMESPACES ('uri' as data)
select[name] as [@fieldName],
CASE 
WHEN system_type_id=127 THEN 'Integer'
WHEN system_type_id=56 THEN 'Integer' 
WHEN system_type_id=52 THEN 'Integer' 
WHEN system_type_id=48 THEN 'Integer' 
WHEN system_type_id=175 THEN 'String' --char 
WHEN system_type_id=167 THEN 'String' --varchar
WHEN system_type_id=231 THEN 'String' --nvarchar
WHEN system_type_id=239 THEN 'String' --nchar
WHEN system_type_id=241 THEN 'String' --xml
WHEN system_type_id=104 THEN 'Bool' --BIT
WHEN system_type_id=36 THEN 'Guid' 
WHEN system_type_id=60 OR system_type_id=106 OR system_type_id=108 THEN 'Decimal' 
WHEN system_type_id=59 OR system_type_id=62 THEN 'Float' 
WHEN system_type_id=58 or system_type_id=61 or system_type_id=40 THEN 'DateTime' 
WHEN system_type_id=173 or system_type_id = 165 or system_type_id = 189 THEN 'Binary' 
ELSE CAST(system_type_id as NVARCHAR(45))
END as [@dataType]
,CASE WHEN system_type_id=231 OR system_type_id=239 THEN max_length/2
ELSE max_length END as [@maxLength], 
CASE is_nullable WHEN 1 THEN Null ELSE 'False' END  as [@isNullable], 
CASE WHEN is_identity  = 1 or system_type_id = 189  THEN 'True' 
ELSE Null END  as [@isAutoGenerated],
CASE WHEN is_identity=1 or is_computed=1 or system_type_id = 189 THEN 'True' 
ELSE Null END as [@isReadOnly],
CASE WHEN system_type_id = 189 THEN 'True'
ELSE Null END as [@isRowTimeStamp],
b.key_ordinal as [@isPrimaryKey]
from sys.columns as a OUTER APPLY 
(
 select b.key_ordinal 
 from sys.index_columns as b JOIN sys.indexes as c ON (b.index_id= c.index_id AND b.[object_id] = c.[object_id])
 where b.[object_id] = a.[object_id] AND b.column_id = a.column_id AND c.is_primary_key =1
) as b
where [object_id] =object_id('SalesLT.SalesOrderDetail')
for xml path('data:FieldInfo'), ROOT('DbSetInfo.fields')

--select * from sys.columns




