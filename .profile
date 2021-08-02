export LC_NUMERIC="en_GB.utf8"
export LC_TIME="en_GB.utf8"

export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/bin"
export PATH="$PATH:$HOME/.config/scripts"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.local/share/.npm_global/bin"

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib:/usr/local/lib:/usr/local/lib64:/usr/local/lib32"

export TERM=alacritty
export BROWSER=firefox
export EDITOR=nvim

export MAKEFLAGS="$MAKEFLAGS -j14"

# if [[ "$(tty)" == '/dev/tty1' || "$(tty)" == '/dev/tty7' ]]; then
#     [[ -n "$CDM_SPAWN" ]] && return
#     # Avoid executing cdm(1) when X11 has already been started.
#     [[ -z "$DISPLAY$SSH_TTY$(pgrep xinit)" ]] && exec cdm
# fi

