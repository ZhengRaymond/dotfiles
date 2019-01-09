# custom prompt:
export PS1=" asdf\[\e[31m\]\!\[$(tput sgr0)\] \[\e[34m\][\u@\H]:\[\e[1m\e[35m\] \w $ \[\e[21m\]\[$(tput sgr0)\]"

alias rm="rm -i"

echo "HELLO"
zsh -i
