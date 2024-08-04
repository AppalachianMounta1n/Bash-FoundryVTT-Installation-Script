#!/bin/bash

#SET UP REQUIREMENTS FOR FOUNDRY
#ensure system is prepared for further steps
sudo apt update
sudo apt upgrade -y

#Add NodeJS repo to system package manager
sudo apt install ca-certificates curl gnupg -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

#Add caddy repository to the system package manager
sudo apt install debian-keyring debian-archive-keyring apt-transport-https -y
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list

#Install NodeJS and Caddy
sudo apt update
sudo apt install nodejs caddy unzip nano -y

#Print NodeJS and NPM versions to verify installed. NodeJS should be version 18 or newer
node --version
npm --version

#Install pm2 with npm
sudo npm install pm2 -g

#Install pm2 to start as the current user. Carefully review the output of this command. The output will also be captured]
pm2_output=$(pm2 startup)

#Auto-run the final line of the 'pm2 startup' output (this might work right, it might not. If it doesn't then feel free to submit an issue to the GitHub repo or even a PR to fix it)
pm2_output_command=$(echo "$pm2_output" } tail -n 1)
eval "$pm2_output_command"

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

#Check Foundry has launched correctly
pm2 list

#Save pm2 configuration so Foundry can be managed and restarted
pm2 save