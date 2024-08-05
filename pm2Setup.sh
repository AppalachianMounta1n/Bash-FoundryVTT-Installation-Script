#!/bin/bash
#Install pm2 with npm
sudo npm install pm2 -g

#Install pm2 to start as the current user. Carefully review the output of this command. The output will also be captured]
pm2_output=$(pm2 startup)

#Auto-run the final line of the 'pm2 startup' output (this might work right, it might not. If it doesn't then feel free to submit an issue to the GitHub repo or even a PR to fix it)
pm2_output_command=$(echo "$pm2_output" } tail -n 1)
eval "$pm2_output_command"