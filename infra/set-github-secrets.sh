#!/bin/bash

# This script sets GitHub repository secrets and variables using the GitHub CLI.
# Usage: ./set_github_secrets.sh <org-name> <repo-name>

# Check if the correct number of arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <org-name> <repo-name>"
    exit 1
fi

# Parameters
orgName=$1
repoName=$2

# Define the secrets
AZURE_CREDENTIALS="AddMeLater"
AZURE_CLIENT_ID="AddMeLater"
AZURE_SUBSCRIPTION_ID="AddMeLater"
AZURE_TENANT_ID="AddMeLater"

# Define the variables
AD_APP_NAME="ReplaceMeBeforeRunningScript"
AZURE_LOCATION="ReplaceMeBeforeRunningScript"
AZURE_RESOURCE_GROUP_NAME="ReplaceMeBeforeRunningScript"
BRANCH="ReplaceMeBeforeRunningScript"
ORG="ReplaceMeBeforeRunningScript"
REPO="ReplaceMeBeforeRunningScript"
WEB_APP_NAME="ReplaceMeBeforeRunningScript"

# Set the GitHub repo action secret for AZURE_CREDENTIALS
echo "Setting GitHub repo action secret AZURE_CREDENTIALS..."
gh secret set AZURE_CREDENTIALS --body "$AZURE_CREDENTIALS" --repo $orgName/$repoName
if [ $? -ne 0 ]; then
    echo "Failed to set the GitHub repo action secret AZURE_CREDENTIALS."
    exit 1
fi

# Set the GitHub repo action secret for AZURE_CLIENT_ID
echo "Setting GitHub repo action secret AZURE_CLIENT_ID..."
gh secret set AZURE_CLIENT_ID --body "$AZURE_CLIENT_ID" --repo $orgName/$repoName
if [ $? -ne 0 ]; then
    echo "Failed to set the GitHub repo action secret AZURE_CLIENT_ID."
    exit 1
fi

# Set the GitHub repo action secret for AZURE_SUBSCRIPTION_ID
echo "Setting GitHub repo action secret AZURE_SUBSCRIPTION_ID..."
gh secret set AZURE_SUBSCRIPTION_ID --body "$AZURE_SUBSCRIPTION_ID" --repo $orgName/$repoName
if [ $? -ne 0 ]; then
    echo "Failed to set the GitHub repo action secret AZURE_SUBSCRIPTION_ID."
    exit 1
fi

# Set the GitHub repo action secret for AZURE_TENANT_ID
echo "Setting GitHub repo action secret AZURE_TENANT_ID..."
gh secret set AZURE_TENANT_ID --body "$AZURE_TENANT_ID" --repo $orgName/$repoName
if [ $? -ne 0 ]; then
    echo "Failed to set the GitHub repo action secret AZURE_TENANT_ID."
    exit 1
fi

# Set the GitHub repo action variable for AD_APP_NAME
echo "Setting GitHub repo action variable AD_APP_NAME..."
gh variable set AD_APP_NAME --body "$AD_APP_NAME" --repo $orgName/$repoName
if [ $? -ne 0 ]; then
    echo "Failed to set the GitHub repo action variable AD_APP_NAME."
    exit 1
fi

# Set the GitHub repo action variable for AZURE_LOCATION
echo "Setting GitHub repo action variable AZURE_LOCATION..."
gh variable set AZURE_LOCATION --body "$AZURE_LOCATION" --repo $orgName/$repoName
if [ $? -ne 0 ]; then
    echo "Failed to set the GitHub repo action variable AZURE_LOCATION."
    exit 1
fi

# Set the GitHub repo action variable for AZURE_RESOURCE_GROUP_NAME
echo "Setting GitHub repo action variable AZURE_RESOURCE_GROUP_NAME..."
gh variable set AZURE_RESOURCE_GROUP_NAME --body "$AZURE_RESOURCE_GROUP_NAME" --repo $orgName/$repoName
if [ $? -ne 0 ]; then
    echo "Failed to set the GitHub repo action variable AZURE_RESOURCE_GROUP_NAME."
    exit 1
fi

# Set the GitHub repo action variable for BRANCH
echo "Setting GitHub repo action variable BRANCH..."
gh variable set BRANCH --body "$BRANCH" --repo $orgName/$repoName
if [ $? -ne 0 ]; then
    echo "Failed to set the GitHub repo action variable BRANCH."
    exit 1
fi

# Set the GitHub repo action variable for ORG
echo "Setting GitHub repo action variable ORG..."
gh variable set ORG --body "$ORG" --repo $orgName/$repoName
if [ $? -ne 0 ]; then
    echo "Failed to set the GitHub repo action variable ORG."
    exit 1
fi

# Set the GitHub repo action variable for REPO
echo "Setting GitHub repo action variable REPO..."
gh variable set REPO --body "$REPO" --repo $orgName/$repoName
if [ $? -ne 0 ]; then
    echo "Failed to set the GitHub repo action variable REPO."
    exit 1
fi

# Set the GitHub repo action variable for WEB_APP_NAME
echo "Setting GitHub repo action variable WEB_APP_NAME..."
gh variable set WEB_APP_NAME --body "$WEB_APP_NAME" --repo $orgName/$repoName
if [ $? -ne 0 ]; then
    echo "Failed to set the GitHub repo action variable WEB_APP_NAME."
    exit 1
fi

echo "GitHub repo action secret and variable set successfully."