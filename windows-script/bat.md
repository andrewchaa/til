# windows batch

* [Call a batch file](#call-a-batch-file)
* [Run processes](#run-processes)


### Call a batch file

```batch
call called.bat
```

### Run processes

```batch
@echo off
cls

@RD /S /Q ..\deploy
git clone --depth=1 git@github.com:Trenbe/BrandBot.App.git ..\deploy

taskkill /IM "BrandBot.App.exe"
taskkill /IM "BrandBot.App.Link.exe"
taskkill /IM "BrandBot.Converter.Godo.exe"

cd ..\deploy
.nuget\nuget.exe restore
.\packages\FAKE.4.58.6\tools\FAKE.exe .\build.fsx

cd ..
start "BrandBot.App" "D:\\Bot\\BrandBot.App\\BrandBot.App.exe"
start "BrandBot.App.Link" "D:\\Bot\\BrandBot.App\\BrandBot.App.Link.exe"
start "BrandBot.Converter.Godo" "D:\\Bot\\BrandBot.App\\BrandBot.Converter.Godo.exe"

pause
```
