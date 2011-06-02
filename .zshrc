PROMPT_COLOR=${PROMPT_COLOR:-cyan}       # Set the prompt color; defaults to cyan
export GREP_COLOR=${GREP_COLOR:-1;35}    # Set the color for grep matches
# a sane default prompt, most people will override this
autoload colors
colors
PS1="%{${fg[$PROMPT_COLOR]}%}%B%n@%m] %b%{${fg[default]}%}"   # a nice colored prompt
RPROMPT="%{${fg[$PROMPT_COLOR]}%}%B%(7~,.../,)%6~%b%{${fg[default]}%}"
if [[ $AUTO_TITLE_SCREENS != "NO" && $EMACS != "t" ]]
then
  # if you are at a zsh prompt, make your screen title your current directory
  precmd ()
  {
    local TITLE=${PWD:t}
    # 'screen' sets STY as well, so for users who override the TERM
    # environment variable, checking STY is nice
    setopt UNSET # Avoid errors from undefined STY for users with 'NOUNSET'
    if [[ $TERM == "screen" || -n $STY ]]; then
        echo -ne "\ek$TITLE\e\\"
    fi
    if [[ $TERM == "xterm" ]]; then
        echo -ne "\e]0;$TITLE\a"
    fi
    setopt LOCAL_OPTIONS # restore value of UNSET
  }
  # if you are running a command, make your screen title the command you're
  # running
  preexec ()
  {
    local CMDS
    local CMD
    set -A CMDS $(echo $1)
    #Use first word from command line, but treat "sudo" specially
    if [[ $CMDS[1] == "sudo" ]]; then
	CMD="sudo $CMDS[2]"
    else
	CMD=$CMDS[1]
    fi
    setopt UNSET # Avoid errors from undefined STY for users with 'NOUNSET'
    if [[ $TERM == "screen" || -n "$STY" ]]; then
      echo -ne "\ek$CMD\e\\"
    fi
    if [[ $TERM == "xterm" ]]; then
      echo -ne "\e]0;$CMD\a"
    fi
    setopt LOCAL_OPTIONS # restore value of UNSET
  }
fi
DIRSTACKSIZE=20   # number of directories in your pushd/popd stack
# programs will use this by default if you need to edit something
# default to vim, so we don't surprise anyone
export EDITOR=${OVERRIDE_EDITOR:-vim} 
export VISUAL=$EDITOR # some programs use this instead of EDITOR
if [[ $EMACS == "t" ]]; then
    export PAGER=cat            # otherwise funkiness in M-x shell
else
    export PAGER=less           # less is more :)
fi
#################### coloring matters ########################
# Color codes: 00;{30,31,32,33,34,35,36,37} and 01;{30,31,32,33,34,35,36,37}
# are actually just color palette items (1-16 in gnome-terminal profile)
# your pallette might be very different from color names given at (http://man.he.net/man1/ls)
# The same LS_COLORS is used for auto-completion via zstyle setting (in this file)
# 
export LS_COLORS_BOLD='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.tex=01;33:*.sxw=01;33:*.sxc=01;33:*.lyx=01;33:*.pdf=0;35:*.ps=00;36:*.asm=1;33:*.S=0;33:*.s=0;33:*.h=0;31:*.c=0;35:*.cxx=0;35:*.cc=0;35:*.C=0;35:*.o=1;30:*.am=1;33:*.py=0;34:'
export LS_COLORS_NORM='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:do=00;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.mpg=00;35:*.mpeg=00;35:*.avi=00;35:*.fli=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.ogg=00;35:*.mp3=00;35:*.wav=00;35:*.tex=00;33:*.sxw=00;33:*.sxc=00;33:*.lyx=00;33:*.pdf=0;35:*.ps=00;36:*.asm=0;33:*.S=0;33:*.s=0;33:*.h=0;31:*.c=0;35:*.cxx=0;35:*.cc=0;35:*.C=0;35:*.o=0;30:*.am=0;33:*.py=0;34:'
export MY_LS_COLORS=${MY_LS_COLORS:-LS_COLORS_BOLD}
eval export LS_COLORS=\${$MY_LS_COLORS}
#################### program environment vars ########################
export LESS='-i'                # case insensitive searching in less
######################### aliases ####################################
#Don't alias grep until after sourcing the files above, could get bad version
#of grep that doesn't understand --color
alias grep='nocorrect grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh'
######################### key bindings ###############################
#set zsh key binding options
case $EDITOR in
  vi*|gvim*)
    bindkey -v	# VI is better than Emacs
    ;;
  emacs*|xemacs*)
    bindkey -e	# Emacs is better than VI
    ;;
esac
bindkey "^R" history-incremental-search-backward
bindkey "^E" end-of-line
bindkey "^A" beginning-of-line
#AWESOME...
#pushes current command on command stack and gives blank line, after that line
#runs command stack is popped
bindkey "^T" push-line-or-edit
# VI editing mode is a pain to use if you have to wait for <ESC> to register.
# This times out multi-char key combos as fast as possible. (1/100th of a
# second.)
KEYTIMEOUT=1
######################### zsh options ################################
setopt ALWAYS_TO_END           # Push that cursor on completions.
setopt AUTO_NAME_DIRS          # change directories  to variable names
setopt AUTO_PUSHD              # push directories on every cd
setopt NO_BEEP                 # self explanatory
######################### history options ############################
setopt EXTENDED_HISTORY        # store time in history
setopt HIST_EXPIRE_DUPS_FIRST  # unique events are more usefull to me
setopt HIST_VERIFY	       # Make those history commands nice
setopt INC_APPEND_HISTORY      # immediatly insert history into history file
HISTSIZE=16000                 # spots for duplicates/uniques
SAVEHIST=15000                 # unique events guarenteed
HISTFILE=~/.history
######################### completion #################################
# these are some (mostly) sane defaults, if you want your own settings, I
# recommend using compinstall to choose them.  See 'man zshcompsys' for more
# info about this stuff.
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl true
if [[ $IGNORE_APOLLO_1 != 'NO' ]]
then
  # Ignore /apollo_1 for directories.  That dir is an import directory
  zstyle ':completion:*' ignored-patterns '/apollo_1'
fi
autoload -U compinit
compinit
# End of lines added by compinstall
