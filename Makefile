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

install-idea:
	ln -sf `pwd`/.ideavimrc ~/.ideavimrc

install-profile:
	ln -sf `pwd`/.profile ~/.profile

install-ssh:
	ln -sf `pwd`/.ssh/config ~/.ssh/config

install-kitty:
ifeq ("$(wildcard ~/.config/kitty)", "")
	mkdir ~/.config/kitty
endif
	kitten themes --dump-theme Nord > ~/.config/kitty/nord-theme.conf
	kitten themes --dump-theme catppuccin-mocha > ~/.config/kitty/catppuccin-theme.conf
	ln -sf `pwd`/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

install-top:
	ln -sf `pwd`/.toprc ~/.toprc

install-nvim:
ifeq ("$(wildcard ~/.config/nvim)", "")
	mkdir ~/.config/nvim
	mkdir ~/.config/nvim/lua
	touch ~/.config/nvim/lua/init_local.lua
endif
	ln -sf `pwd`/.config/nvim/init.lua ~/.config/nvim/init.lua

install-vscodium:
	ln -sf `pwd`/.config/VSCodium/User/* ~/.config/VSCodium/User/

install: \
	install-bash \
	install-bin \
	install-git \
	install-idea \
	install-profile \
	install-ssh \
	install-kitty \
	install-top \
	install-nvim \
	install-vscodium

install-wsl2: \
	install-bash \
	install-bin \
	install-git \
	install-nvim
