# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export TERM=xterm-256color
export GOPATH=$HOME/go
export GOROOT=$HOME/opt/go/activated
export FZF_DEFAULT_COMMAND="(git ls-files --others --exclude-standard && git ls-files) | egrep -v '^(vendor|node_modules)/' || rg --files --hidden -g '!{.git,vendor,node_modules}/*' || find . -type f"

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
PATH="$HOME/.fzf/bin:$PATH"
PATH="$GOROOT/bin:$PATH"
PATH="$GOPATH/bin:$PATH"
PATH="$JAVA_HOME/bin:$PATH"

# local config
[ -f ~/.profile.local ] && . ~/.profile.local
