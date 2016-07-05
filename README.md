PABLO ([Payload Autonomy Box](http://oceanai.mit.edu/pavlab/pmwiki/pmwiki.php?n=PavLab.Pablo)) Linux .files
====================================================================================================

Dotfiles to quickly configure a new PABLO box.

# Setup
In a terminal, type:
```bash
bash -c "$(wget -qO - https://raw.github.com/moos-ivp/pablo-dotfiles/master/install.sh)"
```

# Personal Settings
## Git's `~/.gitconfig.local`
To store personal configuration for git, like name and email, or any other setting; you can use the `~/.gitconfig.local` file.
It is appended to the `.gitconfig` defined in this project to allow overiding the predefined settings.

### Example:
```ini
[user]
	email = ms.ibnseddik@gmail.com
	name = Mohamed Saad IBN SEDDIK
```

## Bash's `~/.bash.local`
If you want to add your own aliases or folders to the `PATH` etc., you can create and set everything you need in a local file in `~/.bash.local`
### Example
```bash
#!/bin/bash
PATH="/usr/local/bin:$PATH"
export PATH

alias g="git"
```  

# License
See the [`LICENSE`](LICENSE) file.
