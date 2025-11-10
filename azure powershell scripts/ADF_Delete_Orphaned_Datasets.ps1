Connect-AzureRmAccount

Select-AzureRmSubscription FEI-AZ-PRODUCTION-1

Get-AzureRmDataFactoryV2 -ResourceGroupName feipeu2-dataservices-azuredatafactory-rg-001 -Name FEI-ADF-DCMGMT  | Get-AzureRmDataFactoryV2Dataset |Remove-AzureRmDataFactoryV2Dataset -Force