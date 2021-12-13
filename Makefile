install-bash:
	ln -sf `pwd`/.bashrc ~/.bashrc
	ln -sf `pwd`/.bash_profile ~/.bash_profile
	ln -sf `pwd`/.bash_aliases ~/.bash_aliases
	ln -sf `pwd`/.bash_functions ~/.bash_functions

install-bin:
	mkdir -p ~/.local/bin || true
	ln -sf `pwd`/.local/bin/* ~/.local/bin/

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

install-profile:
	ln -sf `pwd`/.profile ~/.profile

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

install-vscode:
	ln -sf `pwd`/.config/Code/User/* ~/.config/Code/User/

install-x11:
	ln -sf `pwd`/.Xresources ~/.Xresources

install: \
	install-bash \
	install-bin \
	install-git \
	install-idea \
	install-profile \
	install-ssh \
	install-terminator \
	install-top \
	install-vim \
	install-x11

install-wsl2: \
	install-bash \
	install-bin \
	install-git \
	install-vim \
