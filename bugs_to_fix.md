# We fixed locally but still need to merge with the main project on github
pirate weather icon bug

# We need to fix
JS bug
Belchertown JS: yAxis_softMin/yAxis_softMax uses parseInt() instead of parseFloat() in belchertown.js.tmpl line 2703-2704, truncating decimal values (e.g. 31.5 becomes 31)