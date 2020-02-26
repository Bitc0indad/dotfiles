#!/usr/bin/env bash

installVim() {
echo 'installVim'

    read -p "Install Vim? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then


        #sudo rm -rf ~/.vim_runtime
        if [ -d "$HOME/.vim_runtime/" ]; then
          cd ~/.vim_runtime
          git pull -f  origin master
          sh ~/.vim_runtime/install_awesome_vimrc.sh
          #we exclude from ~/ because we link to here
          ln -sf ~/dotfiles/.vimrc ~/.vim_runtime/my_configs.vim

        else

          git clone --depth=1 https://github.com/randymcmillan/vimrc.git ~/.vim_runtime
          sh ~/.vim_runtime/install_awesome_vimrc.sh
          ln -sf ~/dotfiles/.vimrc ~/.vim_runtime/my_configs.vim
        fi

    fi
    echo

}
installVim