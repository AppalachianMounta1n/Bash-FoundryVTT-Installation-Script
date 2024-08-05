#!/bin/bash
#INSTALL FOUNDRY (Please modify this section as per the README)
#Download FoundryVTT
mkdir ~/foundry
wget --output-document ~/foundry/foundryvtt.zip "<download url>"

#Extract Foundry and cleanup the zip file
unzip ~/foundry/foundryvtt.zip -d ~/foundry/
rm ~/foundryu/foundryvtt.zip

#Create folder for user data
mkdir -p ~/foundryuserdata

#Test that Foundry is running successfully
cd ~
node foundry/resources/app/main.js --dataPath=/home/$USER/foundryuserdata

#CONFIGURE FOUNDRY WITH pm2
#Set Foundry to be managed by pm2 so Foundry will always be running
pm2 start "node /home/$USER/foundry/resources/app/main.js --dataPath=/home/$USER/foundryuserdata" --name foundry