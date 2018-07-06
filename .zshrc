export ZSH="/home/rzheng/.oh-my-zsh"

# general settings
stty -ixon
[[ ":$PATH:" != *":$HOME/.bin:"* ]] && export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export PAGER="less"
export LESS="-R"
export EDITOR="vim"
export KEYTIMEOUT=1

# aliases
alias ll='ls -lh'
alias lla='ls -lAh'
alias cdr='cd $(git rev-parse --show-toplevel 2>/dev/null)'
alias pbcopy='xclip -sel clip'
alias gists='git diff --staged | gist -t diff'
alias gcan='git commit --amend --no-edit'
local ETSYWEB_DIR="${HOME}/development/Etsyweb/"
alias ce='cd "$ETSYWEB_DIR"'
alias cg='cd "${ETSYWEB_DIR}phplib/GoogleAds/AdWordsSDK"'
alias cgt='cd "${ETSYWEB_DIR}tests/phpunit/GoogleAds/AdWordsSDK"'
alias gs='git status'
alias ga='git add .'
alias ep='etsync push'
alias vi='vim'
alias vimbroken='vim -u NONE -U NONE -N -i NONE'

# key-bindings
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    ind="${${KEYMAP/vicmd/𝙑𝙄}/(main|viins)/❯❯}"
    zle reset-prompt
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  function zle-keymap-select() {
    ind="${${KEYMAP/vicmd/𝙑𝙄}/(main|viins)/❯❯}"
    zle reset-prompt
  }
  zle -N zle-line-init
  zle -N zle-line-finish
  zle -N zle-keymap-select
fi

bindkey -v
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^?" backward-delete-char
bindkey "^h" backward-delete-char

if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

[[ -z "$HISTFILE" ]] && export HISTFILE=$HOME/.zsh_history
export HISTSIZE=20000
export SAVEHIST=$HISTSIZE

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# theme
ZSH_THEME="avit"
#ind="❯❯"
#rtc="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})"
#PROMPT=' %{$fg_bold[cyan]%}%c $(git_prompt_info)${rtc}${ind}%{$reset_color%} '
local host_name="%{$fg[cyan]%}%n@%M:"
local path_string="%{$fg[yellow]%}%~"
PROMPT='${host_name} ${path_string}%(?.%F{magenta}.%F{red}) ❯ %f'

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%}✗ "
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) "

# autocomplete:
autoload -U compinit && compinit

# settings:
DISABLE_UNTRACKED_FILES_DIRTY="true"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/oh-my-zsh.sh


# colors:
ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{%F{$code}%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}


# third-party files
if [[ $- == *i* ]] ; then
  source "$HOME/.zsh/oh-my-zsh/completion.zsh"
  source "$HOME/.zsh/oh-my-zsh/git.zsh"
  #source "$HOME/.zsh/oh-my-zsh/themes-and-appearance.zsh"

  # must be sourced at the end
  source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

