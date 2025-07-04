TERM=xterm-256color
GOPATH=$HOME/go
GOROOT=$HOME/opt/go/activated

PATH="$HOME/bin:$HOME/.local/bin:$PATH"
PATH="$HOME/.fzf/bin:$PATH"
PATH="$GOROOT/bin:$PATH"
PATH="$GOPATH/bin:$PATH"
PATH="$JAVA_HOME/bin:$PATH"

[ -f ~/.profile.local ] && . ~/.profile.local
