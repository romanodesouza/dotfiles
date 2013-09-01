Dependencies
=========
- [Vundle](https://github.com/gmarik/vundle)
- [Curl](http://curl.haxx.se/) (for Gist plugin)

Recommended
=========
- [Exuberant Ctags](http://ctags.sourceforge.net/)

Setup
=========
- Install [Vundle](https://github.com/gmarik/vundle)

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```
- Install the bundles

```
vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
```

Structure
=========
- `.vimrc` - Main config file
- `.gvimrc` - Additional config for gVim
- `./vim/bin/` - Utility softwares
- `./vim/bundle/` - Bundles installed by [Vundle](https://github.com/gmarik/vundle)
- `./vim/bundle-settings/` - Fine tuning of bundles
- `./vim/vundles.vim` - [Vundle](https://github.com/gmarik/vundle) central usage
- `./vim/bundle-settings.vim` - Loads the bundle settings
- `./vim/extra-filetypes.vim` - Set up non native filetypes

Customization
=========
Create and put it into `~/.vimrc.local` and/or `~/.gvimrc.local` files

Inspired by
=========
- My previous conf :P
- [skwp/dotfiles](https://github.com/skwp/dotfiles/)
- [lfilho/vimfiles](https://github.com/lfilho/vimfiles/)
