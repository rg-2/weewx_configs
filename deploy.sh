#!/bin/bash
# ~/projects/weewx_configs/deploy.sh
#sudo cp weewx.conf /etc/weewx/weewx.conf
#sudo cp skin.conf /etc/weewx/skins/Belchertown/skin.conf
sudo cp graphs.conf /etc/weewx/skins/Belchertown/graphs.conf
sudo cp kiosk.css /etc/weewx/skins/Belchertown/kiosk.css
sudo cp header.html.tmpl /etc/weewx/skins/Belchertown/header.html.tmpl
sudo cp kiosk.html.tmpl /etc/weewx/skins/Belchertown/kiosk.html.tmpl
#sudo cp kiosk-extras.js /var/www/html/weewx/kiosk-extras.js
#sudo cp sdr.py /etc/weewx/bin/user/sdr.py
#sudo chown root:weewx /etc/weewx/weewx.conf
#sudo chown root:weewx /etc/weewx/skins/Belchertown/skin.conf
sudo chown root:weewx /etc/weewx/skins/Belchertown/graphs.conf
sudo chown root:weewx /etc/weewx/skins/Belchertown/kiosk.css
sudo chown root:weewx /etc/weewx/skins/Belchertown/header.html.tmpl
sudo chown root:weewx /etc/weewx/skins/Belchertown/kiosk.html.tmpl
#sudo chown weewx:weewx /var/www/html/weewx/kiosk-extras.js
#sudo chown root:weewx /etc/weewx/bin/user/sdr.py
#vsudo systemctl restart weewx
cd / && sudo -u weewx weectl report run