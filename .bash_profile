# phpstorm debug
source ~/development/bin/xdebug_toggle

# custom prompt:
export PS1="\[\e[31m\]\!\[$(tput sgr0)\] \[\e[34m\][\u@\H]:\[\e[1m\e[35m\] \w $ \[\e[21m\]\[$(tput sgr0)\]"

# OPAM configuration
. /home/rzheng/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

alias rm="rm -i"

# db aliases
eval $(dbaliases)


zsh -i
