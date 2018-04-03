## Set up

    // Mac
    brew tap caskroom/cask
    brew cask install powershell
    brew casl reinstall powershell
    
    // Create an alias to start powershell
    open .zshrc
    alias powershell='/usr/local/microsoft/powershell/6.0.0-rc/pwsh'


## Usage

    // HTTP POST
    $postParams = @{username='me';moredata='qwerty'}
    Invoke-WebRequest -Uri http://example.com/foobar -Method POST -Body $postParams
    
    // List Environmental Variables
    Get-ChildItem Env:

    // Show the content of a file
    Get-Content .\endtoendsettings.json

    // Binding a certificate to a site on IIS
    Write-Host "Binding certificate to $($name)"
    if (Test-Path IIS:\SslBindings\0.0.0.0!443) {
      Remove-Item IIS:\SslBindings\0.0.0.0!443
    }

    Get-ChildItem cert:\LocalMachine\My | where { $_.Subject -like "*market.*" } | select -First 1 | New-Item IIS:\SslBindings\0.0.0.0!443

## Sql Server

    // Check if DB Exists
    [reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")
    $server = new-object ("Microsoft.SqlServer.Management.Smo.Server") .

    $dbExists = $FALSE
    foreach ($db in $server.databases) {
      if ($db.name -eq "Db") {
        Write-Host "Db already exists."
        $dbExists = $TRUE
      }
    }


**Create a db and a user and associate the user with a role**
```powershell
if ($dbExists -eq $FALSE) {
  $db = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Database -argumentlist $server, "Db"
  $db.Create()

  $user = "NT AUTHORITY\NETWORK SERVICE"
  $usr = New-Object -TypeName Microsoft.SqlServer.Management.Smo.User -argumentlist $db, $user
  $usr.Login = $user
  $usr.Create()

  $role = $db.Roles["db_datareader"]
  $role.AddMember($user)
}

```

**Write to console**
```powershell
Write-Host $password
```


**running powershell script from a windows batch file**
```
Powershell -ExecutionPolicy RemoteSigned -File .\add-websites.ps1
```

**Reading a file content**
```powershell
$hostPath = [Environment]::GetFolderPath("System") + "\drivers\etc\hosts"
$hostFile = Get-Content $hostPath
```

**Get the current path**
```powershell
(Get-Item -Path ".\" -Verbose).FullName
```

**List down special folders**
```powershell
[Environment+SpecialFolder]::GetNames([Environment+SpecialFolder])
```

**Get System folder path**
```powershell
[Environment]::GetFolderPath("System")
```

**Concatenation**
```powershell
function getFullPath ($dir) {
	(Get-Item -Path "..\..\$dir" -Verbose).FullName
}
```

**Check if it contains text**

```powershell
    $hostFile = Get-Content $hostPath
    $found = $hostFile | %{$_ -match $text}
    if (-Not ($found -contains $true)) {
        Add-Content $hostPath $text
    }
```

**Create an application pool**
```powershell
if (Test-Path "IIS:\AppPools\$name") {
    Remove-WebAppPool $name
}
$appPool = New-Item "IIS:\AppPools\$name"
$appPool | Set-ItemProperty -Name processModel -Value @{identityType=2}
```

* IIS Process models: http://www.iis.net/configreference/system.applicationhost/applicationpools/add/processmodel

**Create a website**
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

**Check if website exists**
```powershell
if (Test-Path "IIS:\Sites\Market") {
	Write-Host "Removing Market..."
	Remove-Website -Name Market
}
```

**Remove a website**
```powershell
$marketWebDir = (Get-Item -Path "..\..\MiMarketWeb" -Verbose).FullName
$marketBindings = (@{ protocol="http"; bindingInformation=":80:Market"},@{ protocol="https"; bindingInformation=":443:Market"})
Remove-Website -Name Market
New-Item iis:\Sites\Market -bindings $marketBindings -physicalPath $marketWebDir
```

**parameter**

```powershell
Param(
  [string]$name
)

git pull
New-Item ./$name -type file
git add -A
git commit -m "$name"
git push
```
