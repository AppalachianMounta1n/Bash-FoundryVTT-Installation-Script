#!/bin/bash
#Check Foundry has launched correctly
pm2 list

#Save pm2 configuration so Foundry can be managed and restarted
pm2 save