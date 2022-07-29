# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##################################
############# PROMPT #############
##################################

#PROMPT='%F{8}$%f '
PROMPT='%F{243}%1~%f %F{White} %f  '
#PROMPT='%F{111}%1~%f %F{White} %f  '


##################################
############# BÁSICO #############
##################################

autoload -U compinit
compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

PATH=$PATH:$HOME/.config/Scripts


##################################
############# ALIAS ##############
##################################

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias rm='rm -r'
alias ls='ls --color=auto'

alias xrandr2560='xrandr --output HDMI-0 --mode 2560x1080'
alias xrandr1920='xrandr --output HDMI-0 --mode 1920x1080'
alias xrandr1280='xrandr --output HDMI-0 --mode 1280x720'

alias tar='tar -zxvf'
alias vim='nvim'
alias unrar='unrar x'
alias fetch='clear && neofetch'
alias mpv='devour mpv'
alias dl='youtube-dl'
alias fetch6000='fm6000 -c blue'
alias mupdf='devour mupdf'

alias xr='sudo xbps-remove -R'
alias xq='xbps-query -Rs'
alias xo='sudo xbps-remove -o'
alias xl='sudo xbps-install'
alias xu='sudo xbps-install -Su'

alias cddwm='cd .config/dwm'
alias cdawesome='cd .config/awesome'

alias rc.lua='vim .config/awesome/rc.lua'
alias i3config='vim .config/i3/config'
alias yml='vim .config/alacritty/alacritty.yml'
alias bashrc='vim .bashrc'
alias gtk='vim .config/gtk-3.0/gtk.css'
alias roteiros='vim Documentos/TWMLINUX'
alias zshrc='vim .zshrc'
alias bashrc='vim .bashrc'
alias init.vim='vim .config/nvim/init.vim'
alias picom.conf='vim .config/picom/picom.conf'
alias keybinds='vim Documentos/Keybinds'
alias twm.vim='sudo nvim /usr/share/nvim/runtime/colors/twm.vim'
alias kitty.conf='vim .config/kitty/kitty.conf'


##################################
############# COLORS #############
##################################

#source $HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.oh-my-zsh/custom/plugins/zsh-completions/zsh-completions.plugin.zsh
source /usr/share/fzf/key-bindings.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#484E5B,underline"

# tty
if [ "$TERM" = "linux" ] ; then
    echo -en "\e]P0232323"
fi

# custom function
toppy() {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n 21
}

cd() {
	builtin cd "$@" && command ls --group-directories-first --color=auto -F
}

# Color-Toys Aliases
alias bloks="${HOME}/.color-toys/bloks"
alias copyhash="${HOME}/.scripts/copyhash.sh"
alias makemusic="pactl load-module module-remap-sink sink_name=MUSIC"
alias installed="grep -i installed /var/log/pacman.log"
alias trek="trekscii $(tput lines) $(tput cols)"

# Fancy scripts
alias block="~/.scripts/zsh/cl"
alias color="~/.scripts/zsh/block ~/.scripts/zsh/blockify_conf"
alias rain="~/.scripts/zsh/rain"
alias topcmd="~/.scripts/zsh/tp"

# enable completion features
autoload -Uz compinit
compinit -i

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.config/zsh/.zcompcache"

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories


# init starship
eval "$(starship init zsh)"
# setup starship custom prompt
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

