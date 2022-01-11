<#
 .SYNOPSIS
    Deploys a template to Azure
#>

$subscriptionId = "46430462-954b-4968-b902-c60e2497443f" #insert your subscription ID
$resourceGroupName = "RG-SHARP-SCUS"  #provide resource group name
$resourceGroupLocation = "SouthCentralUS"  #location
$tags = @{"Category"="SHARP"; "Network"="Army"; "Project"="Training"}


# The below  file can be used if the templates are stored locally 
# $templateFilePath = "ContosoFinance-Demo-ARM\ARM-Templates\template.json"
# $parametersFilePath = "ContosoFinance-Demo-ARM\ARM-Templates\paramters.json"

#$templateFileURI = 'https://raw.template.json'
#$parametersFileURI = 'https://raw.paramters.json'


Function RegisterRP {
    Param(
        [string]$ResourceProviderNamespace
    )

    Write-Host "Registering resource provider '$ResourceProviderNamespace'";
    Register-AzResourceProvider -ProviderNamespace $ResourceProviderNamespace;
}

#******************************************************************************
# Script body
# Execution begins here
#******************************************************************************
$ErrorActionPreference = "Stop"

# sign in
#Connect-AzAccount

# select subscription
Write-Host "Selecting subscription '$subscriptionId'";
Select-AzSubscription -SubscriptionID $subscriptionId;

# Register RPs
# AZURE CLI COMMAND - Get-AzResourceProvider -ListAvailable | Select-Object ProviderNamespace, RegistrationState
$resourceProviders = @("microsoft.web");
if($resourceProviders.length) {
    Write-Host "**Registering resource providers"
    foreach($resourceProvider in $resourceProviders) {
        RegisterRP($resourceProvider);
    }
}

#Create or check for existing resource group
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if(!$resourceGroup)
{
    Write-Host "***Resource group '$resourceGroupName' does not exist. To create a new resource group, please enter a location.";
    if(!$resourceGroupLocation) {
        $resourceGroupLocation = Read-Host "resourceGroupLocation";
    }
    Write-Host "**Creating resource group '$resourceGroupName' in location '$resourceGroupLocation'";
    New-AzResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation -Tag $tags
    
}
else{
    Write-Host "***Using existing resource group '$resourceGroupName'";
}
