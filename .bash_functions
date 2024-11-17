#vi:ft=bash

git_info() {
	[ -x "$(which git)" ] || return    # git not found

	local git_branch_symbol='⑂ '
	local git_branch_changed_symbol='+'
	local git_need_push_symbol='⇡'
	local git_need_pull_symbol='⇣'
	local git_eng="env LANG=C git"	 # force git output in English to make our work easier
	# get current branch name or short SHA1 hash for detached head
	local branch="$($git_eng symbolic-ref --short HEAD 2>/dev/null || $git_eng describe --tags --always 2>/dev/null)"
	[ -n "$branch" ] || return	# git branch not found

	local marks

	# branch is modified?
	[ -n "$($git_eng status --porcelain)" ] && marks+=" $git_branch_changed_symbol"

	# how many commits local branch is ahead/behind of remote?
	local stat="$($git_eng status --porcelain --branch | grep '^##' | grep -o '\[.\+\]$')"
	local aheadN="$(echo $stat | grep -o 'ahead [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
	local behindN="$(echo $stat | grep -o 'behind [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
	[ -n "$aheadN" ] && marks+=" $git_need_push_symbol$aheadN"
	[ -n "$behindN" ] && marks+=" $git_need_pull_symbol$behindN"

	# print the git branch segment without a trailing newline
	printf " $git_branch_symbol$branch$marks "
}

delete_broken_links() {
	for i in $(file * | grep broken | cut -d : -f 1); do rm $i; done
}

dsh() {
	local container=$1
	if [ -z $container ]; then
		container=$(docker ps --format '{{.Names}}' | fzf);
	fi
	docker exec -ti $container bash 2>/dev/null || \
		docker exec -ti $container sh
}

govm() {
	case $1 in
		use)
			local version=$2
			local dest=~/opt/go/$version
			if [ ! -d $dest ]; then
				local file=go$version.linux-amd64.tar.gz
				wget https://storage.googleapis.com/golang/$file
				mkdir -p $dest
				tar -xvf $file -C $dest/
				rm -f $file
			fi
			rm ~/opt/go/activated 2>/dev/null
			ln -s $dest/go ~/opt/go/activated
			export GOPATH=~/go
		;;

		install-dev-tools)
			print_nrun go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
			print_nrun go get -u golang.org/x/lint/golint
			print_nrun go get -u github.com/mdempsky/gocode
			print_nrun go get -u github.com/rogpeppe/godef
			print_nrun go get -u golang.org/x/tools/cmd/goimports
			print_nrun go get -u golang.org/x/tools/cmd/gorename
			print_nrun go get -u golang.org/x/tools/cmd/guru
			print_nrun go get -u golang.org/x/tools/refactor/rename
			print_nrun go get -u github.com/kr/pretty
			print_nrun go get -u github.com/fatih/gomodifytags
		;;
	esac
}

print_nrun() {
	echo $@
	eval $@
}