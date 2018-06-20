# Grafana, Graphite

* [managing boards](#managing-boards)
* [functions](#functions)

### managing boards

* groupByNode uses 0 based metric hierachy. 
* panelJson is a easy way to copy the board
* make sure you save the board before you referesh the browser

```
groupByNode(stats.timers.restauranteventsapi.$instance.*.restauranteventsapi.*.*.*.*.*.*.upper_90, 9, 'maxSeries')
```

### functions

* asPercent(divident, divisor): divide and then show the precentage
* transformNull: change null to 0. use caution, as null will be ignored by the report but 0 will be a valid value
* sumSeries: add values from different series. I had 4 series for the query. Handy for SingleStat metric
* hitCount(metric, '1h'): show hit count given the time frame

```
transformNull(
  asPercent(
    sumSeries(hitcount(stats.$Tenant.assetapi_*.app.api-asset.500.Total, '1h')), 
    sumSeries(hitcount(stats.$Tenant.assetapi_*.app.api-asset.200.{Salespeople,Devices}.*, '1h'))
  )
)
```
