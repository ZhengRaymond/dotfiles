# Setup fzf
# ---------
if [[ ! "$PATH" == */mnt/c/Users/zheng/workspace/.fzf/bin* ]]; then
  export PATH="$PATH:/mnt/c/Users/zheng/workspace/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/mnt/c/Users/zheng/workspace/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/mnt/c/Users/zheng/workspace/.fzf/shell/key-bindings.bash"

