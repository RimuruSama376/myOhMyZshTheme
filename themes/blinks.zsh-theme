# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{green}%}🌹 %{%f%k%b%}"
  else
    echo '%{%F{red}%}🥀 %{%f%k%b%}'
  fi
}

function _on_branch() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    # echo "%f%{%F{green}%}%{\n%}%BOn Branch:-"
    echo "%{\n%}%B%{%F{#ff66cc}%}$(basename $(git rev-parse --show-toplevel))%{%f%k%b%} "
  else
    # echo '%f%{%F{red}%}%{\n%}%BNo active repo'
    echo ''
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{%B%F{green}%}[%{%B%F{#3333ff}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%B%F{green}%}%n%{%B%F{blue}%}%{%B%F{green}%} %{%b%F{yellow}%}%d %{%F{#66ffff}%B%}%D{%a,%b%d}%@$(_on_branch)$(git_prompt_info)%E%{%f%k%b%}
%{%b%f%}$(_prompt_char)'

RPROMPT=''
