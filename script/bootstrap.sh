#!/usr/bin/env bash
# Bootstrap script for installing dotfiles and dependencies.
# Usage: Run this script from the dotfiles repository root.

source "$(dirname $0)/_functions.sh" # Load helper functions

cd "$(dirname $0)/.."   # Change to repository root
DOTFILES_ROOT=$(pwd -P) # Store absolute path to dotfiles root

echo "Current pwd: $(pwd)"

set -eu # Exit on error or unset variable

echo ''

# link_file <src> <dst>
# Creates a symlink from <src> to <dst>, handling existing files:
# - Prompts user to skip, overwrite, or backup if destination exists.
# - Supports "all" actions for batch operations.
link_file() {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]; then

        echo "skipping"
        skip=true

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action </dev/tty

        case "$action" in
        o)
          overwrite=true
          ;;
        O)
          overwrite_all=true
          ;;
        b)
          backup=true
          ;;
        B)
          backup_all=true
          ;;
        s)
          skip=true
          ;;
        S)
          skip_all=true
          ;;
        *) ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]; then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]; then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]; then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]; then # "false" or empty
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

# install_dotfiles
# Finds all 'symlinks' files in the dotfiles repo and creates symlinks as specified.
install_dotfiles() {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for symlinks in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name 'symlinks' -not -path '*.git*'); do
    srcDir="$(dirname "$symlinks")"
    while read -r src dst _; do
      # skip empty lines and comments
      [[ -z "$src" || "$src" =~ ^# ]] && continue
      link_file "$srcDir/$src" "${dst/#\$HOME/$HOME}"
    done <"$symlinks"
  done

}

install_dotfiles

# Install dependencies using bin/dot script.
info "installing dependencies"
if source bin/dot | while read -r data; do info "$data"; done; then
  success "dependencies installed"
else
  fail "error installing dependencies"
fi

echo ''
echo '  All installed!'
