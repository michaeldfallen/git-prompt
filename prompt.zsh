#! /usr/bin/env zsh

dot="$(cd "$(dirname "$0")"; pwd)"
args=$@
commits_prefix=" git:"
source "$dot/radar-base.sh"

if is_repo; then
  autoload colors && colors
  # using parameter expasion to allow the ENV variable to be set to empty ("")
  # see: http://www.gnu.org/software/bash/manual/bashref.html#Shell-Parameter-Expansion
  if [ ${GIT_RADAR_COMMITS_PREFIX+x} ]; then
    commits_prefix=$GIT_RADAR_COMMITS_PREFIX
  fi
  printf '%s' "%{$fg_bold[black]%}$commits_prefix(%{$reset_color%}"
  if show_remote_status $args; then
    zsh_color_remote_commits
  fi
  readable_branch_name
  zsh_color_local_commits
  printf '%s' "%{$fg_bold[black]%})%{$reset_color%}"
  zsh_color_changes_status
fi
