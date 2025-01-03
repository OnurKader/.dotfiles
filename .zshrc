# Completion stuff
# zmodload zsh/zprof
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/beron/.zshrc'
setopt interactive_comments

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
autoload -U select-word-style
select-word-style bash

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.exports

source ~/.aliases

source ~/Code/.dotfiles/zsh-plugins/fast-syntax-highlighting/F-Sy-H.plugin.zsh
for plugin in ~/Code/.dotfiles/zsh-plugins/*.zsh ~/Code/.dotfiles/zsh-plugins/zman/zman.zsh; do
	source $plugin
done

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

fpath=(~/Code/.dotfiles/zsh-plugins/zsh-completions/src $fpath)

autoload -Uz compinit
if [ -n "$('find' $HOME -maxdepth 1 -mtime -1 -name .zcompdump)" ]; then
	compinit -C
else
	compinit
fi
compdef ytdl=yt-dlp

mkcd () { mkdir -p "$@"; cd "$@"; }
altercd (){ cd(){ unset -f cd ; cd $* && ll; altercd; } } ; altercd

search ()
{
	pacman -Ss "$1" --color=always | less
}

nrun ()
{
	clear && ninja && ./$@
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
	for f in ${@:-*}; do mediainfo "$f" | awk -F: '/Duration/{print $2}' | head -n1 | sd 'h ' 'h+' | sd 'min ' 'min+'; done \
	| paste -sd+ | xargs qalc | hck -d'[=]' -f2
}

play ()
{
	mpv $@ ; exit
	# TODO: The format is different, extract the id and append with that
	# echo $@ >> ~/.cache/youtube-dl/download-archive.txt
}

strip_playlist_from_yt_url ()
{
	echo "$(cut -d'&' -f1 <<< $1)"
}

# z.lua + czmod
eval "$(lua ~/Code/z.lua/z.lua --init zsh once enhanced)"
source "$HOME/Code/czmod/czmod.zsh"

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
unsetopt FLOW_CONTROL

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

DOTNET_CLI_TELEMETRY_OPTOUT=1

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey "^Xe" edit-command-line

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
				zellij -l disable-status-bar
			else
				zellij -s Main -l disable-status-bar
			fi
		fi

		if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
			exit
		fi
	fi
}

# setup_zellij

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function nvims() {
	items=("LazyVim" "default" "NvChad" "AstroNvim")
	config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config 󰄾 " --height=~50% --layout=reverse --border --exit-0)
	if [[ -z $config ]]; then
		echo "Nothing selected"
		return 0
	elif [[ $config == "default" ]]; then
		config=""
	fi
	NVIM_APPNAME=$config nvim $@
}

alias lnv="NVIM_APPNAME=LazyVim nvim"

function sl() {
	MINS="${1-1}"
	sleep "$MINS"m
	report_sync
	exit
}

function slm() {
	MINS="${1-1}"
	sleep "$MINS"m
	mousemove
	report_sync
	exit
}

FZF_ALT_C_COMMAND= eval "$(fzf --zsh)" # Doesn't work with ^R for some reason? If I run this in the shell it's fine??
bindkey "^o" fzf-history-widget # This works at least

vterm_printf() {
	if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
		# Tell tmux to pass the escape sequences through
		printf "\ePtmux;\e\e]%s\007\e\\" "$1"
	elif [ "${TERM%%-*}" = "screen" ]; then
		# GNU screen (screen, screen-256color, screen-256color-bce)
		printf "\eP\e]%s\007\e\\" "$1"
	else
		printf "\e]%s\e\\" "$1"
	fi
}

# ${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration

# zprof

