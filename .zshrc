# Path to your oh-my-zsh installation.
export ZSH=/Users/giles/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE=z"true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

plugins=(git brew)

# User configuration

export GOPATH=$HOME/go

export PATH="/usr/local/bin:/usr/local/sbin:~/bin:/usr/local/opt/php56/bin:/usr/texbin:$GOPATH/bin:.:"$PATH

export GO15VENDOREXPERIMENT=1

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl -wn'
fi

# Access and reload this file

DIR=${0:a:h}
SETTINGS_FILE=$DIR"/.zshrc"
alias rfr='source '$SETTINGS_FILE
alias settings=$EDITOR' '$SETTINGS_FILE

autoload -U promptinit && promptinit
prompt pure

# Git stuff
alias ga='git add -A'
alias gc='git commit'
alias gs='git status -sb'
alias gb='git branch'
alias gp='git push'
alias gpl='git pull'
alias gpr='git pull --rebase origin master'
alias gf='git fetch'
alias gd='git diff'
alias gr='git review'
alias gce='git commit --amend'
alias gcu='git commit --amend --no-edit'
alias gcp='git cherry-pick'
alias gg='git grep -i'
alias glm='git log --author=`whoami`'
alias gsc='git show --stat --oneline HEAD'
alias gbr='git branch --sort=-committerdate | head -n 10'

# All TODOs in current project
alias todo="git grep 'TODO(giles)'"
# New TODOs in latest commit
alias ntodo="git show HEAD | grep 'TODO(giles)'"

function gite() {
    git archive --format zip --output $1 master
}

function grb() {
    git rebase -i HEAD~"${1:-5}"
}

alias fuck='eval $(thefuck $(fc -ln -1))'

alias setscreen='cscreen -i 4280bc2 -p && cscreen -i 4248a9c -p'

# gitignore a path
function ignore() {
    echo "$1" >> .gitignore
}

# Directory navigation stuff
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias la='ls -a'

# Open the current Finder window directory in the terminal
function cdf() {
    cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# Create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$@"
}

# Recursive, case-insensitive regex search for all files matching the pattern
function f() {
    find . -iregex $(printf '.*%s.*' "$@")
}

# Inverse rm (remove everything but specified files)
# Credit: http://stackoverflow.com/questions/4325216/rm-all-files-except-some
function rme() {
    find . -type f -not -name "$1" | xargs rm
}

function mp3() {
    filename=$(basename "$1")
    filename="${filename%.*}"
    bitrate=${2:-320}
    ffmpeg -i "$1" -f mp3 -b:a $bitrate"k" "$filename.mp3"
}

function fixlines() {
    find . -type f -print0 | xargs -0 dos2unix
}

function linecount() {
    find $1 -name "*.$2" | xargs wc -l
}

# Syntax-highlighted cat. Requires Pygments.
alias c='pygmentize -O style=monokai -f console256 -g'

# More memorable name for displaying file and folder sizes
alias disk='du -sh'

alias wipecard='rm -rf /Volumes/PHOTON/DCIM/100MSDCF/*'

# source $DIR"git-complete.sh"

# Alias git to hub to get all of the extra features
eval "$(hub alias -s)"

. $DIR'/z.sh'

THUMBTACK=$DIR"/thumbtack.sh"
test -f $THUMBTACK && source $THUMBTACK

[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# compaudit | sudo xargs chmod g-w
# compaudit | sudo xargs chown root
# rm ~/.zcompdump*
# compinit

setopt promptsubst
