PROMPT='[%w | %T] %{$fg[green]%}%2c%{$reset_color%}$(git_prompt_info) %(!.#.%{$fg[cyan]%}λ%{$reset_color%}) %{$fg[red]%}$(work_in_progress)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" |> %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
