#vi:ft=bash

parse_git_branch() {
    local DIRTY STATUS
    STATUS=$(git status --porcelain 2>/dev/null)
    [ $? -eq 128 ] && return
    [ -z "$(echo "$STATUS" | grep -e '^ M')"    ] || DIRTY="*"
    [ -z "$(echo "$STATUS" | grep -e '^[MDA]')" ] || DIRTY="${DIRTY}+"
    [ -z "$(git stash list)" ]                    || DIRTY="${DIRTY}^"
    echo "($(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* //')$DIRTY)"
}

delete_broken_links() {
    for i in $(file * | grep broken | cut -d : -f 1); do rm $i; done
}

dsh() {
    docker exec -ti $1 bash 2>/dev/null || \
    docker exec -ti $1 sh
}

install-go-dev-tools() {
    print_cmd go get github.com/alecthomas/gometalinter
    print_cmd go get github.com/golang/lint/golint
    print_cmd go get github.com/nsf/gocode
    print_cmd go get github.com/rogpeppe/godef
    print_cmd go get golang.org/x/tools/cmd/goimports
    print_cmd go get golang.org/x/tools/cmd/gorename
    print_cmd go get golang.org/x/tools/cmd/oracle
    print_cmd go get golang.org/x/tools/refactor/rename

    print_cmd gometalinter --install --update
}

print_cmd() {
    echo $@
    eval $@
}
