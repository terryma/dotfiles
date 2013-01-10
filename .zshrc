# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew osx vi-mode)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Disable auto correct
unsetopt correct_all

# Source all other zsh files
for config in "~/.zsh/*.zsh" source $config

# Export TERM correctly for tmux
[[ $TERM == "screen" ]] && export TERM=screen-256color
[[ $TERM == "xterm" ]] && export TERM=xterm-256color

if [[ `uname` == 'Linux' ]]; then
  eval `dircolors ~/.dircolors`
fi

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# fasd settings
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-{hook,ccomp,ccomp-install,wcomp,wcomp-install} >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# Aliases
alias v='f -e vim'
alias p4merge='/Applications/p4merge.app/Contents/MacOS/p4merge'
alias gvir='gvim --remote' # Open file in existing gvim
alias tmux='tmux -2'

# Use vim as a pager for less
VLESS=$(find /usr/share/vim -name 'less.sh')
if [ ! -z $VLESS ]; then
  alias less=$VLESS
fi

DEFAULT_USER=$USER
export PATH=~/.dotfiles/bin:/usr/local/bin:/user/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/python
export EDITOR=vim
export PAGER=less
export VISUAL=vim
export P4DIFF="gvimdiff -f -R"

# Turn off terminal driver flow control (CTRL+S/CTRL+Q)
setopt noflowcontrol
stty -ixon -ixoff

# no beep
setopt no_beep

# ZLE WIDGETS

# Zsh's history-beginning-search-backward is very close to Vim's C-x C-l
history-beginning-search-backward-then-append() {
  zle history-beginning-search-backward
  zle vi-add-eol
}
zle -N history-beginning-search-backward-then-append

