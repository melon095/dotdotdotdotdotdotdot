#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function set_prompt {
    local EXIT="$?"
    local EXIT_COLOR="\[\e[32m\]$EXIT"  # green

    if [ $EXIT -ne 0 ]; then
        EXIT_COLOR="\[\e[31m\]$EXIT"    # red
    fi

    PS1="[\[\e[32m\]\u@\h\[\e[0m\]]-[$EXIT_COLOR\[\e[0m\]]-[\[\e[34m\]\w\[\e[0m\]]\n\$ "
}

PROMPT_COMMAND=set_prompt

export HISTSIZE=100
export HISTFILESIZE=100000
export LIBVA_DRIVER_NAME="nvidia"
export EDITOR="nvim"
export LIBVIRT_DEFAULT_URL="qemu:///system"
# https://github.com/tauri-apps/wry/issues/1366
export WEBKIT_DISABLE_DMABUF_RENDERER="1"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$HOME/.local/bin:$PATH"
export NVD_BACKEND=direct
export CHATTERINO2_RECENT_MESSAGES_URL="https://recent-messages.zneix.eu/api/v2/recent-messages/%1"

alias rm="/usr/bin/gomi"
alias ls='/usr/bin/eza -lagh --hyperlink'
alias grep='/usr/bin/grep --color=auto'
alias clip='/usr/bin/wl-copy'
alias config='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias lazyconfig='/usr/bin/lazygit --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias c='cd /mnt/d/code/'

if [ -f "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	tmux attach-session -t main || tmux new-session -s main
fi

