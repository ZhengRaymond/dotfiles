export ZSH="$HOME/.oh-my-zsh"

# general settings
[[ ":$PATH:" != *":$HOME/.bin:"* ]] && export PATH="$PATH:$HOME/.bin"
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
alias gs='git status'
alias ga='git add .'
alias ep='etsync push'
alias vi='vim'
alias vimbroken='vim -u NONE -U NONE -N -i NONE'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias atom=/mnt/c/Users/zheng/AppData/Local/atom/app-1.34.0/atom.exe
config config --local status.showUntrackedFiles no


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

#bindkey -v
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
bindkey "^X" delete-char

#if [[ "${terminfo[kcuu1]}" != "" ]]; then
#  autoload -U up-line-or-beginning-search
#  zle -N up-line-or-beginning-search
#  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
#fi
#if [[ "${terminfo[kcud1]}" != "" ]]; then
#  autoload -U down-line-or-beginning-search
#  zle -N down-line-or-beginning-search
#  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
#fi

[[ -z "$HISTFILE" ]] && export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export HISTFILESIZE=1000000000
export SAVEHIST=$HISTSIZE

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# autocomplete:
autoload -U compinit && compinit

# settings:
DISABLE_UNTRACKED_FILES_DIRTY="true"

# third-party files
#if [[ $- == *i* ]] ; then
#  source "$HOME/.zsh/oh-my-zsh/completion.zsh"
#  source "$HOME/.zsh/oh-my-zsh/git.zsh"
#  source "$HOME/.zsh/oh-my-zsh/themes-and-appearance.zsh"
#
#  # must be sourced at the end
#  source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
#fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

ZSH_THEME="avit"
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
export LS_COLORS="${LS_COLORS}:ow=1;34;40"
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

