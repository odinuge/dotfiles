#!/bin/sh
command_exists () {
    type "$1" &> /dev/null ;
}

alias pacamn='pacman'
alias yaourt='yaourt -A'
if command_exists nvim ; then
    alias vim='nvim'
fi

