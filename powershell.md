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

##### Create an application pool
```powershell
function createAppPool ($name) {
    if (Test-Path "IIS:\AppPools\$name") {
        Remove-WebAppPool $name
    }
    New-Item "IIS:\AppPools\$name"
}
```

##### Create a website
```powershell
function createWebsite ($name, $dirName) {
    if (Test-Path "IIS:\Sites\$name") {
        Write-Host "Removing $name ..."
        Remove-Website -Name $name
    }
 
    $dir = (Get-Item -Path "..\..\$dirName" -Verbose).FullName
	$bindings = (@{ protocol="http"; bindingInformation=":80:$name"},@{ protocol="https"; bindingInformation=":443:$name"})

	New-Item iis:\Sites\$name -bindings $bindings -physicalPath $dir	
}
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

