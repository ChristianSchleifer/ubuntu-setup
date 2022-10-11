# Setup fzf
# ---------
if [[ ! "$PATH" == */home/christian/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/christian/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/christian/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/christian/.fzf/shell/key-bindings.bash"
