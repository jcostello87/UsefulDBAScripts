Connect-AzAccount
$DataFactoryName= "FEI-ADF-DCMGMTDEV";$ResourceGroupName= "feideu2-supplychaindc-dcmgmt-rg-001";$triggersADF = Get-AzDataFactoryV2Trigger -DataFactoryName $DataFactoryName -ResourceGroupName $ResourceGroupName;$triggersADF | ForEach-Object { Start-AzDataFactoryV2Trigger -ResourceGroupName $ResourceGroupName -DataFactoryName $DataFactoryName -Name $_.name -Force }
