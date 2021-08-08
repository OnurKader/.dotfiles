# Exports
source ~/.exports

# Completion stuff
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/beron/.zshrc'

autoload -Uz compinit
compinit

# Aliases
source ~/.aliases

for plugin in /home/beron/Code/.dotfiles/zsh-plugins/*; do
	source $plugin
done

mkcd () { mkdir -p "$@"; cd "$@"; }
altercd (){ cd(){ unset -f cd ; cd $* && l; altercd; } } ; altercd

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

man()
{
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
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
setopt glob_dots
# setopt correctall
setopt auto_continue

bindkey -v
# [Backspace] - delete backward
bindkey -M emacs '^?' backward-delete-char
bindkey -M viins '^?' backward-delete-char
bindkey -M vicmd '^?' backward-delete-char
# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "${terminfo[kdch1]}" delete-char
  bindkey -M viins "${terminfo[kdch1]}" delete-char
  bindkey -M vicmd "${terminfo[kdch1]}" delete-char
else
  bindkey -M emacs "^[[3~" delete-char
  bindkey -M viins "^[[3~" delete-char
  bindkey -M vicmd "^[[3~" delete-char

  bindkey -M emacs "^[3;5~" delete-char
  bindkey -M viins "^[3;5~" delete-char
  bindkey -M vicmd "^[3;5~" delete-char
fi

# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
bindkey -M viins '^[[3;5~' kill-word
bindkey -M vicmd '^[[3;5~' kill-word

# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
bindkey -M viins '^[[1;5C' forward-word
bindkey -M vicmd '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey -M viins '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5D' backward-word

bindkey "^H" backward-delete-word
bindkey "\C-k" vi-kill-eol
bindkey '^r' history-incremental-search-backward
bindkey ' ' magic-space

# Don't really know how to change terminfo for Alacritty or XTERM so I'm calling tabs -4
tabs -4

DOTNET_CLI_TELEMETRY_OPTOUT=1

eval "$(starship init zsh)"

