#### Resources

* posh-git: https://github.com/dahlbyk/posh-git


#### Settings
##### push only the current branch
```
git config --global push.default current
```

##### store git credential
```
git config credential.helper store
```

##### alias for add and commit
```
git config --global alias.add-commit '!git add -A && git commit'
git add-commit -m 'My commit message'
```

##### create a new branch
```shell
git checkout -b feature-install-script
```

#### Branching

##### Delete a branch

```
git branch -d feature-api-documentation
```
