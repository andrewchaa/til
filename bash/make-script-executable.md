# Make bash script executable

* Create a new text file with a .sh extension.
* Add `#!/bin/bash` to the top of it. This is necessary for the “make it executable” part.
* At the command line, run `chmod u+x YourScriptFileName.sh`

```bash
#!/bin/bash

pushd src/PostcodeApi.Apis

dotnet restore
dotnet lambda package --configuration Release --framework netcoreapp3.1 --output-package bin/Release/netcoreapp3.1/package.zip
sls deploy
popd
```

