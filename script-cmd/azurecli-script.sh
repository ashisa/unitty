#!/bin/bash
if [ "$1" == ""] || [ "$2" == ""]
then
    echo "syntax: $0 resourcegroup-name vm-name"
else
    az login
    az group create --name $1 --location southindia
    az vm create --name $2 --resource-group $1 --image UbuntuLTS --admin-username 'vmadmin' --admin-password 'R$ND0MPA%%WD'
fi