$limit = (Get-Date).AddDays(-9)
$path = "F:\Staging\SRV-PRO-SQLS-02"
Get-ChildItem -Path $path -File -Recurse | where { $_.LastWriteTime -lt $limit } | Remove-Item