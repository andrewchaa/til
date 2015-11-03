##### Get the current path
```powershell
(Get-Item -Path ".\" -Verbose).FullName
```

#### String

##### Concatenation
```powershell
function getFullPath ($dir) {
	(Get-Item -Path "..\..\$dir" -Verbose).FullName
}
```

#### Website Administration

##### Check if website exists
```powershell
if (Test-Path "IIS:\Sites\Market") {
	Write-Host "Removing Market..."
	Remove-Website -Name Market
}
```

##### Remove a website
```powershell
$marketWebDir = (Get-Item -Path "..\..\MiMarketWeb" -Verbose).FullName
$marketBindings = (@{ protocol="http"; bindingInformation=":80:Market"},@{ protocol="https"; bindingInformation=":443:Market"})
Remove-Website -Name Market
New-Item iis:\Sites\Market -bindings $marketBindings -physicalPath $marketWebDir
```

