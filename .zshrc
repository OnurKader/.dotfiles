# Exports
source ~/.exports

# Completion stuff
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/beron/.zshrc'

autoload -Uz compinit
compinit

bindkey -v
#bindkey "^?" backward-delete-word
#bindkey "^H" backward-delete-word
bindkey "\C-k" vi-kill-eol

# Aliases
source ~/.aliases

for plugin in /home/beron/Code/.dotfiles/zsh-plugins/*; do
	source $plugin
done

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
	for i in $@; do
		printf "%2d: %s\n" "${#i}" "$i"
	done
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

#eval "$(lua /home/beron/Code/z.lua/z.lua --init zsh enhanced once)"
#source /home/beron/Code/czmod/czmod.zsh

# Setopts
setopt complete_in_word
setopt autocd
setopt extendedglob
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

eval "$(starship init zsh)"

