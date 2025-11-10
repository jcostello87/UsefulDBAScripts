#set blob storage tiers
$StgAcc = "storageaccountvalue"
$StgKey = "storagekeyvalue"
$Today = get-date -format "yyyyMMdd"
$Container = "sql-02-" + $Today
$ctx = New-AzureStorageContext -StorageAccountName $StgAcc -StorageAccountKey $StgKey

#Get all the blobs in container
$blob = Get-AzureStorageBlob -Container $Container -Context $ctx

#Set tier of all the blobs to Archive
$blob.icloudblob.setstandardblobtier("Archive")
