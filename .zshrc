# Exports
source ~/.exports

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( z git fast-syntax-highlighting tmux zsh-autosuggestions extract
		 colored-man-pages zsh-completions vi-mode )

bindkey -v

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Aliases
source ~/.aliases
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
