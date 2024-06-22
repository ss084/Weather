#!/bin/bash

# Fetch the changes from Azure DevOps to ensure we have latest
git fetch --unshallow

# Pull changes from Azure DevOps if its exiting branch and have commits on it
git pull https://$AZ_USERNAME:$AZ_PAT@dev.azure.com/$AZ_ORG/Weather/_git/Weather.git

# Set Git user identity
git config --global user.email "$AZ_EMAIL"
git config --global user.name "$AZ_USERNAME"

# Add all changes into stage, commit and push to Azure DevOps
git add .
git commit -m "Sync GitHub to Azure DevOps"
git push --force https://$AZ_USERNAME:$AZ_PAT@dev.azure.com/$AZ_ORG/Weather/_git/Weather.git
