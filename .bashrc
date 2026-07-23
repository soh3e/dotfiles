# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Use Mesa's CPU software renderer llvmpipe
export MESA_LOADER_DRIVER_OVERRIDE=llvmpipe

# Add local 'pip' to PATH
export PATH="${PATH}:${HOME}/.local/bin/"

# Add cargo binary path to PATH
export PATH="${PATH}:${HOME}/.cargo/bin"

# Contextual completion
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

# Aliases
alias vim="nvim"
alias sconf="vim ~/.config/sway/config"
alias wconf="vim ~/.config/waybar/config.jsonc"
alias wcss="vim ~/.config/waybar/style.css"
alias reload="swaymsg reload"
alias obsidian="flatpak run md.obsidian.Obsidian"
alias blue="bluetui"
alias spot="~/.config/spotify-player/spotify-player-safe.sh"
alias disc="oxicord"

# Start ssh-agent if not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)"
fi

# Add key if not already loaded
ssh-add -l | grep -q "$(ssh-keygen -lf ~/.ssh/id_ed25519 | awk '{print $2}')" || ssh-add ~/.ssh/id_ed25519

# Environment variables
export XDG_CONFIG_HOME=/home/shthgml/.config

# Support for TTYs
source ~/.cache/wal/colors-tty.sh
export PATH=$PATH:$(go env GOPATH)/bin

# Set default editors to vim instead of nano
export EDITOR=vim
export VISUAL=vim
alias hosts="sudo vim /etc/hosts" 

function htb {
    sudo -k
    sudo -v || return 1

    sudo pkill openvpn 2>/dev/null
    sudo openvpn "$HOME/Downloads/machines_us-5.ovpn" >/tmp/htb-openvpn.log 2>&1 &

    sleep 3

    docker start kali >/dev/null
    docker exec -it kali bash
}

# For gnome-control-center to launch on Fedora
set XDG_CURRENT_DESKTOP=GNOME
