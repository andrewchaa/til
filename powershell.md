#### Paths

##### Get the current path
```powershell
(Get-Item -Path ".\" -Verbose).FullName
```

##### List down special folders
```powershell
[Environment+SpecialFolder]::GetNames([Environment+SpecialFolder])
```

### Get System folder path
```powershell
[Environment]::GetFolderPath("System")
```

#### String

##### Concatenation
```powershell
function getFullPath ($dir) {
	(Get-Item -Path "..\..\$dir" -Verbose).FullName
}
```

#### Website Administration

##### Create an application pool
```powershell
if (Test-Path "IIS:\AppPools\$name") {
    Remove-WebAppPool $name
}
$appPool = New-Item "IIS:\AppPools\$name"
$appPool | Set-ItemProperty -Name processModel -Value @{identityType=2}
```

* IIS Process models: http://www.iis.net/configreference/system.applicationhost/applicationpools/add/processmodel

##### Create a website
```powershell
if (Test-Path "IIS:\Sites\$name") {
Write-Host "Removing $name ..."
Remove-Website -Name $name
}
 
$dir = (Get-Item -Path "..\..\$dirName" -Verbose).FullName
$bindings = (@{ protocol="http"; bindingInformation=":80:$name"},@{ protocol="https"; bindingInformation=":443:$name"})

$website = New-Item iis:\Sites\$name -bindings $bindings -physicalPath $dir
$website | Set-ItemProperty -Name "applicationPool" -Value $name
```

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

