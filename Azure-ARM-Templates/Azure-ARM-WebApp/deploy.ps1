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

#az group create --name myResourceGroup --location "West Europe"

az group create --name RG-NAME-SCUS --location "southcentralus"

#Now that the RG is created, the script will deploy the webapp within the RG
az deployment group create --resource-group RG-NAME-SCUS --name SHARPworl983 --template-file ARM-WebApp.json




<#
Another way of doing it
#>

az appservice plan create --name SHARP-App-Service-Plan --resource-group RG-NAME-SCUS --sku FREE --is-linux

az webapp create --resource-group RG-NAME-SCUS --plan SHARP-App-Service-Plan --name SHARPworl983 --runtime "PHP|7.4" --deployment-local-git

az webapp config appsettings set --name SHARPworl983 --resource-group RG-NAME-SCUS --settings DEPLOYMENT_BRANCH="main"

https://sharpworl983.azurewebsites.net

git remote add azure https://headspace@sharpworl983.scm.azurewebsites.net/SHARPworl983.git

git push azure main


az webapp deployment user set --user-name headspace --password RAY!earth!01




















az deployment group create --resource-group RG-NAME-SCUS --name SHARPwordl983 --template-file LinuxWebbApp.json



az deployment group create --resource-group myResourceGroup \
--parameters language="html" helloWorld="true" webAppName="SHARPworl983" \
--template-uri "https://github.com/jsan-codes/Azure-ARM-Templates/blob/master/Azure-ARM-Templates/Azure-ARM-WebApp/ARM-Webapp/LinuxWebbApp.json"

az deployment group create --resource-group myResourceGroup --parameters language="html" helloWorld="true" webAppName="SHARPworl983" --template-uri "https://github.com/jsan-codes/Azure-ARM-Templates/blob/master/Azure-ARM-Templates/Azure-ARM-WebApp/ARM-Webapp/LinuxWebbApp.json"



az deployment group create --resource-group RG-NAME-SCUS --name SHARPworl983 --template-file ARM-WebApp.json
