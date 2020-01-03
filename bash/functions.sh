# Prompt Functions
#============================
function git_dirty_status {
  [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working tree clean" ]] && echo "✓"
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "✗"
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
  local RED="\[\033[0;31m\]"
  local CHAR="⏣ ⌬ "

  export PS1="\[\e]2;\u@\h\a[\t\[\e[0m\]] \[\e[32m\]\W\[\e[0m\]$RED \$(print_branch_name_and_status)\n\[\e[0;31m\]$CHAR \[\e[0m\]"
         PS2='> '
         PS4='+ '
}

# Helpful Functions
# =====================
function desktop {
  cd /Users/$USER/Desktop/$@
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

function nom () {
  if [[ -f ./package.json ]]; then
    rm -rf ./node_modules/
    npm cache clean
    npm install
  else
    echo "no package.json present"
  fi
}

# AWS MFA / Temp credential helpers
function clear_sts_creds () {
  unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
}

function refresh_sts_creds () {
  # check to see if MFA_SERIAL is set
  if [ "$MFA_SERIAL" = "" ] ; then
    echo "MFA_SERIAL not set"
    return 2
  fi

  # check to see if credentials for today exist
  # override with force if necessary
  # if they do source them and exit
  TMP_CRED_FILE_PATH="/tmp/sts-creds-`date +%m-%d-%Y`.sh"
  if [ "$1" != "--force" ] && [ "$1" != "-f" ] && [ -e "/tmp/sts-creds-`date +%m-%d-%Y`.sh" ] ; then
    echo "using existing credentials, to override run \"refresh_sts_creds --force\""
    source $TMP_CRED_FILE_PATH
    return 0
  fi

  clear_sts_creds # You can't use tokens to get tokens, so start clean

  echo -n "MFA Code: "
  read MFA_TOKEN

  # trim white space
  MFA_TOKEN="$(echo -e "${MFA_TOKEN}" | tr -d '[:space:]')"

  # get credientials from AWS that last one day
  CREDS=$(aws sts get-session-token --duration-seconds 86400 --serial-number $MFA_SERIAL --token-code $MFA_TOKEN \
            --output text --query 'Credentials.[AccessKeyId, SecretAccessKey, SessionToken]')

  unset MFA_TOKEN
  # set credientials for window
  if [ $? -eq 0 ] ; then
    AWS_ACCESS_KEY_ID=$(echo "$CREDS" | awk '{print $1}')
    AWS_SECRET_ACCESS_KEY=$(echo "$CREDS" | awk '{print $2}')
    AWS_SESSION_TOKEN=$(echo "$CREDS" | awk '{print $3}')
    export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
  # store credentials in /tmp for other windows to access
    printf "export AWS_ACCESS_KEY_ID=\"${AWS_ACCESS_KEY_ID}\"
export AWS_SECRET_ACCESS_KEY=\"${AWS_SECRET_ACCESS_KEY}\"
export AWS_SESSION_TOKEN=\"${AWS_SESSION_TOKEN}\"
" > $TMP_CRED_FILE_PATH
  fi
  unset CREDS

  return 0
}
