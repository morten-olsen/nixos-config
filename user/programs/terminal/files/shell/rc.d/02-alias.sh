alias ..="cd .."

alias g="git"
alias ls="eza"
alias mutt="neomutt"

alias gr="cd \`git rev-parse --show-toplevel\`"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Enable tab completion for `g` by marking it as an alias for `git`
command -v _git > /dev/null && command -v complete > /dev/null && complete -o default -o nospace -F _git g

command -v xsel > /dev/null || alias copy='xsel -ib'
command -v urxvt > /dev/null || alias n="setsid urxvt &>/dev/null"

alias sc="sudo systemctl"
alias usermount="sudo mount -o gid=users,fmask=113,dmask=002,nolock"
alias fzf="fzf --preview 'bat {} --line-range 0:100 --color always'"
alias stmux="tmux a -t base || tmux new -s base" 

