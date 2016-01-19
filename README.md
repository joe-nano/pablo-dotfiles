[Mohamed Saad IBN SEDDIK's](https://github.com/msis) Linux .files
=================================================================

Dotfiles to quickly configure your system. 

# Setup
In a terminal, type:
```bash
bash -c "$(wget -qO - https://raw.github.com/msis/dotfiles/master/install.sh)"
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

# Acknowledgments
This dotfiles are inspired from :
- [Jessie Frazelle](https://github.com/jfrazelle) [dotfiles](https://github.com/jfrazelle/dotfiles).
- [Cătălin Mariș](https://github.com/alrra) [dotfiles](https://github.com/alrra/dotfiles).
- [Nicolas Besnard](https://github.com/nicolas-besnard) [dotfiles](https://github.com/nicolas-besnard/linux-dotfiles).

# License
See the [`LICENSE`](LICENSE) file.