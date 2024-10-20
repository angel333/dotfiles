export EDITOR=nvim
export VISUAL=nvim

alias vim=nvim
alias vi=nvim
alias vimdiff='nvim -d'

alias puw='sudo pacman -Syuw --noconfirm'
alias pu='sudo pacman -Su'

alias o='nvim ~/Documents/Obsidian_Vault'

# Function to get the current git branch
get_git_branch() {
  git branch 2> /dev/null | grep '*' | sed 's/* //'
}

# Set PS1
export PS1='[%n@%m $(get_git_branch) %2~]$ '

# Ensure the function is loaded in the shell
autoload -Uz add-zsh-hook

# Hook to update the prompt with the current git branch
precmd() {
  local git_branch=$(get_git_branch)
  if [ -n "$git_branch" ]; then
    PS1='[%n@%m '$git_branch' %2~]$ '
  else
    PS1='[%n@%m %2~]$ '
  fi
}

# Apply the hook
add-zsh-hook precmd precmd

# usual key Emacs bindings
bindkey -e

# enable autocomplete for hidden files without first writing a dot
setopt globdots

# enable completion
autoload -U compinit
compinit
