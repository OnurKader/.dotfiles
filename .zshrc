# Exports
source ~/.exports

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( git fast-syntax-highlighting zsh-autosuggestions
		 colored-man-pages zsh-completions vi-mode )

autoload -U compinit && compinit

bindkey -v
bindkey "^?" backward-delete-word
bindkey "^H" backward-delete-word
bindkey "\C-k" vi-kill-eol

source $ZSH/oh-my-zsh.sh

# Aliases
source ~/.aliases
mkcd () { mkdir -p "$@"; cd "$@"; }
altercd (){ cd(){ unset -f cd ; cd $*; la ; altercd; } } ; altercd

search ()
{
	pacman -Ss "$1" --color=always | less
}

# TODO: Add a yay searcher as well

nrun ()
{
	clear && ninja && clear && ./$@
}

gcl ()
{
	git clone $1 && cd $1
}

eval "$(lua /home/beron/Code/z.lua/z.lua --init zsh enhanced once)"
source /home/beron/Code/czmod/czmod.zsh

# Setopts
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
# setopt glob_dots
# setopt correctall
setopt auto_continue

# Don't really know how to change terminfo for Alacritty or XTERM so I'm calling tabs -4
tabs -4

DOTNET_CLI_TELEMETRY_OPTOUT=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

