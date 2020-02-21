# Exports
source ~/.exports
source ~/.aliases

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( z git fast-syntax-highlighting tmux zsh-autosuggestions extract
		 colored-man-pages zsh-completions vi-mode )

bindkey -v
bindkey "^?" backward-delete-char

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"
export EDITOR="nvim"
export VISUAL="nvim"

# Aliases
mkcd () { mkdir -p "$*"; cd "$*"; }
altercd(){ cd(){ unset -f cd ; cd $*; la ; altercd; } } ; altercd

# CONFIG STUFF
POWERLEVEL9K_MODE='nerdfont-complete'
PURE_POWER_MODE=fancy
source ~/.purepower

POWERLEVEL9K_LINUX_UBUNTU_ICON="\uf31b "
POWERLEVEL9K_LINUX_UBUNTU_ICON_BACKGROUND=none
POWERLEVEL9K_VIRTUAL_ENV_BACKGROUND=none
POWERLEVEL9K_OS_ICON_BACKGROUND=none
POWERLEVEL9K_OS_ICON_FOREGROUND="red"
POWERLEVEL9K_VIRTUALENV_BACKGROUND=none
POWERLEVEL9K_VIRTUALENV_FOREGROUND=032
DOTNET_CLI_TELEMETRY_OPTOUT=1

# NNN CONFIG
export NNN_BMS='d:~/Desktop/;P:~/Pictures/;p:~/Peki/;D:~/Downloads/'
export NNN_USE_EDITOR=1
# export NNN_CONTEXT_COLORS="2136"
export NNN_TRASH=1


