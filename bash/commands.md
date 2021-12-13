# Bash commands

command | description
-- | --
`chmod +x YourScriptFileName.sh` | give the script execute permission
`sudo chmod -R 755 ./3.0.0` | 755 means read and execute access for everyone and also write access <br /> for the owner of the file.When you perform chmod 755 filename command  <br />you allow everyone to read and execute the file, the owner is allowed to write to the file as well
`sudo chown -R $USER 3.0.0/` | Change the ownership to the user
`cp -R AzureServiceBusPoc/. azure-service-bus` | copy all files recursively
`kill -9 15532` | kill the process by PID
`mv api-remote/ api/` | rename the directory
`lsof -i tcp:7071` | list open files. list all processes that are using the port number 7071
