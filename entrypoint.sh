#!/bin/sh
set -e

# Prepend "envsubst" if the first argument is not an executable
if ! type -- "$1" &> /dev/null; then
    set -- envsubst "$@"
fi

# Show which command will be executed.
echo "Executing command: $*"

exec "$@"