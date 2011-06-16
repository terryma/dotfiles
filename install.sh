#! /bin/bash
zshrc=$HOME/.zshrc
vimrc=$HOME/.vimrc

# create .zshrc if not already exists
if [ ! -f $zshrc ]
then
        echo "$zshrc does not exist"
        echo "creating $zshrc..."
        touch $zshrc && echo "$zshrc created." || echo "Error: Failed to create $zshrc"
        echo 'source $HOME/.dotfiles/.zshrc' > $zshrc 
        echo "Generated $zshrc"
else
        echo ".zshrc already exists"
fi

# create .vimrc if not already exists
if [ ! -f $vimrc ]
then 
        echo "$vimrc does not exist"
        echo "creating $vimrc..."
        touch $vimrc && echo "$vimrc created." || echo "Error: Failed to create $vimrc"
        echo 'set runtimepath=$HOME/.dotfiles/vimfiles,$VIMRUNTIME' >> $vimrc
        echo 'source $HOME/.dotfiles/_vimrc' >> $vimrc
        echo "Generated $vimrc"
else
        echo ".vimrc already exists"
fi

# change shell to /bin/zsh if not already using it
zsh=/bin/zsh
if [ ! -f $zsh ]
then
        echo "$zsh is not found"
        echo "Installing zsh"
        # use yum for now
        sudo yum install --quiet --assumeyes zsh
fi
if [ $SHELL != $zsh ]
then
        echo "Current shell is not zsh. Current shell=$SHELL"
        echo "Trying to change shell to zsh for user $USER"
        sudo chsh -s $zsh $USER
        echo "Changed shell to zsh"
    # source the new .zshrc
    echo "Sourcing $zshrc"
    source $zshrc
else
        echo "Already using zsh"
fi
echo "Done"

