#!/bin/bash

myResourceGroup="some-rg"
myAKSCluster="some-aks"

SP_ID=$(az aks show --resource-group $myResourceGroup --name $myAKSCluster \
    --query servicePrincipalProfile.clientId -o tsv)

# BE CAREFUL
# THIS CHANGE SECRET OF EXISTING SERVICE PRINCIPAL
# YOU NEED TO UPDATE THIS SECRET IN OTHER PLACES IF IT IS USED FOR AUTOMATION
# SP_SECRET=$(az ad sp credential reset --name $SP_ID --query password -o tsv)

echo -n "Enter the new SP secret:"
read SP_SECRET

az aks update-credentials \
    --resource-group $myResourceGroup 
    
    echo -e "Enter new secret:"
    read SP_SECRET
    --name $myAKSCluster \
    --reset-service-principal \
    --service-principal $SP_ID \
    --client-secret $SP_SECRET
