function parse_git_branch() {
  local DIRTY STATUS
  STATUS=$(git status --porcelain 2>/dev/null)
  [ $? -eq 128 ] && return
  [ -z "$(echo "$STATUS" | grep -e '^ M')"    ] || DIRTY="*"
  [ -z "$(echo "$STATUS" | grep -e '^[MDA]')" ] || DIRTY="${DIRTY}+"
  [ -z "$(git stash list)" ]                    || DIRTY="${DIRTY}^"
  echo "($(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* //')$DIRTY)"
}

function godep_workspace_gopath() {
  # Backup current $PATH
  if [ -z "$GODEP_WORKSPACE_BACKUP_GOPATH" ]; then
    export GODEP_WORKSPACE_BACKUP_GOPATH=$GOPATH
  fi

  godep path 2>/dev/null 1>/dev/null && export GOPATH="`godep path`:$GODEP_WORKSPACE_BACKUP_GOPATH" || export GOPATH=$GODEP_WORKSPACE_BACKUP_GOPATH
}

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\]$(parse_git_branch)\[\033[01;34m\]\[\033[00m\]\$ '

# Golang
export GOROOT=/usr/local/go
export GOPATH=~/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PROMPT_COMMAND="type -t godep_workspace_gopath 1>/dev/null && godep_workspace_gopath;$PROMPT_COMMAND"
# Scala
export PATH=$PATH:/usr/local/scala/bin
# Java
export PATH=$PATH:/usr/local/jdk/bin
# NodeJS
export PATH=$PATH:/usr/local/node/bin
# Python
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
