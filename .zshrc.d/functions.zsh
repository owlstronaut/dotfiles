npmdev() {
  node /Users/owlstronaut/Documents/npmjs/cli/bin/npm-cli.js "$@"
}

npmdevs() {
  node /Users/owlstronaut/Documents/npmjs/cli/bin/npm-cli.js "$@" --loglevel=silly
}

npm-query() {
  /Users/owlstronaut/Documents/scripts/npm-query/npm-query-list.sh "$@"
}

template-approver() {
  /Users/owlstronaut/Documents/scripts/template-approver/template-approver.sh "$@"
}

mkcd () { mkdir "$1" && cd "$1" }

# Working on the npm/cli means I need to clean things all the time
clean() {
    echo 'Starting deletion of node_modules directories and package-lock.json files recursively'
    find . -type d -name 'node_modules' -prune -exec rm -rf {} +
    find . -type f -name 'package-lock.json' -delete
    echo 'Cleanup completed'
}

# Prune git branches that haven't been touched in 7 or more days
# Excludes latest, main, master, and current branch
git-prune() {
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    echo 'Pruning branches not touched in 7+ days (excluding latest, main, master, and current branch)...'
    
    # Make sure we have the latest changes
    git fetch --prune
    
    # Get list of all local branches (except main, master, and latest)
    # Using git for-each-ref which properly handles branch names with special characters
    # and allows filtering by last commit date
    current_date=$(date +%s)
    cutoff_seconds=$((7 * 24 * 60 * 60))  # 7 days in seconds
    
    # Collecting branches older than 7 days
    branches_to_delete=""
    
    # Using "refs/heads/" prefix to only list local branches
    git for-each-ref --format='%(refname:short) %(committerdate:unix)' refs/heads/ | while read branch_info; do
        branch_name=$(echo "$branch_info" | awk '{print $1}')
        branch_date=$(echo "$branch_info" | awk '{print $2}')
        
        # Skip protected branches
        if [[ "$branch_name" == "main" || "$branch_name" == "master" || "$branch_name" == "latest" || "$branch_name" == "$current_branch" ]]; then
            continue
        fi
        
        # Check if branch is older than 7 days
        branch_age=$((current_date - branch_date))
        if [[ $branch_age -gt $cutoff_seconds ]]; then
            echo "$branch_name" >> /tmp/branches_to_delete.$$
        fi
    done
    
    # Check if the temp file exists and has content
    if [[ -f /tmp/branches_to_delete.$$ && -s /tmp/branches_to_delete.$$ ]]; then
        branches_to_delete=$(cat /tmp/branches_to_delete.$$)
        rm /tmp/branches_to_delete.$$
    else
        # Clean up empty temp file if it exists
        [[ -f /tmp/branches_to_delete.$$ ]] && rm /tmp/branches_to_delete.$$
        echo 'No branches to prune'
        return 0
    fi
    
    # Show branches that will be deleted
    echo 'The following branches will be deleted:'
    echo "$branches_to_delete"
    
    # Delete each branch
    echo "$branches_to_delete" | while read branch; do
        git branch -D "$branch"
    done
    
    echo 'Pruning completed successfully'
}