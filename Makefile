install-bash:
	ln -sf `pwd`/.bashrc ~/.bashrc
	ln -sf `pwd`/.bash_profile ~/.bash_profile
	ln -sf `pwd`/.bash_aliases ~/.bash_aliases
	ln -sf `pwd`/.bash_functions ~/.bash_functions

install-bin:
	mkdir -p ~/.local/bin || true
	ln -sf `pwd`/.local/bin/* ~/.local/bin/

install-git:
	ln -sf `pwd`/.gitconfig ~/.gitconfig

install-profile:
	ln -sf `pwd`/.profile ~/.profile

install-ssh:
	ln -sf `pwd`/.ssh/config ~/.ssh/config

install-terminator:
	rm -rf ~/.config/terminator || true
	ln -sf `pwd`/.config/terminator/ ~/.config/

install-top:
	ln -sf `pwd`/.toprc ~/.toprc

install-nvim:
ifeq ("$(wildcard ~/.config/nvim)", "")
	mkdir ~/.config/nvim
endif
	ln -sf `pwd`/.config/nvim/init.lua ~/.config/nvim/init.lua

install-vscode:
	ln -sf `pwd`/.config/Code/User/* ~/.config/Code/User/

install-x11:
	ln -sf `pwd`/.Xresources ~/.Xresources

install: \
	install-bash \
	install-bin \
	install-git \
	install-profile \
	install-ssh \
	install-terminator \
	install-top \
	install-nvim \
	install-x11

install-wsl2: \
	install-bash \
	install-bin \
	install-git \
	install-nvim
