#!/bin/bash
RG=$1
VM=$2
if [ "$RG" == "" ] || [ "$VM" == "" ]
then
    echo "syntax: $0 resourcegroup-name vm-name"
    echo 
    echo "Send the argument using this URL - http://127.0.0.1:8080/arg=myrg%20myvm01"
else
    az login
    az group create --name $RG --location southindia
    az vm create --name $VM --resource-group $RG --image UbuntuLTS --admin-username 'vmadmin' --admin-password 'R$ND0MPA%%WD'
fi