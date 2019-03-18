export ZSH=/home/$USER/.oh-my-zsh

export DOTFILES=$(dirname $(dirname $(readlink -nf ~/.zshrc)))

ZSH_THEME="refined"

plugins=(
    zsh-syntax-highlighting
    git
    django
    archlinux
    golang
    go
    docker
    kubectl
    pass
)

source $ZSH/oh-my-zsh.sh

FILES=( 
    "$HOME/.aliases.zsh"
    "$HOME/.utils.zsh"
    "$HOME/.functions.zsh"
    # Vim-mode <3
    "$HOME/.vim-mode.zsh"
    "$HOME/.zshrc.priv"
    # Utils
    "$HOME/.fzf.zsh"
    "$HOME/.cargo/env"
    "$HOME/.localrc"
    # System stuff
    "/usr/share/z/z.sh"
    # Arch pkg-suggestions
    "/usr/share/doc/pkgfile/command-not-found.zsh"
)

PATHS=(
    "$HOME/.local/bin"
    "$DOTFILES/bin"
    "$HOME/bin"
    "$HOME/.yarn/bin"
    "$HOME/go/bin"
    "$HOME/.config/yarn/global/node_modules/.bin"
    "/usr/local/go/bin"
)

for file in $FILES; do
    [ -f $file ] && source $file
done

for p in $PATHS; do
    export PATH=${PATH}:${p}
done

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
export NODE_ENV=development


# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
fi

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [[ -n $SSH_CONNECTION ]]; then
    export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
else
    if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
      export SSH_AUTH_SOCK="/run/user/${GID}/gnupg/S.gpg-agent.ssh"
    fi
fi

fpath=( "$HOME/.config/zfunctions" $fpath )

# quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Tmux ssh stuff
[[ "$SSH_CONNECTION" != '' ]] && tmux source-file ~/.tmux_ssh.conf >/dev/null 2>/dev/null


# Ruby gems
if (( $+commands[ruby] )) ; then
    PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
fi

autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Fix arrow-keys in Command-mode in vim-term
bindkey "\e[A" history-beginning-search-backward-end
bindkey "\e[B" history-beginning-search-forward-end

# Enable shift-tab to tab backwards
bindkey '^[[Z' reverse-menu-complete

unsetopt extendedglob

# Enter tmux
if [ -z $TMUX ] && [[ "$(tty)" =~ /dev/pts/* ]]; then exec tmux; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
