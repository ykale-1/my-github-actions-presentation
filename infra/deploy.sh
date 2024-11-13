#!/bin/bash

# This script deploys a Bicep template to create a resource group and then creates an Azure AD App registration.
# Usage: ./deploy.sh <resource-group-name> <location> <app-name>

# Check if the correct number of arguments are passed
if [ "$#" -ne 7 ]; then
    echo "Usage: $0 <resource-group-name> <location> <ad-app-name> <org> <repo> <branch> <webappname>"
    exit 1
fi

# Parameters
resourceGroupName=$1
location=$2
adAppName=$3
org=$4
repo=$5
branch=$6
webAppName=$7


# Deploy the Bicep template to create the resource group
echo "Deploying Bicep template to create resource group..."
az deployment sub create --location $location --template-file main.bicep --parameters resourceGroupName=$resourceGroupName location=$location webappname=$webAppName
# Check if the deployment was successful
if [ $? -ne 0 ]; then
    echo "Failed to deploy the Bicep template."
    exit 1
fi

# Create the Azure AD App registration
echo "Creating Azure AD App registration..."
appId=$(az ad app create --display-name $adAppName --query appId --output tsv)

# Check if the app registration was successful
if [ $? -ne 0 ]; then
    echo "Failed to create Azure AD App registration."
    exit 1
fi

# Create a new federated credential for GitHub Actions
echo "Creating federated credential..."
az ad app federated-credential create --id $appId --parameters '{
  "name": "github-actions-presentation-2025-cred1",
  "issuer": "https://token.actions.githubusercontent.com",
  "subject": "repo:'$org'/'$repo':ref:refs/heads/'$branch'",
  "audiences": ["api://AzureADTokenExchange"]
}'

# Check if the federated credential creation was successful
if [ $? -ne 0 ]; then
    echo "Failed to create federated credential."
    exit 1
fi

echo "Deployment, Azure AD App registration, and federated credential creation completed successfully."