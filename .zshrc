# Turn on to profile zsh
# zmodload zsh/zprof

# Enable glob with no matches
# http://unix.stackexchange.com/questions/26805/how-to-silently-get-an-empty-string-from-a-glob-pattern-with-no-matches
setopt null_glob

# Source local zsh config first
for config (~/.zsh/*.zsh) source $config

## Command history configuration
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
HISTSTAMPS="yyyy-mm-dd"
SAVEHIST=10000

alias history='fc -il 1'

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

################################################################################
# General
################################################################################

# Disable sound
setopt no_beep

# Disable auto correct
unsetopt correct_all

# Don't save duplicated entries into history
setopt hist_ignore_all_dups

# Auto cd to directory
setopt auto_cd

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

export GOPATH="${HOME}/.go"
# DON'T USE brew --prefix golang it's really slow
export GOROOT="/usr/local/opt/go/libexec"
path=(
  ~/.dotfiles/bin
  ~/.rbenv/bin
  ~/.cargo/bin
  ~/.npm-global/bin
  ./node_modules/.bin
  ${GOPATH}/bin
  ${GOROOT}/bin
  /usr/local/opt/python/libexec/bin
  /usr/local/bin
  /Applications/Postgres.app/Contents/Versions/latest/bin
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
alias ga='git add'
alias gca='git commit -v -a'
alias gd='git difftool'
function gb() { git checkout -b tma/$1 }
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
alias gp='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias gco='git checkout'
alias gRm='gco master && gup && gco - && git reset --hard origin/master'
alias gpp="gca -m 'Update' && gp"
alias gpr="git pull-request --no-edit -o"
alias gsp="git stash pop"
alias gst='git status'
alias gup='git pull --rebase'
alias git=hub

# ssh
alias ssh='TERM=xterm-256color ssh'

# Docker
alias dcp='docker-compose'
dr() { dcp restart $1 && dcp logs -f --tail=100 $1 }

# Terraform
alias tp='terraform plan'
alias ta='terraform apply'
alias ti='terraform init'
alias tf='terraform'

# Random
alias ls='ls -G'
alias ll='ls -l'
alias q='tmux kill-pane'
mkdircd () { mkdir -p "$@" && cd "$@"; }

alias pgcli='PAGER=cat pgcli'

################################################################################
# Ruby
################################################################################
# Initialize rbenv. Don't rehash, it makes starting up REALLY slow
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

################################################################################
# fasd
################################################################################
# eval "$(fasd --init posix-alias zsh-hook)"
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-{hook,ccomp,ccomp-install,wcomp,wcomp-install} >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

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
    # bindkey '^y' ff
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
    # Ctrl-\: FZF cd
    bindkey '^\' fzf-cd-widget
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
  prompt_pure_preprompt_render
  zle reset-prompt
}
zle -N fj

# v - recent files with fasd
function v() {
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)"
  # prompt_pure_preprompt_render
  # zle reset-prompt
  vim "${file}"
}

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

perf() {
    curl -so /dev/null -w "\
   namelookup:  %{time_namelookup}s\n\
      connect:  %{time_connect}s\n\
   appconnect:  %{time_appconnect}s\n\
  pretransfer:  %{time_pretransfer}s\n\
     redirect:  %{time_redirect}s\n\
starttransfer:  %{time_starttransfer}s\n\
-------------------------\n\
        total:  %{time_total}s\n" "$@"
}

eval "$(pyenv init -)"

# Lazy load nvm, to prevent it slowly down terminal startup time
export NVM_DIR="$HOME/.nvm"
function nvm() {
  unset -f nvm
  . $NVM_DIR/nvm.sh
  nvm $@
}

# Completions

# homebrew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

fpath=(~/.zsh/completions $fpath)

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/tma/.zshrc'

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
  compdump
else
  compinit -C
fi

autoload -z edit-command-line
zle -N edit-command-line

# helpful zsh completion for `kubectl` and `helm`
# if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
# if [ $commands[helm] ]; then source <(helm completion zsh); fi

# zprof
