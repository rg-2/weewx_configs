/*
 * kiosk-extras.js
 * Kiosk-specific overrides for the Belchertown weather skin.
 * Loaded only on the kiosk page, after belchertown.js.
 */

// Number of forecast days to show on the kiosk display
var kiosk_forecast_days = 3;

// Override: after the forecast renders, trim to kiosk_forecast_days
// and adjust tile widths to fill the available space.
jQuery(document).ajaxComplete(function(event, xhr, settings) {
    if (settings.url && settings.url.indexOf("forecast.json") !== -1) {
        setTimeout(function() {
            var $tiles = jQuery(".day_forecasts .forecast-day");
            if ($tiles.length > kiosk_forecast_days) {
                $tiles.slice(kiosk_forecast_days).remove();
            }
            // Resize remaining tiles to fill the row
            jQuery(".day_forecasts .forecast-day").css({
                "flex": "0 0 calc(100% / " + kiosk_forecast_days + ")",
                "max-width": "calc(100% / " + kiosk_forecast_days + ")"
            });
        }, 100);
    }
});
