npmdev() {
  node /Users/owlstronaut/Documents/npmjs/cli/bin/npm-cli.js "$@"
}

ghcs() {
    FUNCNAME="$funcstack[1]"
    local GH_DEBUG="$GH_DEBUG"
    local GH_HOST="$GH_HOST"

    read -r -d '' __USAGE <<-EOF
    Wrapper around \`gh copilot suggest\` to suggest a command based on a natural language description.
    Usage:
      \$FUNCNAME [flags] <prompt>
    EOF

    local OPT OPTARG OPTIND
    while getopts 'dht:-:' OPT; do
        if [ "$OPT" = '-' ]; then
            OPT="${OPTARG%%=*}"
            OPTARG="${OPTARG#"$OPT"}"
            OPTARG="${OPTARG#=}"
        fi
        case "$OPT" in
            debug | d)
                GH_DEBUG=api
                ;;
            help | h)
                echo "$__USAGE"
                return 0
                ;;
            hostname)
                GH_HOST="$OPTARG"
                ;;
            target | t)
                TARGET="$OPTARG"
                ;;
        esac
    done

    shift "$((OPTIND-1))"

    TMPFILE="$(mktemp -t gh-copilotXXXXXX)"
    trap 'rm -f "$TMPFILE"' EXIT
    if GH_DEBUG="$GH_DEBUG" GH_HOST="$GH_HOST" gh copilot suggest -t "$TARGET" "$@" --shell-out "$TMPFILE"; then
        if [ -s "$TMPFILE" ]; then
            FIXED_CMD="$(cat $TMPFILE)"
            print -s -- "$FIXED_CMD"
            echo
            eval -- "$FIXED_CMD"
        fi
    else
        return 1
    fi
}

ghce() {
    FUNCNAME="$funcstack[1]"
    local GH_DEBUG="$GH_DEBUG"
    local GH_HOST="$GH_HOST"

    read -r -d '' __USAGE <<-EOF
    Wrapper around \`gh copilot explain\` to explain a given input command in natural language.
    Usage:
      \$FUNCNAME [flags] <command>
    EOF

    local OPT OPTARG OPTIND
    while getopts 'dh-:' OPT; do
        if [ "$OPT" = '-' ]; then
            OPT="${OPTARG%%=*}"
            OPTARG="${OPTARG#"$OPT"}"
            OPTARG="${OPTARG#=}"
        fi
        case "$OPT" in
            debug | d)
                GH_DEBUG=api
                ;;
            help | h)
                echo "$__USAGE"
                return 0
                ;;
            hostname)
                GH_HOST="$OPTARG"
                ;;
        esac
    done

    shift "$((OPTIND-1))"

    GH_DEBUG="$GH_DEBUG" GH_HOST="$GH_HOST" gh copilot explain "$@"
}

cd() {
  case "$1" in
    npm)
      builtin cd /Users/owlstronaut/Documents/npmjs
      ;;
    cli)
      builtin cd /Users/owlstronaut/Documents/npmjs/cli
      ;;
    test)
      builtin cd /Users/owlstronaut/Documents/test-packages
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