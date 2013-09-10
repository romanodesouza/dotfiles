all: help

help:
	@echo "Make a backup of your files, run 'make install' and be happy :)"

install: install_vim_dir \
	install_vimrc \
	install_gvimrc \
	install_inputrc \
	install_bash_files \
	install_git_files \
	done

install_vim_dir:
	@echo "Linking vim/.vim/ directory to ~/.vim/"
	@ln -sf `pwd`/vim/.vim/ ~/

install_vimrc:
	@echo "Linking vim/.vimrc to ~/.vimrc"
	@ln -sf `pwd`/vim/.vimrc ~/

install_gvimrc:
	@echo "Linking vim/.gvimrc to ~/.gvimrc"
	@ln -sf `pwd`/vim/.gvimrc ~/

install_inputrc:
	@echo "Linking .inputrc to ~/.inputrc"
	@ln -sf `pwd`/.inputrc ~/

install_bash_files:
	@echo "Linking bash/.bashrc to ~/.bashrc"
	@ln -sf `pwd`/bash/.bashrc ~/
	@echo "Linking bash/.bash_profile to ~/.bash_profile"
	@ln -sf `pwd`/bash/.bash_profile ~/

install_git_files:
	@echo "Linking git/.gitconfig to ~/.gitconfig"
	@ln -sf `pwd`/git/.gitconfig ~/

done:
	@echo
	@echo "Done. Enjoy! =]"
