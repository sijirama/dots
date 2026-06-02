alias p="pnpm"
alias br="bun run"
alias zbr="zig build run"

alias fucking="sudo"

alias inv='nvim $(fzf -m --preview "bat --color=always --style=numbers --line-range=:500 {}")'
alias cat='bat'

alias py='python3'
alias zshrc='nvim ~/.zshrc'

alias runningproc='ps aux --sort=-%cpu | head -n 6'



#INFO: ssh
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

#INFO: weather
alias weather="curl wttr.in/Lagos,Nigeria"

alias cls="clear"
alias rg="ranger"
alias r="ranger"
alias nf="neofetch"
alias zc="nvim ~/.zshrc"
alias ls="ls -la --color"
alias home="cd ~"

alias cpc="xclip -sel c < "

#INFO: clipboard (copy stdin/string to clipboard, e.g. `echo hi | set_clipboard`)
alias set_clipboard='xclip -selection clipboard'
alias set-clipboard='xclip -selection clipboard'

#INFO: directory aliases
alias code="cd ~/Desktop/me/coder"
alias neodots="cd ~/.config/nvim"
alias dots="cd ~/.dots"
alias obsi="cd ~/Documents/blursidian"
alias vim="vim -S https://raw.githubusercontent.com/sijirama/neodots/main/.vimrc"
alias e="xdg-open ."

#INFO: Wifi Management
alias wifi="nmcli d wifi list"

#INFO: display / monitor (xrandr)
alias screen-only-laptop='xrandr --output eDP-1 --auto --primary --output HDMI-1 --off'
alias screen-only-external='xrandr --output HDMI-1 --auto --primary --output eDP-1 --off'
alias screen-dual='xrandr --output eDP-1 --auto --output HDMI-1 --auto --right-of eDP-1'
alias screen-mirror='xrandr --output HDMI-1 --same-as eDP-1'
alias screen-rotate='xrandr --output HDMI-1 --rotate left'

#INFO: git aliases
alias gs='git status'
alias ga='git add .'
alias gp='git push'

gitall() {
    git add .
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m update
    fi
    git push
} 

gac () {
    git add .
    git commit -m "$*"
}


#INFO: cool aliases
alias mypwd="echo My current directory is $(pwd)"
alias fman="compgen -c | fzf | xargs man"
alias checkports="sudo ss -tulpn"

#INFO: fzf power-tools
# fuzzy-search shell history; drops the chosen command onto the prompt (editable before you hit enter)
fh() {
    print -z $( fc -rl 1 | fzf +s --tac | sed -E 's/ *[0-9]+\*? +//' )
}

# fuzzy-checkout a git branch (local or remote) — for your 400+ daily checkouts
fco() {
    local branch
    branch=$(git branch --all | grep -v HEAD | sed 's/^[* ]*//;s#remotes/[^/]*/##' | sort -u | fzf) \
        && git checkout "$branch"
}

# fuzzy-pick running processes and kill them (defaults to -9, pass a signal to override: fkill -15)
fkill() {
    local pids
    pids=$(ps -eo pid,user,%cpu,%mem,cmd --sort=-%cpu | sed 1d | fzf -m | awk '{print $1}')
    [ -n "$pids" ] && echo "$pids" | xargs kill -"${1:-9}"
}

# fuzzy-cd into any subdirectory below the current (or given) path
fcd() {
    local dir
    dir=$(find "${1:-.}" -type d 2>/dev/null | fzf) && cd "$dir"
}

# make a directory (and parents) then cd straight into it
mkcd() { mkdir -p "$1" && cd "$1"; }

# extract just about any archive without remembering the flags
extract() {
    case "$1" in
        *.tar.bz2) tar xjf "$1" ;;
        *.tar.gz)  tar xzf "$1" ;;
        *.tar.xz)  tar xJf "$1" ;;
        *.tar)     tar xf  "$1" ;;
        *.tbz2)    tar xjf "$1" ;;
        *.tgz)     tar xzf "$1" ;;
        *.bz2)     bunzip2 "$1" ;;
        *.gz)      gunzip  "$1" ;;
        *.zip)     unzip   "$1" ;;
        *.rar)     unrar x "$1" ;;
        *.7z)      7z x    "$1" ;;
        *)         echo "extract: don't know how to handle '$1'" ;;
    esac
}

#INFO: Tmux aliases

# List all tmux sessions
alias tl='tmux list-sessions'

# Attach to last tmux session
alias tal='tmux attach'

# Attach to an existing tmux session
alias ta='tmux attach -t'

# Kill a tmux session
alias tk='tmux kill-session -t'

# Kill a tmux session
alias tsk='tmux kill-session'

# Create a new tmux window
alias tw='tmux new-window'

# Kill the current tmux window
alias tkw='tmux kill-window'

# Create a new tmux session
alias tns='tmux new-session'

export MANPAGER='nvim +Man!'
