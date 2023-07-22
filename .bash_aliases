alias mount='mount | column -t'

# Remove all containers
alias dr='docker ps -aq | xargs docker stop | xargs docker rm 2>/dev/null'
# Remove all <none> images
alias drn="docker images -a | grep '<none>' | awk '{print \$3}' | xargs docker rmi 2>/dev/null"

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alF'

alias vim='nvim'
