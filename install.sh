#!/bin/bash

YES_TO_ALL=$1

confirm() {
    echo -n "Install $1 in $2 [Y/n]? "
    if [ "$YES_TO_ALL" == "-y" ]; then
        echo "Y"
        return 0
    fi
    read -n1 key
    if [ "$key" == "" ]; then
        return 0
    fi
    echo
    if [ "$key" == "y" ] || [ "$key" == "Y" ]; then
        return 0
    fi
    return 1
}

make_link() {
    if confirm $1 $2; then
        rm -rf $2 && ln -sf `pwd`/$1 $2
        return 0
    fi
    return 1
}

install_bash() {
    make_link ./bash/.inputrc ~/.inputrc
    make_link ./bash/.bashrc ~/.bashrc
    make_link ./bash/.bash_profile ~/.bash_profile
}

install_git() {
    make_link ./git/.gitconfig ~/.gitconfig
}

install_ssh() {
    make_link ./ssh/config ~/.ssh/config
}

install_vim() {
    make_link ./vim/.vimrc ~/.vimrc
    make_link ./vim/.gvimrc ~/.gvimrc
    make_link ./vim/.vim/ ~/.vim &&
        git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle 2>/dev/null;
        vim --noplugin -u ~/.vim/bundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
}


install_bash
install_git
install_ssh
install_vim

echo "Finish! :)"
