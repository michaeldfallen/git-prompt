#! /usr/bin/env zsh

dot="$(cd "$(dirname "$0")"; pwd)"
args=$@
source "$dot/radar-base.sh"

if is_repo; then
  autoload colors && colors

  prepare_zsh_colors
  printf '%s' "${COLOR_GIT_WRAPPER}git:(${RESET_COLOR_WRAPPER}"
  if show_remote_status $args; then
    color_remote_commits
  fi
  readable_branch_name
  color_local_commits
  printf '%s' "${COLOR_GIT_WRAPPER})${RESET_COLOR_WRAPPER}"
  color_changes_status
fi
