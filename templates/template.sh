#!/usr/bin/env bash

## declare a 'usage function.'
## Will be called from $BASEPATH/.functions
function usage {
  echo "SYNOPSIS: $0 branch [options] Checkout a branch cross-repo"
  exit 1
}

BASEPATH=$(dirname "$0")
source "$BASEPATH/.functions"

get_additional_arg "--some-nice-flag" "DO_AWESOMENESS"

BRANCH=${BRANCH:-"$DEFAULT_BRANCH"}

if [[ -n "$(get_repo "${ARGS[@]}")" ]]; then
  set_repos "$(get_repo "${ARGS[@]}")"
  ARGS=("${ARGS[@]:1}")
fi

for REPO in "${REPOS[@]}"
do
  (
    [[ -z "${REPO// /}" ]] && continue
    
    REPODIR=$(expand_path "$REPO")
    [[ ! -d "$REPODIR" || ! -d "$REPODIR/.git" ]] && >&2 echo "$REPODIR is not a valid git repository" && continue

    cd "$REPODIR"
    BASENAME=$(basename $(pwd))
    
    if [[ "${DO_FETCH:-"$PRE_FETCH"}" -eq "1" ]]; then
      info "[$BASENAME] fetching remote..."
      git fetch
    fi

    if [[ ! -z "$(git branch -r | grep "$BRANCH")" ]]; then 
      info "[$BASENAME] Checking out '$BRANCH'..."
      git checkout ${ARGS[@]} $BRANCH
    else
      warn "[$BASENAME] Branch '$BRANCH' not found, checking out master..."
      git checkout ${ARGS[@]} master
    fi

    if [[ "${DO_PULL:-"$POST_PULL"}" -eq "1" ]]; then
      info "[$BASENAME] pulling remote for changes..."
      git pull
    fi

    if [[ "${DO_PRUNE:-"$PRUNE_REMOTE"}" -eq "1" ]]; then
      info "[$BASENAME] pruning remote origin..."
      git remote prune origin
    fi
    
    cd "$CURR_DIR"
  )
done
