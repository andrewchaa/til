Param(
  [string]$name1,
  [string]$name2
)

#git pull
$name = $name1 + ' ' + $name2
New-Item ./$name  -type file
#git add -A
#git commit -m "$name"
#git push
