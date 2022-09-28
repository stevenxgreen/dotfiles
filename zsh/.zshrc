source "$XDG_CONFIG_HOME/zsh/aliases"

autoload -U compinit; compinit

# autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

fpath=($ZDOTDIR/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup
autoload -Uz cursor_mode && cursor_mode

# push the current dir visited on to the stack
setopt AUTO_PUSHD
# do not store duplicate dir in the stack
setopt PUSHD_IGNORE_DUPS
# do not print the dir stack after using pushd or popd
setopt PUSHD_SILENT

bindkey -v
export KEYTIMEOUT=1

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-foreward-char
# ^^^^^^^^^^^^^NOT SURE WHY THIS LINE IS CAUSING AN ISSUE ^^^^^^^^^^^^^^^^^^^^^^^^


# FZF
if [ $(command -v "fzf") ]; then
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/key-bindings.zsh
fi


# i3 auto startup
if [ "$(tty)" = "/dev/tty1" ];
then
  pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi



autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source ~/dotfiles/zsh/external/bd.zsh
source $DOTFILES/zsh/scripts.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
