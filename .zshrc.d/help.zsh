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

Functions:
  npmdev     : Runs the custom npm CLI script at /Users/owlstronaut/Documents/npmjs/cli/bin/npm-cli.js.
  ghcs       : Wrapper for 'gh copilot suggest' which suggests a command based on a natural language prompt.
  ghce       : Wrapper for 'gh copilot explain' that explains a given command in natural language.
  cd         : Extended cd command for shortcuts ('npm', 'cli', 'test').
  clean      : Recursively deletes all node_modules directories and package-lock.json files.
EOF
}