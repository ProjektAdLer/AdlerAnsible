# Provisioning Dashboards

It is not possible to let grafana directly import dashboards from grafanas dashboard repository.
They have to be downloaded as json files first.

As naming scheme i chose `dashboard-<dashboard id>-<dashboard revision>.json` to make it easy to
find the dashboard in the grafana repository and to update it.

Download a dashboard: 
```bash
id=1860
rev=37
curl -s https://grafana.com/api/dashboards/${id}/revisions/${rev}/download -o 'grafana/provisioning/dashboards/dashboard-'${id}'-'${rev}'.json'
```

[Due to a bug in grafana](https://github.com/grafana/grafana/issues/10786) it is not possible to set the variable 
through provisioning. If there are variables needing to have a value (like of the datasource):
Add a block like this
```json
{
"hide": 0,
"label": "datasource",
"name": "DS_PROMETHEUS",
"options": [],
"query": "prometheus",
"refresh": 1,
"regex": "",
"type": "datasource"
}
```

to `templating.list` in the json file.