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
    make_link ./bash/.bash_aliases ~/.bash_aliases
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

install_emacs() {
    make_link ./emacs/init-local-config.el ~/.emacs.d/local-config/init-local-config.el
    make_link ./emacs/snippets/ ~/.emacs.d/local-config/snippets
    make_link ./emacs/.mc-lists.el ~/.emacs.d/.mc-lists.el
}

install_x11() {
    make_link x11/.Xmodmap ~/.Xmodmap
}

install_bash
install_git
install_ssh
install_vim
install_emacs
install_x11

echo "Finish! :)"
