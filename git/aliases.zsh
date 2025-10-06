alias gct='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "$(date +"%Y-%m-%dT%H:%M:%S")"'
