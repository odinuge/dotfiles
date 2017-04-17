#!/bin/sh
command_exists () {
    type "$1" &> /dev/null ;
}

alias pacamn='pacman'
alias yaourt='yaourt -A'
if command_exists nvim ; then
    alias vim='nvim'
fi
if command_exists nvim-qt ; then
    alias gvim='nvim-qt'
fi

alias lego-webapp-test='(cd-gitroot; echo "Running eslint...";node_modules/eslint/bin/eslint.js app --ignore-path .gitignore --quiet)'
