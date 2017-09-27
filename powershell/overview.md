#### command-line arguments

You can handle them in *param* section in the beginning of the file

    param (
      [string]$server = "http://defaultserver",
      [Parameter(Mandatory=$true)][string]$username,
      [string]$password = $( Read-Host "Input password, please" )
    )
    
   
