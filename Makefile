install-bash:
	ln -sf `pwd`/bash/.bashrc ~/.bashrc
	ln -sf `pwd`/bash/.bash_profile ~/.bash_profile
	ln -sf `pwd`/bash/.bash_aliases ~/.bash_aliases
	ln -sf `pwd`/bash/.bash_functions ~/.bash_functions

install-emacs:
	ln -sf `pwd`/emacs/.spacemacs ~/.spacemacs
	ln -sf `pwd`/emacs/snippets/* ~/.emacs.d/private/snippets/
	ln -sf `pwd`/emacs/.mc-lists.el ~/.emacs.d/.mc-lists.el

install-dbus:
	mkdir -p ~/.config/dbus 2>/dev/null
	ln -sf `pwd`/dbus/* ~/.config/dbus/

install-git:
	ln -sf `pwd`/git/.gitconfig ~/.gitconfig

ANDROID_STUDIO_DIR = $(shell ls -A ~/ | grep ".AndroidStudio")
install-idea:
	ln -sf `pwd`/idea/.ideavimrc ~/.ideavimrc
	mkdir -p ~/$(ANDROID_STUDIO_DIR)/config/keymaps 2>/dev/null
	ln -sf `pwd`/idea/vimtellimacs.xml ~/$(ANDROID_STUDIO_DIR)/config/keymaps/vimtellimacs.xml

install-ssh:
	ln -sf `pwd`/ssh/config ~/.ssh/config

install-terminator:
	mkdir -p ~/.config/terminator 2>/dev/null
	ln -sf `pwd`/terminator/config ~/.config/terminator/

install-vim:
	ln -sf `pwd`/vim/.vimrc ~/.vimrc
	ln -sf `pwd`/vim/.gvimrc ~/.gvimrc
ifeq ($(wildcard ~/.vim/autoload/plug.vim), "")
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
	vim --noplugin +PlugInstall +qall

install-x11:
	ln -sf `pwd`/x11/.Xmodmap ~/.Xmodmap
	xmodmap ~/.Xmodmap
	ln -sf `pwd`/x11/.Xresources ~/.Xresources
	ln -sf `pwd`/x11/autostart/* ~/.config/autostart/

install: \
	install-bash \
	install-emacs \
	install-dbus \
	install-idea \
	install-git \
	install-ssh \
	install-terminator \
	install-vim \
	install-x11
