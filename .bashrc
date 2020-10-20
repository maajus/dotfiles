
#
# ~/.bashrc

bind Space:magic-space
set -o vi

BROWSER=chromium
TERM=rxvt-256color
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[1;36m\] \W >> \[\e[0m\]'

#export _JAVA_OPTIONS="-Dswing.aatext=true -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# Pacman alias examples
alias pacupg='sudo pacman -Syu'  # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'              # Display information about a given package in the repositories
alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
alias pacloc='pacman -Qi'              # Display information about a given package in the local database
alias paclocs='pacman -Qs'             # Search for package(s) in the local database

# Additional pacman alias examples
alias pacupd='sudo pacman -Sy && sudo abs'     # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
# export PATH=$PATH:~/.cabal/bin:~/.xmonad/bin
alias armgdb='/home/justas/work/indigma2/indigma2-sumo/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gdb -q'
alias miegot='sudo pm-suspend'
alias avrwrite='avrdude -p m328p -c usbasp -e -U'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# my alias
alias ..='cd ..'
alias c='clear'
alias ls='ls --color=auto' ## Colorize the ls output ##
alias ll='ls -la' ## Use a long listing format ##
alias l.='ls -d .* --color=auto' ## Show hidden files ##
alias cd..='cd ..' ## get rid of command not found ##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias bar='$HOME/scripts/launch_polybar.sh'
alias ip='ip -c'

# Custom exports
export EDITOR="vim"

source "$HOME/scripts/gruvbox_256palette.sh"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export MENUCONFIG_COLOR=blackbg
shopt -s autocd





