#!/bin/bash 
 
echo "on-create start" >> ~/status
 
# install dapr cli
wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash
 
# initialize dapr
dapr init

# log into azure cli
az login --service-principal -t $TENANT -u $APPID -p $PASSWORD

# set the subscription
az account set -s $SUBID

# set defaults
az config set core.output=table

# install PowerShell modules
pwsh -Command "& {Install-Module -Name Trackyon.Utils, VSTeam -Force}"
 
echo "on-create complete" >> ~/status