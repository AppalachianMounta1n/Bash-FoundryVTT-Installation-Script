## This Bash script just runs the commands to install and setup FoundryVTT from the wiki at https://foundryvtt.wiki/en/setup/linux-installation

## Script Order
- You must run the scripts in the following order:
1. setup.sh
2. pm2Setup.sh
3. install.sh (Use Ctrl+C to end this script after you see proof Foundry is running)
4. verify.sh (This script will verify Foundry is in the pm2 list and then save the pm2 configuration)

## Notes
- You will need to modify the script at line 39 (this is the **wget** command that downloads Foundry) to replace *"<download url>"* with the actual URL you get from clicking the **Timed URL** button on your FoundryVTT account's **Purchased Licenses** page. Make sure you're downloading the **Linux/NodeJS** version of FoundryVTT.
- This script is meant to be run on a home network server
- You will have to configure Caddy manually but hopefully you can follow the instructions on the wiki easily for that part
- Everything on the wiki from configuring Caddy onwards you will have to do manually (I didn't feel like spending the time to figure out a way to automate it, if I'm honest)