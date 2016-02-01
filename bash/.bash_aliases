alias emacs="XLIB_SKIP_ARGB_VISUALS=1 XMODIFIERS= emacs"
alias mount='mount | column -t'
alias g='git'
alias ..='cd ..'
alias -- -='cd -'

# Vagrant
alias vup='vagrant up && vagrant ssh'
alias vupx='vagrant up --provider=lxc && vagrant ssh'
alias vsh='vagrant ssh'

# Docker
alias d='docker'
alias dm='docker-machine'
alias dc='docker-compose'
# Remove all containers
alias dr='docker ps -aq | xargs docker stop | xargs docker rm 2>/dev/null'
# Remove all <none> images
alias drn="docker images -a | grep '<none>' | awk '{print \$3}' | xargs docker rmi 2>/dev/null"
