#!/bin/sh
set -e

# If first arg starts with < or contains >, it's likely shell syntax
# so run everything through sh -c
case "$1" in
    \<*|*\>*)
        echo "Executing command: envsubst $*"
        exec sh -c "envsubst $*"
        ;;
esac

# Prepend "envsubst" if the first argument is not an executable
if ! type -- "$1" &> /dev/null; then
    set -- envsubst "$@"
fi

# Show which command will be executed.
echo "Executing command: $*"

exec "$@"
