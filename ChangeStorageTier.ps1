#set blob storage tiers
$StgAcc = "storageaccountnamevalue"
$StgKey = "storageaccountkeyvalue"
$Today = get-date -format "yyyyMMdd"
$Container = "sql-01-20211118"
$ctx = New-AzureStorageContext -StorageAccountName $StgAcc -StorageAccountKey $StgKey

#Get all the blobs in container
$blob = Get-AzureStorageBlob -Container $Container -Context $ctx

#Set tier of all the blobs to Archive
$blob.icloudblob.setstandardblobtier("Archive")