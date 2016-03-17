**NPM Package build**

* Create a build that only download and install NPM packages
* General Settings > Artifacts paths: node_modules => node_modules.zip
* The artifact will be node_module.zip
* The existing build needs to set Dependencies
* Dependencies > Artifact Dependencies
* Artifacts rules: node_modules.zip!** => node_modules (!** means unzipping the file)

The dependent build will download node_modules.zip, unzip it into a directory.
