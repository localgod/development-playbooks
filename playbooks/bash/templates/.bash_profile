export COLORTERM=xterm
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=/usr/bin/vim
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GREP_OPTIONS='-n --color=always'
export HISTCONTROL=ignoredups

alias vi='vim'

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"

function find_git_branch {
  local dir=. head
  until [ "$dir" -ef / ]; do
      if [ -f "$dir/.git/HEAD" ]; then
          head=$(< "$dir/.git/HEAD")
          if [[ $head == ref:\ refs/heads/* ]]; then
              git_branch=" ${head#*/*/}"
          elif [[ $head != '' ]]; then
              git_branch=' (detached)'
          else
              git_branch=' (unknown)'
          fi
          return
      fi
      dir="../$dir"
  done
  git_branch=''
}

magenta=$'\e[1;35m'
normal_colours=$'\e[m'

export PS1="\u@vagrant:\w\[$magenta\]\$git_branch\[$normal_colours\] \\$ "
