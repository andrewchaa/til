### Resources

* posh-git: https://github.com/dahlbyk/posh-git


### Set up

    // support npm packages from github
    git config --global url."https://".insteadOf git://
    
    //ignore a top level directory or file
    /index.html
    /deploy

### Usages

    // show origin details
    git remote show origin
    
    // show all the remotes
    git remote -v
    
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

## Undoing stuff

### Remove a file from tracking

    git rm --cached <file>
    git rm -r --cached <directory>   //resursively

### Find and restore a deleted file

    git log --diff-filter=D --summary     // list all deleted files
    git rev-list -n 1 HEAD -- git.md
    git checkout 1a3b9633ba7829f5c00f1009648c19bcbc2965b6^ -- git.md
