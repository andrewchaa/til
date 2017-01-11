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


