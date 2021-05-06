# Exports
source ~/.exports

ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=( git fast-syntax-highlighting zsh-autosuggestions
		 colored-man-pages zsh-completions vi-mode )

autoload -U compinit && compinit -i

bindkey -v
bindkey "^?" backward-delete-word
bindkey "^H" backward-delete-word
bindkey "\C-k" vi-kill-eol

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
source ~/.aliases

mkcd () { mkdir -p "$@"; cd "$@"; }
altercd (){ cd(){ unset -f cd ; cd $* && la ; altercd; } } ; altercd

search ()
{
	pacman -Ss "$1" --color=always | less
}

nrun ()
{
	clear && ninja && clear && ./$@
}

crun ()
{
	clear; cargo run -q --bin day_$1
}

strlen ()
{
	echo "${#1}: '$1'"
}

gcl ()
{
	git clone $@ &&
	if [[ -z "$2" ]]; then;
		cd ${${1%%.git}##*/}
	else
		cd "$2"
	fi
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/beron/Code/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/beron/Code/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/beron/Code/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/beron/Code/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

