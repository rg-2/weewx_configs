#!/bin/bash

# 1. Load local secrets
source ./secrets.sh

# 2. Define paths
WORKING_TMPL="./weewx.conf"
#LIVE_CONFIG="/etc/weewx/weewx.conf"
LIVE_CONFIG="./tests/weewx.conf" # For testing without sudo

# 3. Copy template to a temp location and swap placeholders
# Using '|' as a delimiter in sed in case your password has '/'
sed -e "s|STATION_ID_PLACEHOLDER|$PWS_STATION|g" \
    -e "s|PASSWORD_PLACEHOLDER|$PWS_PASS|g" \
    "$WORKING_TMPL" > ./weewx.conf.tmp

# 4. Move to live environment (requires sudo for /etc/weewx)
sudo mv ./weewx.conf.tmp "$LIVE_CONFIG"
sudo chown root:weewx "$LIVE_CONFIG"
sudo chmod 644 "$LIVE_CONFIG"

# 5. Restart WeeWX to apply changes
# sudo systemctl restart weewx
echo "Deployment complete and WeeWX restarted."
