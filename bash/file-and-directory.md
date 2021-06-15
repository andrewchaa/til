# everything about file and directory

### Change permission

```
sudo chmod -R 755 ./3.0.0
```

755 means read and execute access for everyone and also write access for the owner of the file. When you perform chmod 755 filename command you allow everyone to read and execute the file, the owner is allowed to write to the file as well

```
sudo chown -R andrewchaa ./3.0.0
```

This will change the ownership

### Rename directory

```bash
mv ./wynwyn ./wynwynapi
```

### Copy all files into an existing directory

    cp -R Fonoa.Poc.AzureServiceBusPoc/. poc-azure-service-bus
