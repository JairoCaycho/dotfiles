# Zsh Setup
> Once Arch Linux recommended first steps had been follow though, apply the following steps. In this step a bunch of libraries will be installed, so you can remain as `root` user. Or if you want to be careful you can set first the `user` and then follow the rest of the configuration, but you will need to input password on each installation `sudo pacman -S <package name>`.
---
## Packages to install
The file `dotfiles/zsh/arch_cli_packages.txt` list all the packages that had been installed explicitly.

```
base 3-2
base-devel 1-2
bat 0.25.0-4
eza 0.21.3-1
fastfetch 2.42.0-3
fd 10.2.0-1
fzf 0.61.3-1
gcc 15.1.1+r7+gf36ec88aa85a-1
git 2.49.0-1
htop 3.4.1-1
less 1:668-1
nano 8.4-1
neovim 0.11.1-2
nodejs 23.9.0-1
npm 11.3.0-1
python 3.13.3-1
ripgrep 14.1.1-1
starship 1.23.0-1
sudo 1.9.16.p2-2
tree-sitter-cli 0.25.3-1
zsh 5.9-5
zsh-autosuggestions 0.7.1-1
zsh-syntax-highlighting 0.8.0-1
```

## Basic shell configuration
Once the packages had been installed. Basic user and shell configuration is implemented.

```
# User creation with sudo credentials
useradd -m -G wheel -s /bin/bash <username>
passwd <username> # set password

# Modify files to make avilable sudo capability to new user
nvim /etc/sudoers
# inside the file -> uncomment the following line
%wheel ALL=(ALL:ALL) ALL
nvim /etc/wsl.conf
# add the following section to the file
[user]
default=<username>
```

Finally, `zsh` is set as default shell.

```
# Make sure "/usr/sbin/zsh" is listed in /etc/shells.
sudo nvim /etc/shells
# add following line
/usr/sbin/zsh
chsh -s $(which zsh)
```

Then shell must be restarted and `zsh` should load instead of `bash`. Now 
