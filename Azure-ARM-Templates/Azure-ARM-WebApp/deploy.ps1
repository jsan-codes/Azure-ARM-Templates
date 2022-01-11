<#
*** These command are in AZURE CLI 
    Run: az interactive 
    IOT avoid powershell line break reading issues
#>

<# Run Selected code only, otherwise will fail#>
az login #use device code
az account set --subscription "46430462-954b-4968-b902-c60e2497443f"
<#
Only need to run this code once to create new Resource Group
az group create --name RG-NAME --location "southcentralus"
#>



az group create --name RG-NAME-SCUS --location "southcentralus"
#Now that the RG is created, the script will deploy the webapp within the RG
az deployment group create --name webappTEST --resource-group RG-NAME-SCUS --parameters language="html" helloWorld="true" webAppName="webappName" --template-uri "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.web/app-service-docs-windows/azuredeploy.json"




az group create --name myResourceGroup --location "southcentralus" &&
az deployment group create --resource-group myResourceGroup \
--parameters language="html" helloWorld="true" webAppName="SHARPworl983" \
--template-uri "https://github.com/jsan-codes/Azure-ARM-Templates/blob/master/Azure-ARM-Templates/Azure-ARM-WebApp/ARM-Webapp/ARM-Webapp.json"

az deployment group create --resource-group myResourceGroup --parameters language="html" helloWorld="true" webAppName="SHARPworl983" --template-uri "https://github.com/jsan-codes/Azure-ARM-Templates/blob/master/Azure-ARM-Templates/Azure-ARM-WebApp/ARM-Webapp/ARM-Webapp.json"

