# bash
alias ls="ls --color"
alias usage='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias setclip="xclip -selection clipboard"
alias rm="trash"
alias grep="grep --color=auto"
alias fvim='vim $(fzf)'

alias ls="ls --color=auto"
alias ll="ls -la"
alias l.="ls -d .* --color=auto"

alias cd..="cd .."
alias ..="cd .."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../../"
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."
alias scripts="cd ~/git_repo/linux_config"

# git
alias ga="git add . ; git status"
alias gs="git status"
alias gp="git push"
alias gps="git push --set-upstream"
alias gli="git log --decorate --oneline --branches"
alias glg="git log --graph --oneline --all --decorate"
alias gac="git add . ;git commit -m "
alias gc="git commit -m "
alias gr="git reset"
alias gco="git checkout"
alias gcob="git checkout -b"

# help
alias edit_aliases="vim ~/.bash_aliases"
alias aliases_help="cat $0"
alias gc_help="alias ga gs gp gps gli glg gac gc gr gco gcob"

# .bash_functions
DIR=$(dirname "$0")
source $DIR/.bash_functions.sh
