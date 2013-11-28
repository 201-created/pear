reset_git_variables() {
  git_branch=""
  git_dirty=""
  git_remote=""
}

parse_git() {
  local status=$(git status 2> /dev/null)
  local branch_pattern="^# On branch ([^${IFS}]*)"
  local remote_pattern="# Your branch is ([a-z]+)"
  local diverge_pattern="# Your branch and (.*) have diverged"

  if [[ "${status}" == "" ]]; then
    return
  fi

  if [[ ! ${status} =~ "working directory clean" ]]; then
    git_dirty="+"
  fi

  if [[ ${status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      git_remote="↑"
    else
      git_remote="↓"
    fi
  fi

  if [[ ${status} =~ ${diverge_pattern} ]]; then
    git_remote="↕"
  fi

  if [[ ${status} =~ ${branch_pattern} ]]; then
    git_branch=" ${BASH_REMATCH[1]}"
  fi
}

export PROMPT_COMMAND="reset_git_variables; parse_git; $PROMPT_COMMAND"

export PS1="[\W\$git_branch\$git_remote\$git_dirty] "

