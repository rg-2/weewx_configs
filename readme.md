# Trailsend Weather Station - WeeWX Configuration

Configuration files for the Trailsend Weather Station in Canton, CT, powered by [WeeWX](https://weewx.com/) weather software.

## Hardware

- **Desktop PC** running Ubuntu with WeeWX 5.2.0
- **RTL-SDR V3** USB dongle receiving 915 MHz wireless sensor data via [rtl_433](https://github.com/merbanan/rtl_433)
- **La Crosse TH3** — outdoor temperature and humidity sensor
- **La Crosse W1** — wind speed sensor
- **La Crosse R1** — rain gauge (not working :-( ))

## Skin

The web interface uses the Belchertown skin for WeeWX:

- **Original:** [poblabs/weewx-belchertown](https://github.com/poblabs/weewx-belchertown/tree/master)
- **Active fork (installed):** [uajqq/weewx-belchertown-new](https://github.com/uajqq/weewx-belchertown-new)
- **Charts documentation:** [Belchertown Charts Wiki](https://github.com/poblabs/weewx-belchertown/wiki/Belchertown-Charts-Documentation)

## Files

| File | Deployed Location | Description |
|------|-------------------|-------------|
| `weewx.conf` | `/etc/weewx/weewx.conf` | Main WeeWX configuration (station info, driver, archive interval, report settings) |
| `skin.conf` | `/etc/weewx/skins/Belchertown/skin.conf` | Belchertown skin settings (radar, forecast, labels, units, layout) |
| `graphs.conf` | `/etc/weewx/skins/Belchertown/graphs.conf` | Highcharts graph definitions for homepage, day, week, month, and year views |
| `sdr.py` | `/etc/weewx/bin/user/sdr.py` | WeeWX-SDR driver with sensor map mapping rtl_433 output to WeeWX observations |

## Deployment

Copy configs to WeeWX and regenerate reports:

```bash
./deploy.sh
```

This copies all config files, restores ownership (`root:weewx`), and runs `weectl report run` to regenerate the web interface.

To apply changes that affect data collection (e.g., `weewx.conf` or `sdr.py`), you also need to restart WeeWX:

```bash
sudo systemctl restart weewx
```

## Notes

- Changes to `skin.conf` and `graphs.conf` only require `sudo weectl report run` — no WeeWX restart needed.
- Changes to `weewx.conf` or `sdr.py` require a full `sudo systemctl restart weewx`.

- The station does not have a wind direction sensor or barometric pressure sensor. Wind direction shows as N/A; barometer is pending integration of an Ecowitt GW1100 gateway.
