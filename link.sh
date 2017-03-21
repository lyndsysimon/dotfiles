dir=${PWD}

# Zsh
ln -si $dir/zsh/zshrc ~/.zshrc

# System-accessible custom scripts
ln -si $dir/bin ~/.bin

# Git
ln -si $dir/git/gitconfig ~/.gitconfig

# tmux
ln -si $dir/tmux/tmux.conf ~/.tmux.conf

# Tmuxinator
ln -si $dir/tmuxinator ~/.tmuxinator
