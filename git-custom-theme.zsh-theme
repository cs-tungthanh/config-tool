# vim:ft=zsh ts=2 sw=2 sts=2
# https://blog.carbonfive.com/writing-zsh-themes-a-quickref/
# https://fsymbols.com/signs/arrow/#apple 
# https://fsymbols.com/bubble/ - get text style

# return FolderName (on  master ↑1 ↓2)
git_info() {
  local current_branch="$(git symbolic-ref --short HEAD 2>/dev/null)"
  local remote_branch="$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)"
  local ahead=0 # count number of commit ahead
  local behind=0 # count number of commit behind

  if [[ -n "$remote_branch" ]]; then
    local rev_list=$(git rev-list --count --left-right "${current_branch}...${remote_branch}" 2>/dev/null)
    behind=$(echo "${rev_list}" | awk '{print $1}')
    ahead=$(echo "${rev_list}" | awk '{print $2}')
  fi

  if [[ -n "${current_branch}" ]]; then
    # on \ue0a0 master
    local branch_name_display="%{$fg[blue]%}on%{$reset_color%} \ue0a0 %{$fg[blue]%}${current_branch}%{$reset_color%}"
    
    # Compare current with remote branch
    local remote_status=""
    local ahead_color="%{$fg[red]%}↑${ahead}%{$reset_color%}"  # ↑1: red color
    local behind_color="%{$fg[green]%}↓${behind}%{$reset_color%}" # ↓1: green color
    if [[ ${ahead} -gt 0 && ${behind} -gt 0 ]]; then
      remote_status="${ahead_color} ${behind_color}"
    elif [[ ${ahead} -gt 0 ]]; then
      remote_status="${ahead_color}"
    elif [[ ${behind} -gt 0 ]]; then
      remote_status="${behind_color}"
    fi

    # check is not empty
    local git_info="${branch_name_display}"
    if [[ -n "$remote_status" ]]; then
        git_info+=" ${remote_status}"
    fi

    if [[ -n "$(git_prompt_status)" ]]; then
        git_info+=" $(git_prompt_status)"
    fi

    echo -n "(${git_info[@]})"
  fi
}

# define $(git_prompt_status)
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}[?]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[red]%}[+]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} 𝕄*"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}[✗]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ℂ"
ZSH_THEME_GIT_PROMPT_RENAMED=""
ZSH_THEME_GIT_PROMPT_BEHIND=""

PROMPT='%{$fg_bold[green]%}%1/%{$reset_color%} $(git_info)
➜ '
