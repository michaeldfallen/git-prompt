#! /usr/bin/env bash

prepare_tmux_colors() {
  if [ -f "$rcfile_path/.gitradarrc.zsh" ]; then
    source "$rcfile_path/.gitradarrc.zsh"
  elif [ -f "$rcfile_path/.gitradarrc" ]; then
    source "$rcfile_path/.gitradarrc"
  fi

  PRINT_F_OPTION="%s"

  COLOR_REMOTE_AHEAD="${GIT_RADAR_COLOR_REMOTE_AHEAD:-#[fg=green]}"
  COLOR_REMOTE_BEHIND="${GIT_RADAR_COLOR_REMOTE_BEHIND:-#[fg=red]}"
  COLOR_REMOTE_DIVERGED="${GIT_RADAR_COLOR_REMOTE_DIVERGED:-#[fg=yellow]}"
  COLOR_REMOTE_NOT_UPSTREAM="${GIT_RADAR_COLOR_REMOTE_NOT_UPSTREAM:-#[fg=red]}"

  COLOR_LOCAL_AHEAD="${GIT_RADAR_COLOR_LOCAL_AHEAD:-#[fg=green]}"
  COLOR_LOCAL_BEHIND="${GIT_RADAR_COLOR_LOCAL_BEHIND:-#[fg=red]}"
  COLOR_LOCAL_DIVERGED="${GIT_RADAR_COLOR_LOCAL_DIVERGED:-#[fg=yellow]}"

  COLOR_CHANGES_STAGED="${GIT_RADAR_COLOR_CHANGES_STAGED:-#[fg=green]}"
  COLOR_CHANGES_UNSTAGED="${GIT_RADAR_COLOR_CHANGES_UNSTAGED:-#[fg=red]}"
  COLOR_CHANGES_CONFLICTED="${GIT_RADAR_COLOR_CHANGES_CONFLICTED:-#[fg=yellow]}"
  COLOR_CHANGES_UNTRACKED="${GIT_RADAR_COLOR_CHANGES_UNTRACKED:-#[fg=white]}"

  COLOR_STASH="${GIT_RADAR_COLOR_STASH:-#[fg=yellow]}"

  local italic_m="$(printf '\xF0\x9D\x98\xAE')"

  COLOR_BRANCH="${GIT_RADAR_COLOR_BRANCH:-#[fg=default]}"
  MASTER_SYMBOL="${GIT_RADAR_MASTER_SYMBOL:-"#[fg=default]$italic_m#[fg=default]"}"

  PROMPT_FORMAT="${GIT_RADAR_FORMAT:-" #[fg=black,bright]git:(#[fg=default]%{remote: }%{branch}%{ :local}#[fg=black,bright])#[fg=default]%{ :stash}%{ :changes}"}"

  RESET_COLOR_LOCAL="${GIT_RADAR_COLOR_LOCAL_RESET:-#[fg=default]}"
  RESET_COLOR_REMOTE="${GIT_RADAR_COLOR_REMOTE_RESET:-#[fg=default]}"
  RESET_COLOR_CHANGES="${GIT_RADAR_COLOR_CHANGES_RESET:-#[fg=default]}"
  RESET_COLOR_BRANCH="${GIT_RADAR_COLOR_BRANCH_RESET:-#[fg=default]}"
  RESET_COLOR_STASH="${GIT_RADAR_COLOR_STASH:-#[fg=default]}"
}
