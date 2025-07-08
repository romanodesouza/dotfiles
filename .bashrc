[ -f ~/.sensible.bash ] && . ~/.sensible.bash
[ -f /etc/bash_completion ] && ! shopt -oq posix && . /etc/bash_completion

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

setup-lang() {
	case $1 in
		go)
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
	esac
}

alias mount='mount | column -t'

# Remove all containers
alias dr='docker ps -aq | xargs docker stop | xargs docker rm 2>/dev/null'
# Remove all <none> images
alias drn="docker images -a | grep '<none>' | awk '{print \$3}' | xargs docker rmi 2>/dev/null"

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alF'

which nvim >/dev/null && alias vim='nvim'

alias python='python3'
alias pip='pip3'

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\]$(git_info)\[\033[01;34m\]\[\033[00m\]\n\$ '
eval "$(fzf --bash)"

[ -f ~/.bashrc.local ] && . ~/.bashrc.local
