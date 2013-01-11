#! /bin/bash
dotfiles=$HOME/.dotfiles
zshrc=$dotfiles/.zshrc
vimrc=$dotfiles/.vimrc
gvimrc=$dotfiles/.gvimrc
vimfiles=$dotfiles/.vimfiles
tmux_conf=$dotfiles/.tmux.conf
tmux_powerline_rc=$dotfiles/.tmux-powerlinerc

[[ ! -e $HOME/.zshrc ]] && ln -s $zshrc $HOME/.zshrc \
  || echo ".zshrc already exists..."

[[ ! -e $HOME/.vimrc ]] && ln -s $vimrc $HOME/.vimrc \
  || echo ".vimrc already exists..."

[[ ! -e $HOME/.gvimrc ]] && ln -s $gvimrc $HOME/.gvimrc \
  || echo ".gvimrc already exists..."

[[ ! -e $HOME/.vim ]] && ln -s $vimfiles $HOME/.vim \
  || echo ".vim already exists..."

[[ ! -e $HOME/.tmux.conf ]] && ln -s $tmux_conf $HOME/.tmux.conf \
  || echo ".tmux.conf already exists..."

[[ ! -e $HOME/.tmux-powerlinerc ]] && ln -s $tmux_powerline_rc $HOME/.tmux-powerlinerc \
  || echo ".tmux-powerlinerc already exists..."

echo "Done"

