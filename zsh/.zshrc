# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH=/home/odin/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"
#ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#export ZSH_TMUX_AUTOSTART=true
#export ZSH_TMUX_AUTOCONNECT=false
plugins=(zsh-syntax-highlighting git django archlinux tmuxinator golang go )

source $ZSH/oh-my-zsh.sh
[ -f $HOME/src/dotfiles-github/zsh/aliases.zsh ] && source $HOME/src/dotfiles-github/zsh/aliases.zsh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

zle-keymap-select () {
if [ $KEYMAP = vicmd ]; then
    # the command mode for vi
    echo -ne "\e[2 q"
else
    # the insert mode for vi
    echo -ne "\e[6 q"
fi
}


zle -N zle-keymap-select
zle -N zle-line-init zle-keymap-select
echo -ne "\e[6 q"

#source ~/.zshrc.priv
[ -f ~/.zshrc.priv ] && source ~/.zshrc.priv

# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [[ -n $SSH_CONNECTION ]]; then
    export SSH_AUTH_SOCK="~/.gnupg/S.gpg-agent.ssh"
else
    if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
      export SSH_AUTH_SOCK="/run/user/${GID}/gnupg/S.gpg-agent.ssh"
    fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export EDITOR=vim
export CLASSPATH=".:./"
if [ -d ~/src/javalibs/ ]; then
    for file in ~/src/javalibs/*; do
        export CLASSPATH=$CLASSPATH:$file
    done
fi
# utf-8
export LC_ALL="en_US.UTF-8"

# export Dirs
export DOTFILES=$(dirname $(dirname $(readlink -nf ~/.zshrc)))

# antigen - Plugins
#source $HOME/.antigen.zsh

#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle robertzk/send.zsh
#antigen bundle mollifier/cd-gitroot
#antigen bundle caarlos0/git-add-remote
#antigen bundle paulirish/git-open

# Fix TERM
if [ "$TERM" = "xterm" ]; then
    export TERM="xterm-256color"
fi
if [ "$TERM" = "screen-256color" ]; then
    # Awesome
fi

export PATH=$PATH:$DOTFILES/bin
#export PATH=$HOME/local/bin:$PATH

# your project folder that we can `c [tab]` to
export PROJECTS=~/src


# use .localrc for super secret things
if [[ -a ~/.localrc ]]; then source ~/.localrc; fi

#for config_file ($ZSH/**/completion.sh) source $config_file

fpath=( "$HOME/.config/zfunctions" $fpath )

# Prompt theme
source /usr/share/doc/pkgfile/command-not-found.zsh 2>/dev/null

# quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Vi-mode on <ESC>, with awesome text support
# See vim-mode.zsh

# Tmux ssh stuff
[[ "$SSH_CONNECTION" != '' ]] && tmux source-file ~/.tmux_ssh.conf >/dev/null 2>/dev/null

# fix golang path
export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin


# FZF is Awesome!
# CTRL + R for command log
# PS: fzf installed with vim,
# else, Goooooogle FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.vim-mode.zsh ] && source ~/.vim-mode.zsh

# Ruby gems
if (( $+commands[ruby] )) ; then
    PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
fi

autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end


export NODE_ENV=development

unsetopt extendedglob

# Private stuff
[ -f ~/.zshrc.priv ] && source ~/.zshrc.priv

# source every .zsh file in this rep
# for config_file ($ZSH/**/*.zsh) source $config_file

bindkey -v
KEYTIMEOUT=1 # Fix the delay
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^G' what-cursor-position


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zle -N zle-keymap-select
zle -N zle-line-init zle-keymap-select
echo -ne "\e[6 q"


bindkey "\e[A" history-beginning-search-backward-end
bindkey "\e[B" history-beginning-search-forward-end


export CLASSPATH=".:./"
if [ -d ~/src/javalibs/ ]; then
    for file in ~/src/javalibs/*; do
        export CLASSPATH=$CLASSPATH:$file
    done
fi
export PATH=$PATH:/usr/local/go/bin
