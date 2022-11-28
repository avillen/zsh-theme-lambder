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
    echo "%{$fg[yellow]%}[$(git stash list | wc -l)]%{$reset_color%}"
  else
    echo ""
  fi;
}

k8s_current_context() {
  echo "%{$fg[cyan]%}$(kubectl config current-context)%{$reset_color%}"
}


PROMPT='$(date_time) $(current_directory)$(git_prompt_info)$(git_stash_count) $(lambda_icon) $(git_wip_alert)'

RPROMPT='$(k8s_current_context)'

ZSH_THEME_GIT_PROMPT_PREFIX=" |> %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

