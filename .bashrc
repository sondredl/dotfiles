
set -o vi

alias ga="git add"
alias gs="git status"
alias gc="git commit"
alias go="/c/Program\ Files/Go/bin/go.exe"
alias ll="ls -all"
alias vim="nvim"
# set show-mode-in-prompt on
# set vi-ins-mode-string \1\e[6 q\2
# set vi-cmd-mode-string \1\e[2 q\2

# optionally:
# switch to block cursor before executing a command
# set keymap vi-insert
# RETURN: "\e\n"

#   copilot_what-the-shell () {
#     TMPFILE=$(mktemp);
#     trap 'rm -f $TMPFILE' EXIT;
#     if C:/Users/sondr/AppData/Roaming/npm/node_modules/@githubnext/github-copilot-cli/cli.js what-the-shell "$@" --shellout $TMPFILE; then
#       if [ -e "$TMPFILE" ]; then
#         FIXED_CMD=$(cat $TMPFILE);
#         history -s $(history 1 | cut -d' ' -f4-); history -s "$FIXED_CMD";
#         eval "$FIXED_CMD"
#       else
#         echo "Apologies! Extracting command failed"
#       fi
#     else
#       return 1
#     fi
#   };
# alias '??'='copilot_what-the-shell';
# 
#   copilot_git-assist () {
#     TMPFILE=$(mktemp);
#     trap 'rm -f $TMPFILE' EXIT;
#     if C:/Users/sondr/AppData/Roaming/npm/node_modules/@githubnext/github-copilot-cli/cli.js git-assist "$@" --shellout $TMPFILE; then
#       if [ -e "$TMPFILE" ]; then
#         FIXED_CMD=$(cat $TMPFILE);
#         history -s $(history 1 | cut -d' ' -f4-); history -s "$FIXED_CMD";
#         eval "$FIXED_CMD"
#       else
#         echo "Apologies! Extracting command failed"
#       fi
#     else
#       return 1
#     fi
#   };
# alias 'git?'='copilot_git-assist';
# 
#   copilot_gh-assist () {
#     TMPFILE=$(mktemp);
#     trap 'rm -f $TMPFILE' EXIT;
#     if C:\Users\sondr\AppData\Roaming\npm\node_modules\@githubnext\github-copilot-cli\cli.js gh-assist "$@" --shellout $TMPFILE; then
#       if [ -e "$TMPFILE" ]; then
#         FIXED_CMD=$(cat $TMPFILE);
#         history -s $(history 1 | cut -d' ' -f4-); history -s "$FIXED_CMD";
#         eval "$FIXED_CMD"
#       else
#         echo "Apologies! Extracting command failed"
#       fi
#     else
#       return 1
#     fi
#   };
# alias 'gh?'='copilot_gh-assist';
# alias 'wts'='copilot_what-the-shell';
