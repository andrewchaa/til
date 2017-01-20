# Getting Started

## Install Git

## Configuration

```
// Set proxy, if you are behind a proxy server
git config --global http.proxy http://webproxy.intra.gsacapital.com:3128

// on windows, to cache credential
git config --global credential.helper wincred

// on windows, convert to CR LF automatically
git config --global core.autocrlf true
```

## Set up p4merge

```
$ git config --global merge.tool p4mergetool
$ git config --global mergetool.p4mergetool.cmd \
"/Applications/p4merge.app/Contents/Resources/launchp4merge \$PWD/\$BASE \$PWD/\$REMOTE \$PWD/\$LOCAL \$PWD/\$MERGED"
$ git config --global mergetool.p4mergetool.trustExitCode false
$ git config --global mergetool.keepBackup false

$ git config --global diff.tool p4mergetool
$ git config --global difftool.p4mergetool.cmd \
"/Applications/p4merge.app/Contents/Resources/launchp4merge \$LOCAL \$REMOTE"
```
