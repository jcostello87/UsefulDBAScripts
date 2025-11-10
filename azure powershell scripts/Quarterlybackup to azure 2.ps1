#All files in folders
$StorageAccountName = "storageaccountnamevalue"
$StorageAccountKey = "storagekeyvalue"
$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageAccountKey
$Today = get-date -format "yyyyMMdd"
$ContainerName = "sql-02-" + $Today
New-AzureStorageContainer -Name $ContainerName -Context $ctx -Permission Blob
$localFileDirectory = "F:\"
$BlobName= "Staging"
$localfile = $localFileDirectory + $BlobName
ls -File $localFile -Recurse | Set-AzureStorageBlobContent -Container $ContainerName -Context $ctx