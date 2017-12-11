# Resources

* posh-git: https://github.com/dahlbyk/posh-git


# Settings
**push only the current branch**
```
git config --global push.default current
```

**store git credential**
```
git config credential.helper store
```

**alias for add and commit**
```
git config --global alias.add-commit '!git add -A && git commit'
git add-commit -m 'My commit message'
```

**See the details of the origin**
```
git remote show origin
```

# Checking out

**Checking out a new branch**

```shell
git checkout -b feature-install-script
```

# Remote branch

**Checking out remote branch**

```shell
git fetch
git checkout -b booking origin/booking
```

**delete**

```shell
git push origin --delete new-design
```

**Check remote**
```
git remote -v
```

**List remote branches**
```
git branch -a
```

**Syncing a fork**
```
git remote -v // check if you have upstream
git remote add upstream git@github.com:CorrelatorSharp/CorrelatorSharp.git // add upstream
git remove -v // check if upstream is added

git fetch upstream // fetch the branch from the upstream repository
git checkout master // checkout your fork's master
git merge upstream/master // merge upstream/master
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

## Undoing stuff

### Remove a file from tracking

    git rm --cached <file>
    git rm -r --cached <directory>   //resursively

### Find and restore a deleted file

    git rev-list -n 1 HEAD -- git.md
    git checkout 1a3b9633ba7829f5c00f1009648c19bcbc2965b6^ -- git.md
