all: help

help:
	@echo "Make a backup of your files, run 'make install' and be happy :)"

install: copy_vim_dir copy_vimrc copy_gvimrc done

copy_vim_dir:
	@echo "Linking .vim/ directory to ~/.vim/"
	@ln -sf `pwd`/vim/.vim/ ~/

copy_vimrc:
	@echo "Linking .vimrc to ~/.vimrc"
	@ln -sf `pwd`/vim/.vimrc ~/

copy_gvimrc:
	@echo "Linking .gvimrc to ~/.gvimrc"
	@ln -sf `pwd`/vim/.gvimrc ~/

done:
	@echo
	@echo "Done. Enjoy! =]"
