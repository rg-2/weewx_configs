#!/bin/bash
# ~/projects/weewx_configs/deploy.sh
sudo cp weewx.conf /etc/weewx/weewx.conf
sudo cp skin.conf /etc/weewx/skins/Belchertown/skin.conf
sudo cp graphs.conf /etc/weewx/skins/Belchertown/graphs.conf
sudo cp sdr.py /etc/weewx/bin/user/sdr.py
sudo chown root:weewx /etc/weewx/weewx.conf
sudo chown root:weewx /etc/weewx/skins/Belchertown/skin.conf 
sudo chown root:weewx /etc/weewx/skins/Belchertown/graphs.conf 
sudo chown root:weewx /etc/weewx/bin/user/sdr.py
sudo systemctl restart weewx
sudo weectl report run