# Prompt Functions
#============================
function git_dirty_status {
  [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working directory clean" ]] && echo "✓"
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "✗"
}

function git_branch_name {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}

function print_branch_name_and_status {
  if [[ -d ./.git ]]; then
    echo "($(git_branch_name) $(git_dirty_status))"
  else
    echo ""
  fi
}

function prompt {
  local       RED="\[\033[0;31m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local      CHAR="⏣ ⌬ "

  export PS1="\[\e]2;\u@\h\a[\[\e[37;44;1m\]\t\[\e[0m\]] \[\e[32m\]\W\[\e[0m\]$RED \$(print_branch_name_and_status)\n\[\e[0;31m\]$CHAR \[\e[0m\]"
         PS2='> '
         PS4='+ '
}

# Helpful Functions
# =====================
function desktop {
  cd /Users/$USER/Desktop/$@
}

function code {
  cd /Users/$USER/code/$@
}

# A function to easily grep for a matching process
# USE: psg postgres
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# A function to extract correctly any archive based on extension
# USE: extract imazip.zip
#      extract imatar.tar
function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1    ;;
      *.tar.gz)   tar xzf $1    ;;
      *.bz2)      bunzip2 $1    ;;
      *.rar)      rar x $1      ;;
      *.gz)       gunzip $1     ;;
      *.tar)      tar xf $1     ;;
      *.tbz2)     tar xjf $1    ;;
      *.tgz)      tar xzf $1    ;;
      *.zip)      unzip $1      ;;
      *.Z)        uncompress $1 ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
      echo "'$1' is not a valid file"
  fi
}
