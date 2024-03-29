# vim:ft=zsh ts=2 sw=2 sts=2
# https://blog.carbonfive.com/writing-zsh-themes-a-quickref/
# https://fsymbols.com/signs/arrow/#apple 
# https://fsymbols.com/bubble/ - get text style
# define $(git_prompt_info)
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="❗️"
ZSH_THEME_GIT_PROMPT_CLEAN="✨"

# define $(git_prompt_status)
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%} 𝕌"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} 𝔸✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} 𝕄*"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} 𝔻✗"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ℂ"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_BEHIND=" ⟲"

PROMPT='╭%{$fg_bold[green]%}%1/%{$reset_color%}$(git_prompt_info)$(git_prompt_status)
╰→ '

RPROMPT='%(?.✔.%{$fg[red]%}✘%f) %{$fg_bold[red]%}%*%{$reset_color%}'
LPROMPT=''
