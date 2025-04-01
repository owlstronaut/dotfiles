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

cd() {
  case "$1" in
    npm)
      builtin cd /Users/owlstronaut/Documents/npmjs
      ;;
    cli)
      builtin cd /Users/owlstronaut/Documents/npmjs/cli
      ;;
    scripts)
      builtin cd /Users/owlstronaut/Documents/scripts
      ;;
    test)
      builtin cd /Users/owlstronaut/Documents/test-packages
      ;;
    arborist)
      builtin cd /Users/owlstronaut/Documents/npmjs/cli/workspaces/arborist
      ;;
    *)
      builtin cd "$@"
      ;;
  esac
}

# Working on the npm/cli means I need to clean things all the time
clean() {
    echo 'Starting deletion of node_modules directories and package-lock.json files recursively'
    find . -type d -name 'node_modules' -prune -exec rm -rf {} +
    find . -type f -name 'package-lock.json' -delete
    echo 'Cleanup completed'
}