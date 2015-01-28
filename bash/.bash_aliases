alias mount='mount | column -t'

# Vagrant
alias vup='vagrant up && vagrant ssh'
alias vupx='vagrant up --provider=lxc && vagrant ssh'
alias vsh='vagrant ssh'

# Docker
# Remove all containers
alias dr='docker ps -aq | xargs docker stop | xargs docker rm 2>/dev/null'
# Remove all <none> images
alias drn="docker images -aq | grep '<none>' | awk '{print \$3}' | xargs docker rmi 2>/dev/null"
