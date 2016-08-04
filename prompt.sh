git_branch (){
    # Get root directory of git repo
    local GITDIR=`command git rev-parse --show-toplevel 2>&1`
    # Figure out the current branch
    local BRANCH=`command git branch 2>/dev/null | sed -n '/^\*/s/^\* //p'`
    if [ -n "$BRANCH" ]; then
        echo -e "$BRANCH$yellow | "
    fi
}
# Get the status of the repo and chose a color accordingly
git_color (){
    local STATUS=`command git status 2>&1`
    if [[ "$STATUS" == *'Not a git repository'* ]]; then
        echo ""
    else
        if [[ "$STATUS" != *'working directory clean'* ]]; then
            # Red for uncommitted changes
            echo -e $red
        else
            if [[ "$STATUS" == *'Your branch is ahead'* ]]; then
                # Yellow for unpushed changes
                echo -e $yellow
            else
                # Green for no changes
                echo -e $green
            fi
        fi
    fi
}

# Set the prompt in the format [git-branch | directory] ▶ with colours
export PS1='\n'$yellow'['$(git_color)$(git_branch)$blue'\w'$yellow'] ▶ '$end

echo -ne "\\033]0;`basename $PWD`\\007"
