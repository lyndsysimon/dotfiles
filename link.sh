dir=${PWD}

# Zsh
ln -si $dir/zsh/zshrc ~/.zshrc

# System-accessible custom scripts
ln -si $dir/bin ~/.bin

# Vim
ln -si $dir/vim/vimrc ~/.vimrc
ln -si $dir/vim/vim ~/.vim

# Neovim
ln -si ~/.vimrc ~/.nvimrc
ln -si ~/.nvim ~/.vim

# Git
ln -si $dir/git/gitconfig ~/.gitconfig

# tmux
ln -si $dir/tmux/tmux.conf ~/.tmux.conf
