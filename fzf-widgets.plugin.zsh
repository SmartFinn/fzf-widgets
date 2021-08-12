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
    bindkey '^@dc' fzf-docker-remove-containers
    bindkey '^@di' fzf-docker-remove-images
    bindkey '^@dv' fzf-docker-remove-volumes
    bindkey '^@dk' fzf-docker-kill-containers
    bindkey '^@dl' fzf-docker-logs-container
    bindkey '^@dr' fzf-docker-start-containers
    bindkey '^@ds' fzf-docker-stop-containers
  fi

  ## Podman
  if (( $+commands[podman] )); then
    bindkey '^@p'  fzf-select-podman-widget
    bindkey '^@pc' fzf-podman-remove-containers
    bindkey '^@pi' fzf-podman-remove-images
    bindkey '^@pv' fzf-podman-remove-volumes
    bindkey '^@pk' fzf-podman-kill-containers
    bindkey '^@pl' fzf-podman-logs-container
    bindkey '^@pr' fzf-podman-start-containers
    bindkey '^@ps' fzf-podman-stop-containers
  fi
fi

if (( $+commands[fd] )); then
  # use fd for finding directories and files
  FZF_CHANGE_DIR_FIND_COMMAND="fd -t d"
  FZF_INSERT_DIR_FIND_COMMAND="fd -t d"
  FZF_INSERT_FILE_COMMAND="fd -t f"
  FZF_EDIT_FILES_COMMAND="fd -t f"
fi
