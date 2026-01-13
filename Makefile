WSL := $(findstring WSL, $(shell uname -r))

install-bin:
	mkdir -p ~/.local/bin || true
	ln -sf `pwd`/.local/bin/* ~/.local/bin/
	which git && which nvim || (sudo apt update && sudo apt install -y git neovim)

install-fzf:
	wget --quiet https://github.com/junegunn/fzf/releases/download/v0.63.0/fzf-0.63.0-linux_amd64.tar.gz -O fzf.tar.gz
	tar -xvf fzf.tar.gz
	chmod +x ./fzf
	mv ./fzf ~/.local/bin/fzf
	rm fzf.tar.gz

install-bash:
	wget --quiet https://raw.githubusercontent.com/mrzool/bash-sensible/refs/heads/master/sensible.bash -O ~/.sensible.bash
	ln -sf `pwd`/.bashrc ~/.bashrc
	echo "source ~/.bashrc" > ~/.bash_profile
	exec bash

install-profile:
	ln -sf `pwd`/.profile ~/.profile

install-git:
	wget --quiet https://github.com/so-fancy/diff-so-fancy/releases/download/v1.4.4/diff-so-fancy -O diff-so-fancy
	chmod +x ./diff-so-fancy
	mv ./diff-so-fancy ~/.local/bin/diff-so-fancy
	ln -sf `pwd`/.gitconfig ~/.gitconfig

install-ssh:
	ln -sf `pwd`/.ssh/config ~/.ssh/config

install-top:
	ln -sf `pwd`/.toprc ~/.toprc

install-nvim:
ifeq ("$(wildcard ~/.config/nvim)", "")
	mkdir -p ~/.config/nvim/lua
endif
	ln -sf `pwd`/.config/nvim/init.lua ~/.config/nvim/init.lua

install-vscode:
ifneq ("$(WSL)", "WSL")
	ln -sf `pwd`/.config/Code/User/* ~/.config/Code/User/
else
	powershell.exe -Command "Start-Process PowerShell -Verb RunAs -ArgumentList 'New-Item -ItemType SymbolicLink -Path \$$env:APPDATA\Code\User\settings.json -Target \\\\wsl$$\Ubuntu/`pwd`/.config/Code/User/settings.json'"
	powershell.exe -Command "Start-Process PowerShell -Verb RunAs -ArgumentList 'New-Item -ItemType SymbolicLink -Path \$$env:APPDATA\Code\User\keybindings.json -Target \\\\wsl$$\Ubuntu/`pwd`/.config/Code/User/keybindings.json'"
endif

install: \
	install-bin \
	install-fzf \
	install-profile \
	install-git \
	install-ssh \
	install-top \
	install-nvim \
	install-vscode \
	install-bash
