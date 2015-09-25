# Enable glob with no matches
# http://unix.stackexchange.com/questions/26805/how-to-silently-get-an-empty-string-from-a-glob-pattern-with-no-matches
setopt null_glob

# Source local zsh config first
for config (~/.zsh/*.zsh) source $config

################################################################################
# tmux
# ##############################################################################

if [[ -n $TMUX && "$(uname)" == "Linux" ]] then;
  # Set $DISPLAY from the global environment
  export `tmux showenv -g DISPLAY`

  # Set $DISPLAY in all sessions
  for name in `tmux ls -F '#{session_name}'`; do
    # tmux setenv -g DISPLAY $DISPLAY
    tmux setenv -t $name DISPLAY $DISPLAY
  done

  # Update shell variables to match tmux environment
  while read v; do
    if [[ $v == -* ]]; then
      unset ${v/#-}
    else
      v=${v/=/\=\"}
      v=${v/%/\"}
      eval export $v
    fi
  done < <(tmux show-environment)
fi

# Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  # source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

###############################################################################
# Oh My Zsh
################################################################################
ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="agnoster"
# ZSH_THEME="powerline"
ZSH_THEME="pure"

DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true
DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS=true
DEFAULT_USER=$USER
plugins=(git brew osx zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

################################################################################
# General
################################################################################
# Uncomment if we want tmux powerline to display the current directory
# PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Disable sound
setopt no_beep

# Disable auto correct
unsetopt correct_all

# Disable history sharing
unsetopt share_history

# Export TERM correctly for tmux
[[ $TERM == "screen" ]] && export TERM=screen-256color
[[ $TERM == "xterm" ]] && export TERM=xterm-256color

# Enable dircolors if we're in Linux
# if [[ "$(uname)" == "Linux" ]]; then
  # eval `dircolors ~/.dircolors`
# fi

# Turn off terminal driver flow control (CTRL+S/CTRL+Q)
setopt noflowcontrol
stty -ixon -ixoff

autoload zmv

################################################################################
# Vars
################################################################################
export PATH=~/.linuxbrew/bin:~/.dotfiles/bin:~/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
export EDITOR=$(which vim)
# Use vimpager as PAGER
# export VIMPAGER_RC=~/.dotfiles/.zsh/.vimpagerrc
# export PAGER=~/.dotfiles/.zsh/vimpager/vimpager
export VISUAL=$(which vim)
export P4DIFF="gvimdiff -f -R"
if [ -f /usr/local/heroku/bin/heroku ]; then
  export PATH=/usr/local/heroku/bin:$PATH
fi
if [ -d /usr/local/lib/node_modules ]; then
  export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
fi
export KEYTIMEOUT=1
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export NDK_ROOT=~/code/sdk/android-ndk-r8e
export ANDROID_HOME=/usr/local/opt/android-sdk

################################################################################
# Aliases
################################################################################
# p4merge
if [[ "$(uname)" == "Darwin" ]]; then
  alias p4merge='/Applications/p4merge.app/Contents/MacOS/p4merge'
fi

# Open file in existing gvim
alias gvir='gvim --remote'

# Git
alias gd='git difftool'
alias gbs='git branches'
alias gbed='git branch --edit-description'
alias gmt='git mergetool'
alias gi='git update-index --assume-unchanged'
alias gui='git update-index --no-assume-unchanged'
alias gsi='git ls-files -v | grep "^[a-z]"'
alias gg="git log --graph --pretty=oneline --format='format:%C(yellow)%h%C(reset) %C(blue)\"%an\" <%ae>%C(reset) %C(magenta)%ar%C(reset)%C(auto)%d%C(reset)%n%s' --date-order"
alias gs='git --no-pager show --stat --oneline'
alias gam='git commit -a --amend --no-edit'
export GIT_TEMPLATE_DIR=~/.git/templates

# ssh
alias ssh='TERM=xterm-256color ssh'

# Enable reattach-to-user-namespace on Mac. See
# https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/issues/8
if [[ "$(uname)" == "Darwin" ]]; then
  alias tmux='tmux -2 -f ~/.dotfiles/.tmux-osx.conf'
fi

# TODO Seems to be an issue with less F tail. Disable for now
# alias less=$PAGER
alias zless=$PAGER

alias ←="pushd -q -1"
alias →="pushd -q +0"
alias .="cd ~/.dotfiles"

bp() {
  cp "$1"{,.bak}
}

rt() {
  zmv -f "($1).bak" "\$1"
}

################################################################################
# Ruby
################################################################################
# Initialize rbenv. Don't rehash, it makes starting up REALLY slow
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

# Important. Under Mac OS X, make sure to disable /usr/libexec/path_helper to
# prevent non-interactive zsh to have the wrong path. See
# https://github.com/dotphiles/dotzsh#mac-os-x
# run 'sudo chmod ugo-x /usr/libexec/path_helper'

################################################################################
# fasd
################################################################################
eval "$(fasd --init posix-alias zsh-hook)"
alias v='f -e vim'
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-{hook,ccomp,ccomp-install,wcomp,wcomp-install} >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

################################################################################
# Teamocil
################################################################################
alias t="teamocil --here"
compctl -g '~/.teamocil/*(:t:r)' teamocil

################################################################################
# ZLE Widgets
################################################################################
# Auto ls after each directory change
function chpwd() {
    emulate -L zsh
    ll
}

# Copy selected region to CLIPBOARD
function x-copy-region-as-kill() {
  zle copy-region-as-kill
  # TODO(terryma): Refactor
  if [[ "$(uname)" == "Linux" ]]; then
    print -rn $CUTBUFFER | xclip -i -selection clipboard
  elif [[ "$(uname)" == "Darwin" ]] ; then
    print -rn $CUTBUFFER | pbcopy
  fi
}
zle -N x-copy-region-as-kill

# Kill region goes to CLIPBOARD
function x-kill-region() {
  zle kill-region
  if [[ "$(uname)" == "Linux" ]]; then
    print -rn $CUTBUFFER | xclip -i -selection clipboard
  elif [[ "$(uname)" == "Darwin" ]] ; then
    print -rn $CUTBUFFER | pbcopy
  fi
}
zle -N x-kill-region

# Paste x CLIPBOARD
function x-yank() {
  if [[ "$(uname)" == "Linux" ]]; then
    CUTBUFFER=$(xclip -o -selection clipboard)
  elif [[ "$(uname)" == "Darwin" ]] ; then
    CUTBUFFER=$(pbpaste)
  fi
  zle yank
}
zle -N x-yank

function x-vi-yank-whole-line() {
  zle vi-yank-whole-line
  if [[ "$(uname)" == "Linux" ]]; then
    print -rn $CUTBUFFER | xclip -i -selection clipboard
  elif [[ "$(uname)" == "Darwin" ]] ; then
    print -rn $CUTBUFFER | pbcopy
  fi
}
zle -N x-vi-yank-whole-line

################################################################################
# Key bindings
################################################################################
case "$TERM" in
  *xterm*|screen-256color)

    # Marking, yanking, and pasting in insert mode
    # Ctrl-t to set the mark, use movement commands to select the region, yank
    # the region using Ctrl-y, and paste the region using Ctrl-p

    # In iTerm, <Tab> sends Alt-t
    bindkey 't' expand-or-complete
    # In iTerm, <Ctrl-BS> sends Alt-d
    bindkey 'd' vi-backward-kill-word
    # Backspace: Delete previous char
    bindkey '^?' backward-delete-char
    # Ctrl-q: Quoted insert (Default is Ctrl-v)
    bindkey '^q' quoted-insert
    # Ctrl-w: Delete previous word
    # bindkey '^w' vi-backward-kill-word
    bindkey '^w' backward-kill-word
    # Ctrl-e: Move to the end of line
    bindkey '^e' end-of-line
    # Ctrl-r: Search backwards in history
    bindkey '^r' history-incremental-pattern-search-backward
    # Ctrl-t: Set mark
    bindkey '^t' set-mark-command
    # Ctrl-y: Copy the area from the cursor to the mark to the kill buffer
    bindkey '^y' x-copy-region-as-kill
    # Ctrl-u: Deletes everything before cursor (u is on left)
    bindkey '^u' backward-kill-line
    # Ctrl-i: Same as tab
    # Ctrl-o: Deletes everything after cursor (o is on right) (Commonly Ctrl-k)
    bindkey '^o' kill-line
    # Ctrl-p: TODO
    bindkey '^p'  fj
    # Ctrl-a: Go to the beginning of line
    bindkey '^a' beginning-of-line
    # Ctrl-s: Search forwards in history
    bindkey '^s' history-incremental-pattern-search-forward
    # Ctrl-d: Delete next word
    bindkey '^d' kill-word
    # Ctrl-f: Move one character to the left. Good way to remember this is that
    # both f and h use the left finger. 1 moves character left, and the other
    # word left
    bindkey '^f' backward-char
    # Ctrl-g: Move one character to the right
    bindkey '^g' forward-char
    # Ctrl-h: Move one word to the left
    # bindkey '^h' vi-backward-word
    bindkey '^h' backward-word
    # Ctrl-j: Go down in history
    bindkey '^j' down-line-or-history
    # Ctrl-k: Go up in history
    bindkey '^k' up-line-or-history
    # Ctrl-l: Move one word to the right
    # bindkey '^l' vi-forward-word
    bindkey '^l' forward-word
    # Ctrl-[: Same as Escape
    # Ctrl-]: TODO
    # bindkey '^]'
    # Ctrl-\: TODO
    # bindkey '^\'
    # Ctrl-z: Tmux command key
    # Ctrl-x: Delete character under cursor
    bindkey '^x' delete-char
    # Ctrl-c: Terminates
    # Ctrl-v: Insert the contents of the clipboard at the cursor
    bindkey '^v' x-yank
    # Ctrl-b: Edit command line using vi. 'b' stands for better :)
    bindkey '^b' edit-command-line
    # bindkey '^b'
    # Ctrl-m: Same as Enter
    # Ctrl-n: Clear the entire screen (cleaN)
    bindkey '^n' clear-screen
    # Ctrl-/: Undo
    # bindkey '^_' undo
    # Ctrl-Space: Quickly yank the entire line into the x CLIPBOARD
    bindkey '^@' x-vi-yank-whole-line

    # Alt-k: Move to next directory in history
    # bindkey -s '^[k' "→\r"
    # Alt-j: Move to previous directory in history
    # bindkey -s '^[j' "←\r"
  ;;
esac

################################################################################
# Vim mode
################################################################################
# vim mode indicator in prompt
# (http://superuser.com/questions/151803/how-do-i-customize-zshs-vim-mode)
# vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
# vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
# vim_mode=$vim_ins_mode

# function zle-keymap-select {
  # vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  # zle reset-prompt
# }
# zle -N zle-keymap-select

# function zle-line-finish {
  # vim_mode=$vim_ins_mode
# }
# zle -N zle-line-finish

# RPROMPT='${vim_mode}'

################################################################################
# END
################################################################################

# TODO I'm hit by this bug with fzf
# https://bugzilla.redhat.com/show_bug.cgi?id=526366
export FZF_DEFAULT_OPTS="--no-mouse --extended --cycle"
source ~/.fzf.zsh

# More fzf

# c - browse chrome history
c() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# fj - changing directory with fasd
function fj() {
  local dir
  dir=$(fasd -Rdl | fzf --no-sort +m) && cd "$dir"
}
zle -N fj
