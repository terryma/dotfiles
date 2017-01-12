# Enable glob with no matches
# http://unix.stackexchange.com/questions/26805/how-to-silently-get-an-empty-string-from-a-glob-pattern-with-no-matches
setopt null_glob

# Source local zsh config first
for config (~/.zsh/*.zsh) source $config

###############################################################################
# Oh My Zsh
################################################################################
ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""
DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true
DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS=true
DEFAULT_USER=$USER
plugins=(git brew osx zsh-syntax-highlighting history docker docker-compose)
source $ZSH/oh-my-zsh.sh

################################################################################
# General
################################################################################

# Disable sound
setopt no_beep

# Disable auto correct
unsetopt correct_all

# Don't save duplicated entries into history
setopt hist_ignore_all_dups

# Export TERM correctly for tmux
[[ $TERM == "screen" ]] && export TERM=screen-256color
[[ $TERM == "xterm" ]] && export TERM=xterm-256color

# Turn off terminal driver flow control (CTRL+S/CTRL+Q)
setopt noflowcontrol
stty -ixon -ixoff

# Mass rename
# autoload zmv

# Load the pure theme using prompt
autoload -U promptinit && promptinit
prompt pure

################################################################################
# Vars
################################################################################
path=(
  ~/.dotfiles/bin
  ~/.rbenv/bin
  ~/.cargo/bin
  ~/Library/Python/2.7/bin
  ~/code/dev-ops-tools/bin
  /usr/local/bin
  $path
)
export EDITOR=$(which vim)
export VISUAL=$(which vim)
export KEYTIMEOUT=1
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Locale settings
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

################################################################################
# Aliases
################################################################################

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
alias grm='git rebase master'
alias gRm='git reset --hard origin/master'
alias gpp="gca -m 'Update' && gp"
alias git=hub

# ssh
alias ssh='TERM=xterm-256color ssh'
sshlb() { ssh ec2-user@`get-instances-in-lb $1 | head -1 | get-instance-ip` }

# Docker
alias dcp='docker-compose'
dr() { dcp restart $1 && dcp logs -f --tail=100 $1 }

# Random
alias v='vim $(fzf)'
alias q='exit'
mkdircd () { mkdir -p "$@" && cd "$@"; }

################################################################################
# Ruby
################################################################################
# Initialize rbenv. Don't rehash, it makes starting up REALLY slow
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

################################################################################
# fasd
################################################################################
# eval "$(fasd --init posix-alias zsh-hook)"
# fasd_cache="$HOME/.fasd-init-bash"
# if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  # fasd --init posix-alias zsh-{hook,ccomp,ccomp-install,wcomp,wcomp-install} >| "$fasd_cache"
# fi
# source "$fasd_cache"
# unset fasd_cache

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

    # Backspace: Delete previous char
    bindkey '^?' backward-delete-char
    # Ctrl-q: Quoted insert (Default is Ctrl-v)
    bindkey '^q' quoted-insert
    # Ctrl-w: Delete previous word
    bindkey '^w' backward-kill-word
    # Ctrl-e: Move to the end of line
    bindkey '^e' end-of-line
    # Ctrl-r: FZF history search
    # Ctrl-t: FZF file search
    # Ctrl-y: TODO
    # Ctrl-u: Deletes everything before cursor (u is on left)
    bindkey '^u' backward-kill-line
    # Ctrl-i: Same as tab
    # Ctrl-o: Deletes everything after cursor (o is on right) (Commonly Ctrl-k)
    bindkey '^o' kill-line
    # Ctrl-p: Recent directory with fzf
    bindkey '^p' fj
    # Ctrl-a: Go to the beginning of line
    bindkey '^a' beginning-of-line
    # Ctrl-s: TODO
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
    # Ctrl-m: Same as Enter
    # Ctrl-n: Clear the entire screen (cleaN)
    bindkey '^n' clear-screen
    # Ctrl-/: Undo
    # Ctrl-Space: Quickly yank the entire line into the x CLIPBOARD
    bindkey '^@' x-vi-yank-whole-line
  ;;
esac


# FZF
# export FZF_DEFAULT_COMMAND='ag -u -g ""'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source ~/.fzf.zsh

# More FZF

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
  zle reset-prompt
}
zle -N fj

# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
    tmux switch-client -t "$session"
}
zle -N fs

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
