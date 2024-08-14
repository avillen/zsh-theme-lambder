date_time() {
  echo "[%w | %T]"
}

current_directory() {
  echo "%{$fg[green]%}%2c%{$reset_color%}"
}

lambda_icon() {
  echo "%(!.#.%{$fg[cyan]%}λ%{$reset_color%})"
}

git_wip_alert() {
  echo "%{$fg[red]%}$(work_in_progress)%{$reset_color%}"
}

git_stash_count() {
  if [ -d .git ]; then
    echo "%{$fg[yellow]%}[$(git stash list | wc -l | sed 's/ //g')]%{$reset_color%}"
  else
    echo ""
  fi;
}

in_k8s_context() {
    kubectl config current-context > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

k8s_current_context() {
  echo "%{$fg[cyan]%}$(kubectl config current-context)%{$reset_color%}"
}

PROMPT='$(date_time) $(current_directory)$(git_prompt_info)$(git_stash_count) $(lambda_icon) $(git_wip_alert)'

if in_k8s_context; then
    RPROMPT='$(k8s_current_context)'
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" |> %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

