#/bin/bash
config_path=$(pwd)


function setUpZsh
{
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh
}

setUpZsh


mkdir ~/.config/nvim
mkdir ~/.config/termite

ln -sf $config_path/bashrc ~/.bashrc
ln -sf $config_path/vimrc ~/.config/nvim/init.vim
ln -sf $config_path/tmux.conf ~/.tmux.conf
ln -sf $config_path/termite.config ~/.config/termite/config
ln -sf $config_path/zshrc ~/.zshrc
ln -sf $config_path/dev.tmux.conf ~/.dev.tmux.conf
