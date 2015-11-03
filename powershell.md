##### Get the current path
```powershell
(Get-Item -Path ".\" -Verbose).FullName
```

#### Website Administration
##### Remove a website
```powershell
$marketWebDir = (Get-Item -Path "..\..\MiMarketWeb" -Verbose).FullName
$marketBindings = (@{ protocol="http"; bindingInformation=":80:Market"},@{ protocol="https"; bindingInformation=":443:Market"})
Remove-Website -Name Market
New-Item iis:\Sites\Market -bindings $marketBindings -physicalPath $marketWebDir
```
