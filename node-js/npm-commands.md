# npm commands

command | description
-- | --
npm i <package> --force | install the package ignoring version precondition.
npm i -g npm@latest | install the latest npm
npm outdated -g --depth=0 | see which global packages need to be updated
```
npm i @react-native-community/picker
npm ERR! code ERESOLVE
npm ERR! ERESOLVE unable to resolve dependency tree
npm ERR! 
npm ERR! While resolving: navienapp@0.0.1
npm ERR! Found: react@17.0.1
npm ERR! node_modules/react
npm ERR!   react@"17.0.1" from the root project
npm ERR! 
npm ERR! Could not resolve dependency:
npm ERR! peer react@"^16.0" from @react-native-community/picker@1.8.1

npm i @react-native-community/picker --force
```
