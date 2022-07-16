# Completion stuff
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/beron/.zshrc'
setopt interactive_comments

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
autoload -U select-word-style
select-word-style bash

# Exports
source ~/.exports

# Aliases
source ~/.aliases

source ~/Code/.dotfiles/zsh-plugins/fast-syntax-highlighting/F-Sy-H.plugin.zsh
for plugin in ~/Code/.dotfiles/zsh-plugins/*.zsh; do
	source $plugin
done

fpath=(~/Code/.dotfiles/zsh-plugins/zsh-completions/src $fpath)

autoload -Uz compinit
compinit
compdef ytdl=yt-dlp

mkcd () { mkdir -p "$@"; cd "$@"; }
altercd (){ cd(){ unset -f cd ; cd $* && ll; altercd; } } ; altercd

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

man ()
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
	git clone --recursive $@ &&
	if [[ -z "$2" ]]; then;
		cd ${${1%%.git}##*/}
	else
		cd "$2"
	fi
}

get_total_video_length ()
{
	for f in *; do mediainfo "$f" | awk -F: '/Duration/{print $2}' | head -n1 \
	| xargs -I '{}' qalc '{} to seconds' | awk '{print $9}'; done | paste -sd+ | bc | xargs -I '{}' qalc '{} seconds'
}

play ()
{
	mpv $@ ; exit
	# TODO: The format is different, extract the id and append with that
	# echo $@ >> ~/.cache/youtube-dl/download-archive.txt
}

# zoxide
eval "$(zoxide init zsh)"

# Setopts
setopt complete_in_word
setopt autocd
setopt extendedglob
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt glob_dots
setopt interactive_comments
setopt nobeep
# setopt correctall
setopt auto_continue
setopt auto_pushd

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

# [PageUp] - Up a line of history
if [[ -n "${terminfo[kpp]}" ]]; then
  bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
  bindkey -M viins "${terminfo[kpp]}" up-line-or-history
  bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
fi
# [PageDown] - Down a line of history
if [[ -n "${terminfo[knp]}" ]]; then
  bindkey -M emacs "${terminfo[knp]}" down-line-or-history
  bindkey -M viins "${terminfo[knp]}" down-line-or-history
  bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
fi

# [Home] - Go to beginning of line
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
  bindkey -M viins "${terminfo[khome]}" beginning-of-line
  bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi
# [End] - Go to end of line
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey -M emacs "${terminfo[kend]}"  end-of-line
  bindkey -M viins "${terminfo[kend]}"  end-of-line
  bindkey -M vicmd "${terminfo[kend]}"  end-of-line
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

# [Shift-Tab] - move through the completion menu backwards
if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

bindkey "^[[3;5~" delete-word
bindkey "^H" backward-delete-word
bindkey "\C-k" vi-kill-eol
bindkey ' ' magic-space

# Don't really know how to change terminfo for Alacritty or XTERM so I'm calling tabs -4
tabs -4

DOTNET_CLI_TELEMETRY_OPTOUT=1

eval "$(starship init zsh)"

export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"
bindkey '^r' _atuin_search_widget

xset b off

# zellij Autostart
export ZELLIJ_AUTO_ATTACH="false"
export ZELLIJ_AUTO_EXIT="false"
setup_zellij ()
{
	if [[ -z "$ZELLIJ" ]]; then
		if [[ ($(echo "$TTY" | grep "tty")) || (-n "$NVIM") ]]; then
			return
		fi

		if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
			zellij attach -c #Main
		else
			# A bad hack, if Main session doesn't exist create it
			if [[ $(zellij ls | grep "Main") ]]; then
				zellij
			else
				zellij -s Main
			fi
		fi

		if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
			exit
		fi
	fi
}

setup_zellij

