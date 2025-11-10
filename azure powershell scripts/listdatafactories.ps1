# Step 1: Login into Azure
#Connect-AzAccount
# Step 2: Iterate through each subscription
$subList = Get-AzSubscription
foreach ($subscription in $subList) {
    Select-AzSubscription -SubscriptionId $subscription.Id
    # Print subscription name in green    Write-Host "Subscription: $($subscription.Name)" -ForegroundColor Green

    # Step 3: Iterate on each Resource Group    
    $resourceGroups = Get-AzResourceGroup
    foreach ($resourceGroup in $resourceGroups) {
        # Step 4: List the Azure Data Factories in each Resource Group        
        $dataFactories = Get-AzDataFactoryV2 -ResourceGroupName $resourceGroup.ResourceGroupName -ErrorAction SilentlyContinue

        if ($dataFactories) {
            $output = "Resource Group: $($resourceGroup.ResourceGroupName), Azure Data Factories: "
            $output += ($dataFactories | ForEach-Object { $_.DataFactoryName }) -join ', '
            Write-Output $output
        }
    }
}
