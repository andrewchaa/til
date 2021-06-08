# Deleting things in git


### Deleting a branch

```
git branch -d fix-3987-dont-sent-email-until-advance-succeeds
git push origin -d fix-3987-dont-sent-email-until-advance-succeeds
```

### deleting a file from tracking


```
git rm --cached <file>
git rm -r --cached <directory>   //resursively
```
