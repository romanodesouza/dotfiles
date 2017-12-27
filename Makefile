install-bash:
	ln -sf `pwd`/.bashrc ~/.bashrc
	ln -sf `pwd`/.bash_profile ~/.bash_profile
	ln -sf `pwd`/.bash_aliases ~/.bash_aliases
	ln -sf `pwd`/.bash_functions ~/.bash_functions

install-emacs:
ifeq ("$(wildcard ~/.emacs.d)", "")
	mkdir ~/.emacs.d
endif
	ln -sf `pwd`/.emacs.d/* ~/.emacs.d/
	emacs -nw --kill

install-git:
	ln -sf `pwd`/.gitconfig ~/.gitconfig

install-idea:
	ln -sf `pwd`/.ideavimrc ~/.ideavimrc

install-ssh:
	ln -sf `pwd`/.ssh/config ~/.ssh/config

install-terminator:
	rm -rf ~/.config/terminator || true
	ln -sf `pwd`/.config/terminator/ ~/.config/

install-top:
	ln -sf `pwd`/.toprc ~/.toprc

install-vim:
	ln -sf `pwd`/.vimrc ~/.vimrc
ifeq ("$(wildcard ~/.vim/autoload/plug.vim)", "")
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
	vim --noplugin +PlugInstall +qall

install-x11:
	ln -sf `pwd`/.Xresources ~/.Xresources

install: \
	install-bash \
	install-emacs \
	install-idea \
	install-git \
	install-ssh \
	install-terminator \
	install-top \
	install-vim \
	install-x11
