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

    PS1="[\[\e[32m\]\u@\h\[\e[0m\]]-[$EXIT_COLOR\[\e[0m\]]-[\[\e[34m\]\W\[\e[0m\]]\n\$ "
}

PROMPT_COMMAND=set_prompt

export LIBVA_DRIVER_NAME="nvidia"
export EDITOR="nvim"
export LIBVIRT_DEFAULT_URL="qemu:///system"
# https://github.com/tauri-apps/wry/issues/1366
export WEBKIT_DISABLE_DMABUF_RENDERER="1"
export PATH="$PATH:/home/user/.dotnet/tools"
export NVD_BACKEND=direct

alias ls='/usr/bin/ls --color=auto -lah'
alias grep='/usr/bin/grep --color=auto'
alias clip='/usr/bin/wl-copy'
alias config='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'
alias lazyconfig='/usr/bin/lazygit --git-dir=$HOME/.dot/ --work-tree=$HOME'

. "$HOME/.cargo/env"
