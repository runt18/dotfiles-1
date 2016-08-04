# Set environment variables
export EDITOR="subl -n -w"
export TERM="xterm"
export FIREFOX_BIN="/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS/firefox"
export CHROME_BIN="/opt/homebrew-cask/Caskroom/google-chrome/latest/Google Chrome.app/Contents/MacOS/Google Chrome"
# Get directory of this script
# Credit: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$DIR"/"

# Access and reload this file
SETTINGS_FILE=$DIR".bash_profile"
alias rfr='source '$SETTINGS_FILE
alias settings=$EDITOR' '$SETTINGS_FILE

# Git stuff
alias ga='git add -A'
alias gc='git commit'
alias gs='git status -sb'
alias gb='git branch'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'
alias gd='git diff'
alias gr='git review'
alias gce='git commit --amend'
alias gcu='git commit --amend --no-edit'

function ge() {
    git archive --format zip --output $1 master
}

alias fuck='eval $(thefuck $(fc -ln -1))'

# gitignore a path
function ignore() {
    echo "$1" >> .gitignore
}

# Directory navigation stuff
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias la='ls -a'

# Escape codes
end="\[\033[0m\]"
black="\[\033[30m\]"
red="\[\033[31m\]"
green="\[\033[32m\]"
yellow="\[\033[33m\]"
blue="\[\033[34m\]"
purple="\[\033[35m\]"
cyan="\[\033[36m\]"
white="\[\033[37m\]"

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

# Misc
function packcrx(){
	/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --pack-extension=$1 --pack-extension-key=$2.pem
}

alias inspector="nvm run v0.10.37 `which node-inspector`"

alias speedup='sudo rm -rf /private/var/log/asl/*.asl'

# Restart Apache
alias aprs='sudo apachectl restart'

# Edit hosts file
alias hosts=$EDITOR' /private/etc/hosts'

# Flush the DNS cache
alias rfrdns='dscacheutil -flushcache'

# Open a track in Audacity with aud song.mp3
alias aud='open -a /opt/homebrew-cask/Caskroom/audacity/2.0.3/Audacity/Audacity.app'

# `wr src dest` writes src to dest with a progess bar
# Use to make disk images of large files
wr () {
    dd if=$1 bs=1048576 | pv -tpreb > $2
}

# Load external scripts
source $DIR"personal.sh"
source $DIR"cheat.sh"
source $DIR"git-complete.sh"
source $DIR"thumbtack.sh"

# Switch between Java 6 and 7
jvm () {
    if [[ $1 == '6' ]]; then
        export JAVA_HOME="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/"
    else
        export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home/"
    fi
}

export PROMPT_COMMAND='source "$DIR"/prompt.sh'

# Add current working directory to the PATH
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:/usr/texbin:.:"$PATH

# Print a welcome message (default message disabled by creating ~/.hushlogin)
$DIR"scripts/welcome.py"

# Alias git to hub to get all of the extra features
eval "$(hub alias -s)"

alias gcc='gcc-4.9'

. $DIR'z.sh'

# Load version managers for node and ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"
