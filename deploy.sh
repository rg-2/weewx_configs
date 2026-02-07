#!/bin/bash
# ~/projects/weewx_configs/deploy.sh
sudo cp weewx.conf /etc/weewx/weewx.conf
sudo cp skin.conf /etc/weewx/skins/Belchertown/skin.conf
sudo cp graphs.conf /etc/weewx/skins/Belchertown/graphs.conf
sudo cp sdr.py /etc/weewx/bin/user/sdr.py
sudo chown root:weewx /etc/weewx/weewx.conf /etc/weewx/skins/Belchertown/skin.conf /etc/weewx/skins/Belchertown/graphs.conf /etc/weewx/bin/user/sdr.py
sudo weectl report run