# Delete all characters between a pair of characters. Mimics vim's "di" text object functionality
delete-in() {

  # Create locally-scoped variables we'll need
  local CHAR LCHAR RCHAR LSEARCH RSEARCH COUNT

  # Read the character to indicate which text object we're deleting
  read -k CHAR

  if [ "$CHAR" = "w" ]
  then
    # diw, delete the word

    # find the beginning of the word under the cursor
    zle vi-backward-word

    # set the left side of the delete region at this point
    LSEARCH=$CURSOR

    # find the end of the word under the cursor
    zle vi-forward-word

    # set the right side of the delete region at this point
    RSEARCH=$CURSOR

    # Set the BUFFER to everything except the word we are removing
    RBUFFER="$BUFFER[$RSEARCH+1,${#BUFFER}]"
    LBUFFER="$LBUFFER[1,$LSEARCH]"

    return

  # diw was unique.  For everything else, we just have to define the
  # characters to the left and right of the cursor to be removed
  elif [ "$CHAR" = "(" ] || [ "$CHAR" = ")" ]
  then
    # di), delete inside of a pair of parenthesis
    LCHAR="("
    RCHAR=")"

  elif [ "$CHAR" = "[" ] || [ "$CHAR" = "]" ]
  then
    # di], delete inside of a pair of square brackets
    LCHAR="["
    RCHAR="]"

  elif [ $CHAR = "{" ] || [ $CHAR = "}" ]
  then
    # di}, delete inside of a pair of braces
    LCHAR="{"
    RCHAR="}"

  else
    # The character entered does not have a special definition.
    # Simply find the first instance to the left and right of the cursor.
    LCHAR="$CHAR"
    RCHAR="$CHAR"
  fi

  # Find the first instance of LCHAR to the left of the cursor and the
  # first instance of RCHAR to the right of the cursor, and remove everything in between.
  # Begin the search for the left-sided character directly the left of the cursor
  LSEARCH=${#LBUFFER}

  # Keep going left until we find the character or hit the beginning of the buffer
  while [ "$LSEARCH" -gt 0 ] && [ "$LBUFFER[$LSEARCH]" != "$LCHAR" ]
  do
    LSEARCH=$(expr $LSEARCH - 1)
  done

  # If we hit the beginning of the command line without finding the character, abort
  if [ "$LBUFFER[$LSEARCH]" != "$LCHAR" ]
  then
    return
  fi

  # start the search directly to the right of the cursor
  RSEARCH=0

  # Keep going right until we find the character or hit the end of the buffer
  while [ "$RSEARCH" -lt $(expr ${#RBUFFER} + 1 ) ] && [ "$RBUFFER[$RSEARCH]" != "$RCHAR" ]
  do
    RSEARCH=$(expr $RSEARCH + 1)
  done

  # If we hit the end of the command line without finding the character, abort
  if [ "$RBUFFER[$RSEARCH]" != "$RCHAR" ]
  then
    return
  fi

  # Set the BUFFER to everything except the text we are removing
  RBUFFER="$RBUFFER[$RSEARCH,${#RBUFFER}]"
  LBUFFER="$LBUFFER[1,$LSEARCH]"
}

zle -N delete-in


# Delete all characters between a pair of characters and then go to insert mode
# Mimics vim's "ci" text object functionality.
change-in() {
  zle delete-in
  zle vi-insert
}
zle -N change-in

# Delete all characters between a pair of characters as well as the surrounding
# characters themselves. Mimics vim's "da" text object functionality
delete-around() {
  zle delete-in
  zle vi-backward-char
  zle vi-delete-char
  zle vi-delete-char
}
zle -N delete-around

# Delete all characters between a pair of characters as well as the surrounding
# characters themselves and then go into insert mode. Mimics vim's "ca" text object functionality.
change-around() {
  zle delete-in
  zle vi-backward-char
  zle vi-delete-char
  zle vi-delete-char
  zle vi-insert
}
zle -N change-around

# End of ZLE widgets

alias ←="pushd -q +1"
alias →="pushd -q -0"

# Key bindings
case "$TERM" in
  *xterm*|screen-256color)
    # alt + arrows
    # bindkey '[d' backward-word
    # bindkey '[c' forward-word
    # bindkey '^[[1;3d' backward-word
    # bindkey '^[[1;3c' forward-word

    # ctrl + arrows
    # bindkey '^[od' backward-word
    # bindkey '^[oc' forward-word
    # bindkey '^[[1;5D' backward-word
    # bindkey '^[[1;5C' forward-word

    # home / end
    bindkey '^[[1~' beginning-of-line
    bindkey '^[[4~' end-of-line

    # delete
    bindkey '^[[3~' delete-char

    # page up / page down
    bindkey '^[[5~' history-beginning-search-backward
    bindkey '^[[6~' history-beginning-search-forward

    # shift + tab
    bindkey '^[[Z' reverse-menu-complete


    # VI MODE KEYBINDINGS (ins mode)
    bindkey -M viins '^a'    beginning-of-line
    bindkey -M viins '^e'    end-of-line
    bindkey -M viins -s '^b' "←\n" # C-b move to previous directory (in history)
    bindkey -M viins -s '^f' "→\n" # C-f move to next directory (in history)
    bindkey -M viins '^k'    kill-line
    bindkey -M viins '^r'    history-incremental-pattern-search-backward
    bindkey -M viins '^s'    history-incremental-pattern-search-forward
    bindkey -M viins '^p'    history-beginning-search-backward
    bindkey -M viins '^n'    history-beginning-search-forward
    bindkey -M viins '^y'    yank
    bindkey -M viins '^w'    backward-kill-word
    bindkey -M viins '^u'    backward-kill-line
    bindkey -M viins '^h'    backward-delete-char
    bindkey -M viins '^?'    backward-delete-char
    bindkey -M viins '^_'    undo
    bindkey -M viins '^x^l'  history-beginning-search-backward-then-append
    bindkey -M viins '^x^r'  redisplay
    bindkey -M viins '\eOH'  beginning-of-line # Home
    bindkey -M viins '\eOF'  end-of-line       # End
    bindkey -M viins '\e[2~' overwrite-mode    # Insert
    bindkey -M viins '\ef'   forward-word      # Alt-f
    bindkey -M viins '\eb'   backward-word     # Alt-b
    bindkey -M viins '\ed'   kill-word         # Alt-d
    # For some reason up and down arrows take you to the beginning of the line.
    # Remap them explicitly
    bindkey -M viins '\eOA'  up-line-or-history
    bindkey -M viins '\eOB'  down-line-or-history


    # VI MODE KEYBINDINGS (cmd mode)
    bindkey -M vicmd 'ca'    change-around
    bindkey -M vicmd 'ci'    change-in
    bindkey -M vicmd 'da'    delete-around
    bindkey -M vicmd 'di'    delete-in
    bindkey -M vicmd 'ga'    what-cursor-position
    bindkey -M vicmd 'gg'    beginning-of-history
    bindkey -M vicmd 'G '    end-of-history
    bindkey -M vicmd '^a'    beginning-of-line
    bindkey -M vicmd '^e'    end-of-line
    bindkey -M vicmd '^k'    kill-line
    bindkey -M vicmd '^r'    history-incremental-pattern-search-backward
    bindkey -M vicmd '^s'    history-incremental-pattern-search-forward
    bindkey -M vicmd '^p'    history-beginning-search-backward
    bindkey -M vicmd '^n'    history-beginning-search-forward
    bindkey -M vicmd '^y'    yank
    bindkey -M vicmd '^w'    backward-kill-word
    bindkey -M vicmd '^u'    backward-kill-line
    bindkey -M vicmd '/'     vi-history-search-forward
    bindkey -M vicmd '?'     vi-history-search-backward
    bindkey -M vicmd '^_'    undo
    bindkey -M vicmd '\ef'   forward-word                      # Alt-f
    bindkey -M vicmd '\eb'   backward-word                     # Alt-b
    bindkey -M vicmd '\ed'   kill-word                         # Alt-d
    bindkey -M vicmd '\e[5~' history-beginning-search-backward # PageUp
    bindkey -M vicmd '\e[6~' history-beginning-search-forward  # PageDown
  ;;
esac

# vim mode indicator in prompt (http://superuser.com/questions/151803/how-do-i-customize-zshs-vim-mode)
vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

RPROMPT='${vim_mode}'
# end

