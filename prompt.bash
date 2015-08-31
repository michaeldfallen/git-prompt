#! /usr/bin/env bash

dot="$(cd "$(dirname "$0")"; pwd)"
args=$@
commits_prefix=" git:"
source "$dot/radar-base.sh"

if is_repo; then
  # using parameter expasion to allow the ENV variable to be set to empty ("")
  # see: http://www.gnu.org/software/bash/manual/bashref.html#Shell-Parameter-Expansion
  if [ ${GIT_RADAR_COMMITS_PREFIX+x} ]; then
    commits_prefix=$GIT_RADAR_COMMITS_PREFIX
  fi
  printf "\x01\033[1;30m\x02$commits_prefix(\x01\033[0m\x02"
  if show_remote_status $args; then
    bash_color_remote_commits
  fi
  readable_branch_name
  bash_color_local_commits
  printf "\x01\033[1;30m\x02)\x01\033[0m\x02"
  bash_color_changes_status
fi
