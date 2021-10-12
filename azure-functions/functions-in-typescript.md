# Azure Functions in typescript

Node version matters. Function runtime v3 works best with Node 14 and raise `Did not find any initialized language workers` error on Node 16

```
inal functionDispatcher state: WorkerProcessRestarting. Initialization timed out and host is shutting down
[2021-10-11T22:36:40.085Z] Executed 'Functions.CreateCompany' (Failed, Id=b4e06a13-7d3e-4efd-b496-f5ab35fb5f8c, Duration=44820ms)
[2021-10-11T22:36:40.085Z] System.Private.CoreLib: Exception while executing function: Functions.CreateCompany. Microsoft.Azure.WebJobs.Script: Did not find any initialized language workers.
```
