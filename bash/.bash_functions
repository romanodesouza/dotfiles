#vi:ft=bash

parse_git_branch(){
    local DIRTY STATUS
    STATUS=$(git status --porcelain 2>/dev/null)
    [ $? -eq 128 ] && return
    [ -z "$(echo "$STATUS" | grep -e '^ M')"    ] || DIRTY="*"
    [ -z "$(echo "$STATUS" | grep -e '^[MDA]')" ] || DIRTY="${DIRTY}+"
    [ -z "$(git stash list)" ]                    || DIRTY="${DIRTY}^"
    echo "($(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* //')$DIRTY)"
}

newgo(){
    local project_name=$1
    local go_version=$2

    [ -z "$project_name" ] && echo "Give the project name." && return 1
    [ -z "$go_version" ] && echo "Give the Go version desired." && return 1

    mkdir $project_name
    cd $project_name
    git init .

    gvm install "go${go_version}" --name="${project_name}" --binary
    gvm use $project_name
    gvm linkthis

    go get golang.org/x/tools/cmd/goimports
    go get golang.org/x/tools/cmd/oracle
    go get golang.org/x/tools/cmd/gorename
    go get golang.org/x/tools/refactor/rename
    go get github.com/golang/lint
    go get github.com/nsf/gocode
    go get code.google.com/p/rog-go/exp/cmd/godef

    go get github.com/tools/godep
    go get github.com/flosch/pongo2
    go get github.com/gin-gonic/gin
    go get github.com/codegangsta/cli
}

delete_broken_links(){
    for i in $(file * | grep broken | cut -d : -f 1); do rm $i; done
}

# Docker functions based on: https://github.com/jfrazelle/dotfiles/blob/master/.dockerfunc
ab(){
    docker run --rm --pid host --name ab jess/ab "$@"
}

htop(){
    docker run --rm -it --pid host --name htop jess/htop
}

dsh(){
    docker exec -ti $1 bash 2>/dev/null || \
    docker exec -ti $1 sh
}

dme() {
    eval "$(docker-machine env $@)"
}
