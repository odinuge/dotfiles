#
# VIM MODE STUFF :D
#

zle-keymap-select () {
if [ $KEYMAP = vicmd ]; then
    # the command mode for vi
    if [[ $TTY =~ /dev/pts* ]]; then
        echo -ne "\e[2 q"
    else 
        echo -ne "\e[?16;0;112c"
    fi
else
    # the insert mode for vi
    if [[ $TTY =~ /dev/pts* ]]; then
        echo -ne "\e[6 q"
    else 
        echo -ne "\e[?0;0;112c"
    fi
fi
}


zle -N zle-keymap-select
zle -N zle-line-init zle-keymap-select

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

# Clipboard support
[[ -n $DISPLAY ]] && (( $+commands[xclip] )) && {

  function cutbuffer() {
    zle .$WIDGET
    echo $CUTBUFFER | xclip -selection clipboard
    echo $CUTBUFFER | xclip
  }

  zle_cut_widgets=(
    vi-backward-delete-char
    vi-change
    vi-change-eol
    vi-change-whole-line
    vi-delete
    vi-delete-char
    vi-kill-eol
    vi-substitute
    vi-yank
    vi-yank-eol
  )
  for widget in $zle_cut_widgets
  do
    zle -N $widget cutbuffer
  done

  function putbuffer() {
    zle copy-region-as-kill "$(xclip -o)"
    zle .$WIDGET
  }

  zle_put_widgets=(
    vi-put-after
    vi-put-before
  )
  for widget in $zle_put_widgets
  do
    zle -N $widget putbuffer
  done
}


vi-lowercase() {
  local save_cut="$CUTBUFFER" save_cur="$CURSOR"
  zle .vi-change || return
  zle .vi-cmd-mode
  CUTBUFFER="${CUTBUFFER:l}"
  zle .vi-put-after -n 1
  CUTBUFFER="$save_cut" CURSOR="$save_cur"
}

vi-uppercase() {
  local save_cut="$CUTBUFFER" save_cur="$CURSOR"
  zle .vi-change || return
  zle .vi-cmd-mode
  CUTBUFFER="${CUTBUFFER:u}"
  zle .vi-put-after -n 1
  CUTBUFFER="$save_cut" CURSOR="$save_cur"
}

zle -N vi-lowercase
zle -N vi-uppercase

bindkey -a 'gU' vi-uppercase
bindkey -a 'gu' vi-lowercase
bindkey -M visual 'u' vi-lowercase
bindkey -M visual 'U' vi-uppercase

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


zle -N zle-keymap-select
zle -N zle-line-init zle-keymap-select
if [[ $TTY =~ /dev/pts* ]]; then
    echo -ne "\e[6 q"
else 
    echo -ne "\e[?0;0;112c"
fi
