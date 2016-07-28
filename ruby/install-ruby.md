* http://stackoverflow.com/questions/18908708/installing-ruby-gem-in-windows

1. Install Ruby via RubyInstaller: http://rubyinstaller.org/downloads/
2. Check your ruby version: Start - Run - type in cmd to open a windows console
3. Type in ruby -v
4. You will get something like that: ruby 2.0.0p353 (2013-11-22) [i386-mingw32]
5. Download and install DevelopmentKit from the same download page as Ruby Installer. Choose an ?exe file corresponding to your environment (32 bits or 64 bits and working with your version of Ruby).
6. Follow the installation instructions for DevelopmentKit described at: https://github.com/oneclick/rubyinstaller/wiki/Development-Kit. Adapt it for Windows.
7. After installing DevelopmentKit you can install all needed gems by just running from the command prompt (windows console or terminal): gem install {gem name}. For example, to install rails, just run gem install rails.
