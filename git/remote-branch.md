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
