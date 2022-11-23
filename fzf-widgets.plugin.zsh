#!/bin/zsh

export FZF_WIDGET_ROOT="$0:a:h"

source "$FZF_WIDGET_ROOT"/init.zsh

if [ -z "$FZF_WIDGET_NO_BINDING" ]; then
  # Map widgets to key
  bindkey '^@'  fzf-select-widget
  bindkey '^@.' fzf-edit-dotfiles
  bindkey '^@c' fzf-change-directory
  bindkey '^@n' fzf-change-named-directory
  bindkey '^@f' fzf-edit-files
  bindkey '^@k' fzf-kill-processes
  bindkey '^@s' fzf-exec-ssh
  bindkey '^\'  fzf-change-recent-directory
  bindkey '^r'  fzf-insert-history
  bindkey '^xf' fzf-insert-files
  bindkey '^xd' fzf-insert-directory
  bindkey '^xn' fzf-insert-named-directory

  ## Git
  if (( $+commands[git] )); then
    bindkey '^@g'  fzf-select-git-widget
    bindkey '^@ga' fzf-git-add-files
    bindkey '^@gc' fzf-git-change-repository
  fi

  # GitHub
  if (( $+commands[gh] )); then
    bindkey '^@h'  fzf-select-github-widget
    bindkey '^@hc' fzf-github-close-issue
    bindkey '^@he' fzf-github-edit-issue
    bindkey '^@hm' fzf-github-comment-issue
    bindkey '^@hp' fzf-github-pr-checkout
    bindkey '^@hr' fzf-github-reopen-issue
    bindkey '^@hv' fzf-github-view-issue
  fi

  ## Docker
  if (( $+commands[docker] )); then
    bindkey '^@d'  fzf-select-docker-widget
    bindkey '^@dc' fzf-docker-containers-remove
    bindkey '^@di' fzf-docker-images-remove
    bindkey '^@dv' fzf-docker-volumes-remove
    bindkey '^@dk' fzf-docker-containers-kill
    bindkey '^@dl' fzf-docker-container-logs
    bindkey '^@dr' fzf-docker-containers-start
    bindkey '^@ds' fzf-docker-containers-stop
  fi

  ## Podman
  if (( $+commands[podman] )); then
    bindkey '^@p'   fzf-select-podman-widget
    bindkey '^@pc'  fzf-podman-containers-remove
    bindkey '^@pi'  fzf-podman-images-remove
    bindkey '^@pv'  fzf-podman-volumes-remove
    bindkey '^@pk'  fzf-podman-containers-kill
    bindkey '^@pl'  fzf-podman-container-logs
    bindkey '^@pr'  fzf-podman-containers-start
    bindkey '^@ps'  fzf-podman-containers-stop
    bindkey '^@pps' fzf-podman-pods-stop
    bindkey '^@ppr' fzf-podman-pods-remove
    bindkey '^@ppl' fzf-podman-pod-logs
  fi
fi

if (( $+commands[fd] )); then
  # use fd for finding directories and files
  FZF_CHANGE_DIR_FIND_COMMAND="fd -t d"
  FZF_INSERT_DIR_FIND_COMMAND="fd -t d"
  FZF_INSERT_FILE_COMMAND="fd -t f"
  FZF_EDIT_FILES_COMMAND="fd -t f"
fi
