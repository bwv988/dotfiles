# Add this to bash profile
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="[\[\e[33;1;40m\]\t\[\e[0m\]][\u@\h:\[\e[37;1;40m\]\w\[\e[0m\]]\$ "

alias ls="ls --color=auto"

# This adds the current git branch to the PS1 string started above.
function execute_parse {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Add a little space...
function parse_git_branch {
  local ret
  if [ -z "$(execute_parse)" ]; then
    ret=""
  else
    ret=" $(execute_parse)"
  fi
  echo "$ret"
}

function proml {
local WHITE='\e[0m'
local GREEN='\e[0;32m'
PS1="[\[\e[33;1;40m\]\t\[\e[0m\]][\u@\h:\[\e[37;1;40m\]\w\[\e[0m\]\[$GREEN\]\$(parse_git_branch)\[$WHITE\]]\$ "
PS2='> '
PS4='+ '
}

proml
