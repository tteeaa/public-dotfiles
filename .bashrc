#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\w\> '


# change keybindng to vim
set -o vi # "set -o emacs" for emacs

bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'


# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # preferred listing
alias la='exa -a --color=always --group-directories-first' #all files and dirs
alias ll='exa -l --color=always --group-directories-first' # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | grep -E "^\."' # find all dot files

# Adding Flags
alias cp='rsync -ah --progress' # adds progress bar and ETA
alias mv='mv -i'
alias rm='rm -i' # confirm before deleting something
alias df='df -h' # human readable sizes
alias free='free -m' # show sizes in MB

# Pacman and other package managers
alias pacsyu='sudo pacman -Syu'		# update only standard pkgs
alias pacsyuu='sudo pacman -Syuu' 	# update all packages
alias pacs='sudo pacman -S' 		# pacman install package
alias parsyu='paru -Syu' 		# paru update list and upgrade AUR packages
#alias parsyuu='paru -Syuu' 		# paru full upgrade
alias pars='paru -S' 			# paru install package
alias pacorphan='sudo pacman -Qdt' 	# list all orphaned packages
alias pacdel='sudo pacman -Rcns' 	# remove package and all its dependencies no longer needed
alias pacclean='sudo paccache -rk 2' 	# remove cache except 2 most recent versions
alias parclean='paru -Sccd'		# remove cache directory for all AUR packages
alias pacsize='du -sh /var/cache/pacman/pkg .cache/paru' # check size of cache directories
alias paclocal='pacman -Qs'		# search local packages
alias pacexplicit='sudo pacman -D --asexplicit' # make package explicit


# Navigation
alias ..='cd ..' # parent directory
alias ...='cd ../..' # grandparent directory
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# FTP server
alias ftpstart='sudo ~/scripts/ftp-server-on' # start (or stop if no vpn) ftp service
alias ftpstop='sudo systemctl stop vsftpd'    # stop ftp server (no script for this yet, want it to happen automically if tailscale disconnects)

# Proxmox Commands
alias server-uptime='~/scripts/server-uptime.sh'
alias jellyfin-status='~/scripts/jellyfin-status.sh'
alias jellyfin-reboot='~/scripts/jellyfin-reboot.sh'
alias jellyfin-check-storage='~/scripts/jellyfin-check-storage.sh'
alias jellyfin-search='~/scripts/jellyfin-search.sh'
alias jellyfin-send-file='~/scripts/jellyfin-send-file.sh'
alias connect-kali='~/scripts/connect-kali.sh'

# Colourise grep output
alias 'grep'='grep --color=auto'

# Colourise ip output
alias ip='ip --color=auto'

# Colourise less output
#export LESS='-R --use-color -Dd+r$Du+b$'
#export LESSOPEN="| grep -P 'alias|$' --color=always %s"
#alias less='less -R'
LESSOPEN='|bat --paging=never --color=always %s'

# Rick Roll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias ba='~/scripts/badappleplayer'

# Alacritty theme alias
alias at='alacritty-themes'

# Run on opening of terminal
~/misc/bunnyfetch.sh

# dotfiles git bare repo
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'


# fun

alias bunnyfetch='~/misc/bunnyfetch.sh'
alias colorpanes='~/misc/colorpanes.sh'
alias colorblocks='~/misc/colorblocks.sh'
alias colorballs='~/misc/colorballs.sh'
alias mobile-mount='~/scripts/mobile-mount.sh'
alias gbp='~/scripts/GBP.py'
alias list-wifi='nmcli dev wifi list'
alias connect-wifi='sudo nmcli dev wifi connect'
alias monkeytype='toipe'
alias vim='nvim'
alias vi='vim'
alias grubconfig='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias firefox-nightly='~/Downloads/firefox/firefox'

alias unzipstatus='unzip $1 | pv -l -s $(unzip -Z -1 $1 | wc -l) > /dev/null'

# for optimus-manager, running "prime-offload" is sometimes necessary beforehand
# if this perists, will run prime-offload at startup.
# gdu is used to traverse storage
# bpytop is a nice htop alternative
#

# Turn RTX on
export VKD3D_FEATURE_LEVEL=12_2
export VKD3D_CONFIG=dxr11,dxr
# NVIDIA specific
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=1



##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/tea/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/tea/.config/synth-shell/synth-shell-prompt.sh
fi

eval "$(thefuck --alias)"

source /home/tea/.config/broot/launcher/bash/br

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tea/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tea/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tea/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tea/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

