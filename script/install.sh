#!/usr/bin/env bash
#
# Run all dotfiles installers.

set -e

cd "$(dirname $0)"/..

echo "› brew bundle"
brew bundle

# find the installers and run them iteratively
find . -name install.sh -not -path './script/*' | while read installer; do sh -c "${installer}"; done
