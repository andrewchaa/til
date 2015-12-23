Param(
  [string]$name
)

git pull
New-Item ./$name -type file
git add -A
git commit -m "$name"
git push
