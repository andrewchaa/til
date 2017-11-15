## Related resources

* posh-git: https://github.com/dahlbyk/posh-git

## Set up

### mac

```
brew install git

rm -rf ~/.ssh                // if you want to delete the existing key

ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

eval "$(ssh-agent -s)"        // start the ssh-agent in the background
Agent pid 59566


ssh-add -K ~/.ssh/id_rsa .    // Add your SSH key to the ssh-agent
                              // Use -K option to add it to Mack Keychain

pbcopy < ~/.ssh/id_rsa.pub    // Copy the SSH key to your clipboard.
```


### Windows

* download and install git
* install putty
* with puttygen, create public and private key. Save the private key. 
* open pageant and add the private key
* in the Environment variable for system, add GIT_SSH, ..plink.exe
* putty git@github.com:Trenbe/BrandBot.App.git


### Common configurations


```
// Set proxy, if you are behind a proxy server
git config --global http.proxy http://webproxy.intra.gsacapital.com:3128

// on windows, to cache credential
git config --global credential.helper wincred

// on windows, convert to CR LF automatically
git config --global core.autocrlf true

// disable crlf fatal warning
git config core.autocrlf false
git config core.safecrlf false

git config --global push.default current


```

#### p4merge

```
$ git config --global --add difftool.prompt false
$ git config --global merge.tool p4mergetool
$ git config --global mergetool.p4mergetool.cmd \
"/Applications/p4merge.app/Contents/Resources/launchp4merge \$PWD/\$BASE \$PWD/\$REMOTE \$PWD/\$LOCAL \$PWD/\$MERGED"
$ git config --global mergetool.p4mergetool.trustExitCode false
$ git config --global mergetool.keepBackup false

$ git config --global diff.tool p4mergetool
$ git config --global difftool.p4mergetool.cmd \
"/Applications/p4merge.app/Contents/Resources/launchp4merge \$LOCAL \$REMOTE"
```

#### Beyond Compare 3

```
git config --global --add difftool.prompt false
git config --global diff.tool bc3
git config --global difftool.bc3.path "c:/Program Files (x86)/Beyond Compare 3/bcomp.exe"

git config --global merge.tool bc3
git config --global mergetool.bc3.path "c:/Program Files (x86)/Beyond Compare 3/bcomp.exe"
```



**alias for add and commit**
```
git config --global alias.add-commit '!git add -A && git commit'
git add-commit -m 'My commit message'
```

**See the details of the origin**
```
git remote -v
```

# Checking out

**Checking out a new branch**

```shell
git checkout -b feature-install-script
```


# Local branch

**Delete a branch**
```
git branch -d fix-3987-dont-sent-email-until-advance-succeeds
git push origin --delete fix-3987-dont-sent-email-until-advance-succeeds
```

**Rename a branch**
```
git branch -m <oldname> <newname>
```


