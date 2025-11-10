$StorageAccountName = "storageaccountnamevalue"
$StorageAccountKey = "storageaccountkeyvalue"
$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
$ContainerName = "sql02-20190627"
New-AzureStorageContainer -Name $ContainerName -Context $ctx -Permission Blob
$localFileDirectory = "F:\"
$BlobName= "SQL02"
$localfile = $localFileDirectory + $BlobName
ls -File $localFile -Recurse | Set-AzureStorageBlobContent -Container $ContainerName -Context $ctx
