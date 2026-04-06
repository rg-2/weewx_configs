#if $day.windrun.has_data
<div style="clear:both; text-align:center; padding-top:5px;">
    <div>Peak Gust: <span class="dailypeakgust">$day.windGust.max</span></div>
    <div>Wind Run: <span class="dailywindrun">$day.windrun.sum</span></div>
</div>
#end if
