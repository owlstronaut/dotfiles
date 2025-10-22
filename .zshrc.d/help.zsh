help() {
  cat << 'EOF'
Available commands and aliases:

Aliases:
  code       : Launches VS Code Insiders.
  explorer   : Opens a file explorer (using open).
  finder     : Opens Finder (using open).
  python     : Uses Python3.
  pip        : Uses pip3.
  issue      : Runs the issue-downloader script.
  gather-activity : Runs the activity-gatherer script to fetch GitHub activity.
                    Optionally accepts a date parameter (e.g., gather-activity 2025-03-10).
  npm-outdated-dev : Lists outdated npm packages in the current directory, sorted and unique.
  list-all-prs : Lists all open PRs authored by the user, formatted as a list with URLs.
  v-update   : Runs the version updater script to update versions in package.json files.
  e-update   : Runs the engine bumper script to bump the engine version for a repo.
               Takes a path argument (e.g., e-update /path/to/repo).

Functions:
  npmdev     : Runs the custom npm CLI script at /Users/owlstronaut/Documents/npmjs/cli/bin/npm-cli.js.
  npmdevs    : Runs the custom npm CLI script with verbose logging.
  npm-query  : Lists npm packages with their IDs, locations, and sources. Accepts optional query arguments.
  template-approver : Approves template-oss PRs using a filter. Requires a filter argument.
                      Example: template-approver "title:'4.23.3', baseRef:main"
  clean      : Recursively deletes all node_modules directories and package-lock.json files.
  mkcd       : Creates a directory and changes into it.
  git-prune  : Prunes local git branches that haven't been touched in 7 or more days, excluding main, master, latest, and the current branch.
EOF
}