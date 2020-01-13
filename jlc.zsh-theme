# smt.zsh-theme, based on dogenpunk by Matthew Nelson.
local return_status="%(?.%{$fg[green]%}✓.%{$fg[red]%} %? ✗)%{$reset_color%} "
function jlc_git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}"
  fi
}
ZSH_THEME_GIT_PROMPT_PREFIX=" ᚠ "

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg_bold[yellow]%}"
#ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

function prompt_char() {
  git branch >/dev/null 2>/dev/null && echo "%{$fg[green]%}±%{$reset_color%}" && return
  echo "%{$fg[cyan]%}◯%{$reset_color%}"
}

function which_machine() {
    unameOut="$(uname -a)"
    case "$unameOut" in
        Linux?????-desktop* )     echo "work";;
        Darwin?????-lapto*)    echo "lap";;
        Linux?Fuzzy*)    echo "home";;
    esac

}
PROMPT='%{%B$fg[green]%}jlc@$(which_machine)%b %{$fg[cyan]%}%~ ➤ %{$reset_color%}'
RPROMPT='${return_status}%{$fg[magenta]%}[%T]%{$reset_color%} %{$reset_color%}$(git_prompt_short_sha)$(jlc_git_prompt_info)%{$reset_color%}'
