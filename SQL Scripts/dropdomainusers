SELECT

    'DROP USER [' + ISNULL(DP2.name, 'No members') + '];' AS DatabaseUserName

FROM sys.database_role_members AS DRM 

RIGHT OUTER JOIN sys.database_principals AS DP1 ON DRM.role_principal_id = DP1.principal_id 

LEFT OUTER JOIN sys.database_principals AS DP2  ON DRM.member_principal_id = DP2.principal_id 

WHERE DP1.type = 'R' AND DP2.name LIKE '%emailaddress.com'

ORDER BY DP1.name, ISNULL(DP2.name, 'No members');
