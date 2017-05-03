## adding a console app as webjob to the website

* make sure the file path correct, if you renamed the project folder

```json
{
  "$schema": "http://schemastore.org/schemas/json/webjobs-list.json",
  "WebJobs": [
    {
      "filePath": "../Trenbe.Monitors.JobMonitor/Trenbe.Monitors.JobMonitor.csproj"
    }
  ]
}``
