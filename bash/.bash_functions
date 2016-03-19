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
