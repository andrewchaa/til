##### Get the current path
```powershell
(Get-Item -Path ".\" -Verbose).FullName
```

#### Website Administration
##### Remove a website
```powershell
Import-Module Webadministration
Remove-Website -Name Market
```
