#!/bin/bash

echo
read -p "Do you need to login? (y/n): " login
if [ "$login" = y ]; then
    az login 
    #select subsciption you build resource group within
    az account set --subscription 46430462-954b-4968-b902-c60e2497443f
fi

echo "Creating Resource Group"
az group create \
    --name RG-SHARP0-SCUS \
    --location southcentralus \
    --tags Project=SHARP Network=ARMY Category=Training

sleep 4
az group list -o table
echo "--------------------------------------------------"
echo "Listing all Resource Groups in subscription - Please verify your request was created"
echo "--------------------------------------------------"
read -p "Do you want to delete Resource Group just created? (y/n): " answer
if [ "$answer" = y ]; then
    echo
    echo "Deleting Resource Group.."
    # Clean up resources
    az group delete -n RG-SHARP0-SCUS
    echo
    echo "Deletion Complete"
    echo
    echo "--------------------------------------------------"
    az group list -o table
else
    echo
    echo "Enjoy"
fi
echo "-=SCRIPT END=-"
sleep 1