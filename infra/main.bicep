// This Bicep template creates a resource group at the subscription level
// To deploy this template, use the following Azure CLI command:
// az deployment sub create --location <location> --template-file main.bicep --parameters resourceGroupName=<your-resource-group-name> location=<desired-location> webappname=<desired-app-name>

targetScope = 'subscription' // Set the deployment scope to subscription level

// Parameters
param resourceGroupName string // The name of the resource group to be created
param location string // The location for the resource group, default is 'EastUS2'
param webappname string // The name of the App Service

// Resource definition
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName // Set the name of the resource group
  location: location // Set the location of the resource group
}

// Module for App Service Plan and Web App
module appService 'appservice.bicep' = {
  name: 'appServiceDeployment'
  scope: resourceGroup
  params: {
    location: location
    appName: webappname
  }
}
