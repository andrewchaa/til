# Cocoapods set up

Install ruby

```
brew install ruby
```

Install Cocoapods

```
sudo gem install cocoapods
gem install rexml
```

You can encounter "LoadError - cannot load such file -- rexml/document" without rexml

Depending on the ruby version, you may have to install cocoapods without sudo. 
In that case, you will have `pod install -bash: pod: command not found` error

    gem install cocoapods --user-install
