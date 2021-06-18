# Setting up a new M1 Mac

It's a job I often do, more than I thought I would.

## Pre-requisite

Install Rosetta 2 

    softwareupdate --install-rosetta
    

## System preferences

Enable three finger drag and drop from Accessibility

<img width="364" alt="image" src="https://user-images.githubusercontent.com/840427/122458169-6a9b9000-cfa7-11eb-9a9e-2905fbe93aa6.png">

Dock: Enable auto hiding

Display: In case of Macbook Air, choose scale > More spaces

## Tools and Applications

Application | Description
-- | --
[Azure Function Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=macos%2Ccsharp%2Cbash)
[Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
[Brew](https://brew.sh/) | The Missing Package Manager for macOS
[Docker](https://docs.docker.com/docker-for-mac/install/) | container
[Dracula theme](https://draculatheme.com/) | a nice theme
[Flameshot](https://flameshot.org/) | Screen capture
[Google Chrome](https://www.google.com/intl/en_uk/chrome/) | Browser
[iTerm](https://iterm2.com/downloads.html) | Terminal emulator
[JebTrains tools](https://www.jetbrains.com/rider/download/#section=mac) | JebBrains developer tools
[Nativefier](https://github.com/nativefier/nativefier) | turn your website into a desktop app
[Notion](https://www.notion.so/desktop) | Note-taking app
[Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
[Rectangle](https://rectangleapp.com) | Window management
[Rider](https://www.jetbrains.com/rider/download/#section=mac) | .NET IDE
[Slack](https://apps.apple.com/app/slack/id803453959) | Messenger
[VS Code](https://code.visualstudio.com/) | Versatile Code Editor
[Whatsapp](https://www.whatsapp.com/download/?lang=en) | messenger
[Zoom](https://zoom.us/download) | Video chat

## Development

Install [VS Code](https://code.visualstudio.com/) | Versatile Code Editor

Install Code in the command path: ⌘ shft p > "Install Code in the command path"

Install git

    brew install git
    
[Generate a new SSH Key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

[Adding a new SSH key to your GitHub account](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
  
Install Node

    brew install node
  
Install iTerm2 and [set up the Dracula theme](https://draculatheme.com/iterm)

Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)

Set up ohmyzsh plugins

    code ~/.zshrc
    
Install [Dracula theme](https://draculatheme.com/zsh)

    ln -s ~/github/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

Install [.NET core 3.1](https://dotnet.microsoft.com/download/dotnet/3.1)

Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

Install [Azure Function Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=macos%2Ccsharp%2Cbash)

    brew tap azure/functions
    brew install azure-functions-core-tools@3
    # if upgrading on a machine that has 2.x installed
    brew link --overwrite azure-functions-core-tools@3


## Shortcuts

Key | Description
-- | --
cmd ctrl q | lock screen
