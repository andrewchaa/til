# Setting up a new Mac

It's a job I often do, more than I thought I would.

## Pre-requisite

Install Rosetta 2 if you are on Mac M1 Sillicon

    softwareupdate --install-rosetta
    

## System preferences

Enable three finger drag and drop from Accessibility

<img width="364" alt="image" src="https://user-images.githubusercontent.com/840427/122458169-6a9b9000-cfa7-11eb-9a9e-2905fbe93aa6.png">

Dock: Enable auto hiding

Display: In case of Macbook Air, choose scale > More spaces

Use F1, F2 as standard function key

<img width="500" alt="image" src="https://user-images.githubusercontent.com/840427/122651786-0efe0d80-d133-11eb-8f63-33d928d04370.png">

Display App Switcher on both the screens

    defaults write com.apple.Dock appswitcher-all-displays -bool true
    killall Dock

## Tools and Applications

Application | Description
-- | --
[Azure Function Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=macos%2Ccsharp%2Cbash) | Azure function core tools
[Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) | Azure CLI
[Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15)
[Azurite](https://github.com/azure/azurite) | Azure Storage Emulator
[Brew](https://brew.sh/) | The Missing Package Manager for macOS
[Cocoapods](https://cocoapods.org/) | a dependency manager for swift and Object-C Cocoa projects
[Docker](https://docs.docker.com/docker-for-mac/install/) | container
[Draw.io](https://github.com/jgraph/drawio-desktop/releases)
[Dracula theme](https://draculatheme.com/) | a nice theme
[Flameshot](https://flameshot.org/) | Screen capture
[Fork](https://git-fork.com/) | a nice git GUI
[Google Chrome](https://www.google.com/intl/en_uk/chrome/) | Browser
[iTerm](https://iterm2.com/downloads.html) | Terminal emulator
[JebTrains tools](https://www.jetbrains.com/rider/download/#section=mac) | JebBrains developer tools
[Nativefier](https://github.com/nativefier/nativefier) | turn your website into a desktop app
[Notion](https://www.notion.so/desktop) | Note-taking app
[Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) | shell
[Postman](https://www.postman.com/downloads/) | API test
[Rectangle](https://rectangleapp.com) | Window management
[Rider](https://www.jetbrains.com/rider/download/#section=mac) | .NET IDE
[Ruby](https://www.ruby-lang.org/en/documentation/installation/) | ruby language
[Serverless](https://www.serverless.com/framework/docs/getting-started/) | serverless framework
[Slack](https://apps.apple.com/app/slack/id803453959) | Messenger
[Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) | resource provisioning
[VS Code](https://code.visualstudio.com/) | Versatile Code Editor
[Whatsapp](https://www.whatsapp.com/download/?lang=en) | messenger
[yarn](https://classic.yarnpkg.com/en/docs/install#mac-stable) | a javascript package manager
[Zoom](https://zoom.us/download) | Video chat

## Development

Install [VS Code](https://code.visualstudio.com/)

Install Code in the command path: ⌘ shft p > "Install Code in the command path"

Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)

Set up ohmyzsh plugins

    code ~/.zshrc
    
Install [Dracula theme](https://draculatheme.com/zsh)

    ln -s ~/github/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

In ~/.zshrc

    ZSH_THEME="dracula"

Install iTerm2 and [set up the Dracula theme](https://draculatheme.com/iterm)

Copy iTerm in Applications directory and rename it to "iTerm (Intel)"

Open Info by doing `cmd + i` and tick on "Open using Resetta"
Now you have two shell, one for M1 Mac and the other for Intel on Resetta

Install brew on iTerm and iTerm (Intel)
They should be installed in two different locations

* arm: `/opt/homebrew`
* intel: `/usr/local/homebrew`

Create aliases for two versions of brew

    ibrew='arch -x86_64 /usr/local/bin/brew'
    mbrew='arch -arm64e /opt/homebrew/bin/brew'

Add those paths to `~/.zshrc`

    export PATH="/usr/local/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/bin:$PATH"

Install git

    brew install git
    
[Generate a new SSH Key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

[Adding a new SSH key to your GitHub account](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
  
Install Node

    brew install node
    
Install yarn package manager

    npm install --global yarn 
  
Install [.NET core 3.1](https://dotnet.microsoft.com/download/dotnet/3.1)

Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

    brew update && brew install azure-cli

Install [Azure Function Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=macos%2Ccsharp%2Cbash)

    brew tap azure/functions
    brew install azure-functions-core-tools@3
    # if upgrading on a machine that has 2.x installed
    brew link --overwrite azure-functions-core-tools@3

Install [Azurite](https://github.com/azure/azurite)

    npm install -g azurite
    azurite -s -l ~/github/azurite -d ~/github/azurite/debug.log

Install openssl

    brew install openssl
    
Then set `DYLD_LIBRARY_PATH` in the environment

    which openssl
    export DYLD_LIBRARY_PATH="/usr/local/opt/openssl@1.1/lib/"


Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)

    brew install ruby
    echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc

Install [Cocoapods](https://cocoapods.org/)

    sudo gem install cocoapods

Or

    gem install cocoapods --user-install
    
Or if it doesn't work

    gem install cocoapods cocoapods-core cocoapods-downloader --user-install
    
Then add to ~/.zshrc

    export GEM_HOME=$HOME/.gem
    export PATH=$GEM_HOME/bin:$PATH
    export PATH=/Users/andrewchaa/.gem/ruby/3.0.0/bin:$PATH

Install [Serverless](https://www.serverless.com/framework/docs/getting-started/) 

    npm install -g serverless
    
Install Python 3

    brew install python

## Shortcuts

Key | Description
-- | --
cmd ctrl q | lock screen
