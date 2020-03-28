#!/bin/bash

myResourceGroup="some-rg"
myAKSCluster="some-aks"

SP_ID=$(az aks show --resource-group $myResourceGroup --name $myAKSCluster

SP_SECRET=$(az ad sp credential reset --name $SP_ID --query password -o tsv)

az aks update-credentials \
    --resource-group $myResourceGroup \
    --name $myAKSCluster \
    --reset-service-principal \
    --service-principal $SP_ID \
    --client-secret $SP_SECRET
