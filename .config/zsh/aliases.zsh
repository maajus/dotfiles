alias lg='lazygit'
alias gpu_watch="watch -n -1 nvidia-smi"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias f="ranger"
alias v="nvim ."
# use this with media keys later
#alias play="spotify play"
#alias pause="spotify pause"
#alias next="spotify next"
#alias prev="spotify prev"
alias gp='git add . && git commit -m "auto push" && git push'
alias blog_post='cd ~/Repos/blog && git add . && git commit -m "auto push" && git push && cd -'
alias config='ranger ~/.config'
alias repos='ranger ~/Repos'
alias zrc='nvim ~/.zshrc'
alias zsource='source ~/.zshrc'
alias ls='exa --color=always --group-directories-first'
alias corona='curl https://corona-stats.online/lt'
alias p='sudo pacman -S'
alias y='yay -S'
alias fshoot_full='flameshot full -p ~/pics/screenshots'
alias list_systemctl="systemctl list-unit-files --state=enabled"
alias cat="ccat"
alias i3-logout="i3-msg exit"
alias monitors="xrandr -q | grep " connected" | cut -d ' ' -f1"
alias miegot="systemctl suspend"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ..='cd ..'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias bar='$HOME/scripts/launch_polybar.sh'
alias ip='ip -c'

