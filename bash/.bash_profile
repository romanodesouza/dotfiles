function parse_git_branch() {
  local DIRTY STATUS
  STATUS=$(git status --porcelain 2>/dev/null)
  [ $? -eq 128 ] && return
  [ -z "$(echo "$STATUS" | grep -e '^ M')"    ] || DIRTY="*"
  [ -z "$(echo "$STATUS" | grep -e '^[MDA]')" ] || DIRTY="${DIRTY}+"
  [ -z "$(git stash list)" ]                    || DIRTY="${DIRTY}^"
  echo "($(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* //')$DIRTY)"
}

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\]$(parse_git_branch)\[\033[01;34m\]\[\033[00m\]\$ '

# Golang
export GOROOT=/usr/local/go
export GOPATH=~/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# Scala
export PATH=$PATH:/usr/local/scala/bin
# Java
export PATH=$PATH:/usr/local/jdk/bin
# NodeJS
export PATH=$PATH:/usr/local/node/bin
