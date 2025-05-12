# WSL2 SETUP
---
## Arch Linux
### Instalation and first steps
```
wsl --install archlinux
# to initialize it
wsl -d archlinux
```

Arch comes completely naked so no text editors by default. We will install `nano` for quick reads and `neovim` for more heavy stuff.

```
pacman -S nano neovim
```

Arch will initialize in root mode as it doesn't have a user create it nor `sudo` installed. [ArchWiki page for WSL Installation](https://wiki.archlinux.org/title/Install_Arch_Linux_on_WSL) is very usefull.

```
useradd -m -G wheel -s /bin/bash <username>
passwd <username> # set password
pacman -S sudo
```

Then 2 files will need to be modified.

```
nvim /etc/sudoers
# inside the file -> uncomment the following line
%wheel ALL=(ALL:ALL) ALL
nvim /etc/wsl.conf
# add the following section to the file
[user]
default=<username>
```

Now when restarting **_Arch_** the default _user_ will be `<username>`. Now we need to install `zsh`.

```
sudo pacman -S install zsh
chsh -s $(which zsh)
# if throws error -> chsh: "/usr/sbin/zsh" is not listed in /etc/shells.
sudo nvim /etc/shells
# add following line
/usr/sbin/zsh # make user that matches the one mentioned in the error.
```

Then after opening a new **_Arch_** session `zsh` should be defualt.

## Zsh: Functionality and Prompt

First lets install `starship` and config it.

```
sudo pacman -S starship
# create starship config file
nvim .config/starship.toml
```

Add lines to .zshrc file.

```
# Initialize Starship
eval "$(starship init zsh)"
```

Now let's add `fzf` for fuzzy capabilities.

```
sudo pacman -S fzf bat # bat is needed to make possible use preview
```

Add lines to .zshrc file.

```
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
```
