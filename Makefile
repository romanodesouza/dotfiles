WSL := $(findstring WSL, $(shell uname -r))

install-bash:
	ln -sf `pwd`/.bashrc ~/.bashrc
	ln -sf `pwd`/.bash_profile ~/.bash_profile
	ln -sf `pwd`/.bash_aliases ~/.bash_aliases
	ln -sf `pwd`/.bash_functions ~/.bash_functions

install-bin:
	mkdir -p ~/.local/bin || true
	ln -sf `pwd`/.local/bin/* ~/.local/bin/

install-emacs:
ifneq ("$(WSL)", "WSL")
	ifeq ("$(wildcard ~/.config/emacs)", "")
		mkdir -p ~/.config/emacs
	endif
	ln -sf `pwd`/.config/emacs/* ~/.config/emacs/
	emacs -nw --kill
endif

install-git:
	ln -sf `pwd`/.gitconfig ~/.gitconfig

install-idea:
ifneq ("$(WSL)", "WSL")
	ln -sf `pwd`/.ideavimrc ~/.ideavimrc
endif

install-profile:
ifneq ("$(WSL)", "WSL")
	ln -sf `pwd`/.profile ~/.profile
endif

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
	mkdir -p ~/.config/nvim
	mkdir ~/.config/nvim/lua
endif
	ln -sf `pwd`/.config/nvim/init.lua ~/.config/nvim/init.lua

install-vscodium:
ifneq ("$(WSL)", "WSL")
	ln -sf `pwd`/.config/VSCodium/User/* ~/.config/VSCodium/User/
else
	powershell.exe -Command "Start-Process PowerShell -Verb RunAs -ArgumentList 'New-Item -ItemType SymbolicLink -Path \$$env:APPDATA\VSCodium\User\settings.json -Target \\\\wsl$$\Ubuntu/`pwd`/.config/VSCodium/User/settings.json'"
	powershell.exe -Command "Start-Process PowerShell -Verb RunAs -ArgumentList 'New-Item -ItemType SymbolicLink -Path \$$env:APPDATA\VSCodium\User\keybindings.json -Target \\\\wsl$$\Ubuntu/`pwd`/.config/VSCodium/User/keybindings.json'"
endif

install: \
	install-bash \
	install-bin \
	install-git \
	install-profile \
	install-ssh \
	install-kitty \
	install-top \
	install-nvim \
	install-vscodium