
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

zle_highlight=('paste:none')


TERM=rxvt-256color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=241'

# Which plugins would you like to load?
plugins=(
  git
  zsh-autosuggestions
  autojump
)

unsetopt share_history

export ZSH="/home/$USER/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# export
export TF_FORCE_GPU_ALLOW_GROWTH=true
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi
#autoload -U colors && colors
export CLICOLOR=1
export FZF_DEFAULT_COMMAND='rg --files --hidden'
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export MENUCONFIG_COLOR=blackbg
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
