# Getting started with Git


### Aliases

[Set up an alias](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases) for each command if you don't want to type the entire text.

    $ git config --global alias.co checkout
    $ git config --global alias.br branch
    $ git config --global alias.ci commit
    $ git config --global alias.st status


You can edit ~/.gitconfig in the text editor

    [alias]
      # Show verbose output about tags, branches or remotes
      ci = commit
      st = status
      co = checkout
      br = branch
      tags = tag -l
      branches = branch -a
      remotes = remote -v
      # Pretty log output
      hist = log --graph --pretty=format:'%Cred%h%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)%Creset [%an]' --abbrev-commit --date=relative

    [color]
      # Use colors in Git commands that are capable of colored output when
      # outputting to the terminal. (This is the default setting in Git ≥ 1.8.4.)
      ui = auto
    [color "branch"]
      current = yellow reverse
      local = yellow
      remote = green
    [color "diff"]
      meta = yellow bold
      frag = magenta bold
      old = red bold
      new = green bold
    [color "status"]
      added = yellow
      changed = green
      untracked = cyan

    [core]
        editor = code --wait
    [init]
        defaultBranch = main
