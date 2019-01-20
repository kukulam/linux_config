function cd() { builtin cd "$@" && ls; }

function bitbucket_repo {
	if [ -z "$1" ]
		then
			echo "No argument supplied"
	fi
	reponame=$1
    username="kukulam"
	password=$(<~/.credentials/bitbucket_token)

    curl POST -v -u $username:$password -H "Content-Type: application/json" \
    https://api.bitbucket.org/2.0/repositories/kukulam/$reponame \
    -d '{"scm": "git", "is_private": "true", "fork_policy": "no_public_forks" }'

    git clone git@bitbucket.org:$username/$reponame.git
}

function github_repo {
    if [ -z "$1" ]
		then
			echo "No argument supplied"
	fi
	reponame=$1
    username="kukulam"
	password=$(<~/.credentials/github_token)
	
	curl -u $username:$password https://api.github.com/user/repos -d "{\"name\":\"$reponame\", \"private\":\"true\"}"
    
	git clone git@github.com:$username/$reponame.git
}

function extract() {
 if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}
