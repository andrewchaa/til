**Keyboard shortcuts**

https://support.apple.com/en-gb/HT201236

**Show git branch in command line**

* download git-prompt.sh: https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
* edit .bash_profile 

```bash
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"
source ~/.git-prompt.sh

export PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ ";'
```

**Delete a directory with files in it**

```
rm -rf PhoneSale.xcodeproj/xcuserdata/andrew.xcuserdatad/xcdebugger/
```

**Open atom editor in command line**

```
ln -s /Applications/Atom.app/Contents/Resources/app/atom.sh /usr/local/bin/atom
```

