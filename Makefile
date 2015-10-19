install-bash:
	ln -sf `pwd`/bash/.inputrc ~/.inputrc
	ln -sf `pwd`/bash/.bashrc ~/.bashrc
	ln -sf `pwd`/bash/.bash_profile ~/.bash_profile
	ln -sf `pwd`/bash/.bash_aliases ~/.bash_aliases
	ln -sf `pwd`/bash/.bash_functions ~/.bash_functions

install-emacs:
	ln -sf `pwd`/emacs/.spacemacs ~/.spacemacs
	ln -sf `pwd`/emacs/snippets/* ~/.emacs.d/private/snippets/
	ln -sf `pwd`/emacs/.mc-lists.el ~/.emacs.d/.mc-lists.el

install-git:
	ln -sf `pwd`/git/.gitconfig ~/.gitconfig

install-idea:
	ln -sf `pwd`/idea/.ideavimrc ~/.ideavimrc
	mkdir -p ~/.AndroidStudio1.3/config/keymaps 2>/dev/null
	ln -sf `pwd`/idea/vimtellimacs.xml ~/.AndroidStudio1.3/config/keymaps/vimtellimacs.xml

install-ssh:
	ln -sf `pwd`/ssh/config ~/.ssh/config

install-tmux:
	ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf

install-vim:
	ln -sf `pwd`/vim/.vimrc ~/.vimrc
	ln -sf `pwd`/vim/.gvimrc ~/.gvimrc
	ln -sf `pwd`/vim/.vim/ ~/.vim && \
		git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle 2>/dev/null; \
		vim --noplugin -u ~/.vim/bundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
	rm vim/.vim/.vim 2>/dev/null

install-x11:
	ln -sf `pwd`/x11/.Xmodmap ~/.Xmodmap
	ln -sf `pwd`/x11/.profile ~/.profile

install: \
	install-bash \
	install-emacs \
	install-idea \
	install-git \
	install-ssh \
	install-tmux \
	install-vim \
	install-x11
