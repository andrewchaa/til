# git commands

command | description
-- | --
`git branch \| grep -v "master" \| xargs git branch -D` | delete all local branches except master
`git co master -- source/graphql/yarn.lock` | revert the file with the file from the master branch
`git clone --depth 1 https://github.com/django/django.git` | shallow clone, getting the latest copy of the relevant files, saving space and time
`git config --global core.editor "code --wait"` | set VS Code as the default git editor
`git config --global --edit` | edit global config file
`git config --global --list` | list global config entries
`git fetch origin, git reset --hard origin/master` | reset local repository branch to remote repository HEAD
`git remote prune origin` | to fix `error: cannot lock ref ...`
`git reset --mixed origin/HEAD` | reset to origin/HEAD leaving files uncommitted 


### Github Personal Token

If you have enabled 2FA. 
[Create Personal Access Token](https://github.com/settings/tokens) and use it as your password

```
# merge remote master
git fetch origin
git merge origin/master
```


### Set up

```bash

// Check if ssh exists
ls -al ~/.ssh

// Start ssh agent
eval "$(ssh-agent -s)"

// Automaticaly load key into ssh-agent
open ~/.ssh/config

Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa

// Add the private key to ssh agent
ssh-add -K ~/.ssh/id_rsa

// Copy the corresponding public key and put it on github
pbcopy < ~/.ssh/id_rsa.pub

// support npm packages from github
git config --global url."https://".insteadOf git://

// ignore a top level directory or file
/index.html
/deploy

```

### Remote

```
# set upstream
git branch --set-upstream-to=origin/master master

# show origin details
git remote show origin

# show all the remotes
git remote -v
```    

### Undoing

```
# restore file that hasn't been committed
git checkout HEAD <filename>
```

    # unstage file
    git reset

    // check out and create a branch
    git checkout -b feature-install-script
    
    // checkout remote branch
    git fetch
    git checkout -b booking origin/booking

    // list all branches
    git branch -a
    
    // cherry-pick commits for PR
    git checkout -b mybranch
    git fetch upstream
    git reset --hard upstream/master
    git cherry-pick <commit-hash>
    git push origin mybranch:mybranch


    // Syncing fork

    git remote -v // check if you have upstream
    git remote add upstream git@github.com:CorrelatorSharp/CorrelatorSharp.git // add upstream
    git remove -v // check if upstream is added

    git fetch upstream // fetch the branch from the upstream repository
    git checkout master // checkout your fork's master
    git merge upstream/master // merge upstream/master


## Deletion

    // delete a branch
    git branch -d fix-3987-dont-sent-email-until-advance-succeeds
    git push -d origin fix-3987-dont-sent-email-until-advance-succeeds

    // delete a file from tracking
    git rm --cached <file>
    git rm -r --cached <directory>   //resursively

**Rename a branch**
```
git branch -m <oldname> <newname>
```

### Find and restore a deleted file

    git log --diff-filter=D --summary     // list all deleted files
    git rev-list -n 1 HEAD -- git.md
    git checkout 1a3b9633ba7829f5c00f1009648c19bcbc2965b6^ -- git.md
