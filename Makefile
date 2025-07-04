WSL := $(findstring WSL, $(shell uname -r))

install-bin:
	mkdir -p ~/.local/bin || true
	ln -sf `pwd`/.local/bin/* ~/.local/bin/
	which git && which nvim || (sudo apt update && sudo apt install git neovim)

install-fzf:
	wget --quiet https://github.com/junegunn/fzf/releases/download/v0.63.0/fzf-0.63.0-linux_amd64.tar.gz -O fzf.tar.gz
	tar -xvf fzf.tar.gz
	chmod +x ./fzf
	mv ./fzf ~/.local/bin/fzf

install-bash:
	wget --quiet https://raw.githubusercontent.com/mrzool/bash-sensible/refs/heads/master/sensible.bash -O ~/.sensible.bash
	ln -sf `pwd`/.bashrc ~/.bashrc
	echo "source ~/.bashrc" > ~/.bash_profile
	exec bash

install-profile:
	ln -sf `pwd`/.profile ~/.profile

install-emacs:
	ifeq ("$(wildcard ~/.config/emacs)", "")
		mkdir -p ~/.config/emacs
	endif
	ln -sf `pwd`/.config/emacs/* ~/.config/emacs/
	emacs -nw --kill

install-git:
	wget --quiet https://github.com/so-fancy/diff-so-fancy/releases/download/v1.4.4/diff-so-fancy -O diff-so-fancy
	chmod +x ./diff-so-fancy
	mv ./diff-so-fancy ~/.local/bin/diff-so-fancy
	ln -sf `pwd`/.gitconfig ~/.gitconfig

install-idea:
	ln -sf `pwd`/.ideavimrc ~/.ideavimrc

install-ssh:
	ln -sf `pwd`/.ssh/config ~/.ssh/config

install-kitty:
ifneq ("$(WSL)", "WSL")
	ifeq ("$(wildcard ~/.config/kitty)", "")
		mkdir -p ~/.config/kitty
	endif
	kitten themes --dump-theme Nord > ~/.config/kitty/nord-theme.conf
	kitten themes --dump-theme catppuccin-mocha > ~/.config/kitty/catppuccin-theme.conf
	ln -sf `pwd`/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf
endif

install-terminator:
ifneq ("$(WSL)", "WSL")
	rm -rf ~/.config/terminator || true
	ln -sf `pwd`/.config/terminator/ ~/.config/
endif

install-top:
	ln -sf `pwd`/.toprc ~/.toprc

install-nvim:
ifeq ("$(wildcard ~/.config/nvim)", "")
	mkdir -p ~/.config/nvim/lua
endif
	ln -sf `pwd`/.config/nvim/init.lua ~/.config/nvim/init.lua

install-cursor:
ifneq ("$(WSL)", "WSL")
	ln -sf `pwd`/.config/Cursor/User/* ~/.config/Cursor/User/
else
	powershell.exe -Command "Start-Process PowerShell -Verb RunAs -ArgumentList 'New-Item -ItemType SymbolicLink -Path \$$env:APPDATA\Cursor\User\settings.json -Target \\\\wsl$$\Ubuntu/`pwd`/.config/Cursor/User/settings.json'"
	powershell.exe -Command "Start-Process PowerShell -Verb RunAs -ArgumentList 'New-Item -ItemType SymbolicLink -Path \$$env:APPDATA\Cursor\User\keybindings.json -Target \\\\wsl$$\Ubuntu/`pwd`/.config/Cursor/User/keybindings.json'"
endif

install: \
	install-bin \
	install-fzf \
	install-bash \
	install-profile \
	install-git \
	install-ssh \
	install-top \
	install-nvim \
	install-cursor