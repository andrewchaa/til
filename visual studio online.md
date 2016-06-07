# Setting up a build

**Node.js app**

* npm install
* Gulp: gulpfile.js
* Azure Web App Deployment
* Web Deploy Package: $(Build.SourcesDirectory)\deploy\deploy.zip

**C# app**

* MsBuild
* Azure Web app deployment

**MsBUild**

* Solution: **\*.sln
* MSBuild Arguments: /p:DeployOnBuild=true
* Platform: $(BuildPlatform)
* Configuration: $(BuildPlatform)
* Clean: true
* Restore NuGet Packages: true

**Azure Web App Deployment**

* Web Deploy Package: ServerWeb/obj/Release/Package/ServerWeb.zip, find from the failed build's log

