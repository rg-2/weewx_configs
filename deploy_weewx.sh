#!/bin/bash

# 1. Load local secrets
source ./secrets.sh

# 2. Define paths
WEEWX_TMPL="./weewx.conf"
SKIN_TMPL="./skin.conf"
#LIVE_WEEWX="/etc/weewx/weewx.conf"
#LIVE_SKIN="/etc/weewx/skins/Belchertown/skin.conf"
LIVE_WEEWX="./tests/weewx.conf"       # For testing without sudo
LIVE_SKIN="./tests/skin.conf"         # For testing without sudo

# 3. Process weewx.conf - swap placeholders with secrets
# Using '|' as a delimiter in sed in case your password has '/'
sed -e "s|STATION_ID_PLACEHOLDER|$PWS_STATION|g" \
    -e "s|PASSWORD_PLACEHOLDER|$PWS_PASS|g" \
    -e "s|PIRATEWEATHER_API_ID_PLACEHOLDER|$PIRATEWEATHER_API_ID|g" \
    "$WEEWX_TMPL" > ./weewx.conf.tmp

# 4. Process skin.conf - swap placeholders with secrets
sed -e "s|PIRATEWEATHER_API_ID_PLACEHOLDER|$PIRATEWEATHER_API_ID|g" \
    -e "s|PIRATEWEATHER_API_SECRET_PLACEHOLDER|$PIRATEWEATHER_API_SECRET|g" \
    -e "s|AERIS_API_ID_PLACEHOLDER|$AERIS_API_ID|g" \
    -e "s|AERIS_API_SECRET_PLACEHOLDER|$AERIS_API_SECRET|g" \
    "$SKIN_TMPL" > ./skin.conf.tmp

# 5. Move to live environment (requires sudo for /etc/weewx)
sudo mv ./weewx.conf.tmp "$LIVE_WEEWX"
sudo chown root:weewx "$LIVE_WEEWX"
sudo chmod 644 "$LIVE_WEEWX"

sudo mv ./skin.conf.tmp "$LIVE_SKIN"
sudo chown root:weewx "$LIVE_SKIN"
sudo chmod 644 "$LIVE_SKIN"

# 6. Restart WeeWX to apply changes
# sudo systemctl restart weewx
echo "Deployment complete and WeeWX restarted."
