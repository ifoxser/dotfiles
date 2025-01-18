#!/bin/sh

commit_msg_file=$1

# Only check the first line
first_line=$(head -n1 "$commit_msg_file")

# Valid types
types="feat|fix|docs|style|refactor|conf|test|chore"

# Valid scopes
scopes="nvim|vscode|idea|tmux|alacritty|kitty|wezterm|zsh|bash|fish|git|github|gitlab|other"

# Commit message format regex
format_regex="^(${types})(\\(${scopes}\\))?: .+"

if ! echo "$first_line" | grep -qE "$format_regex"; then
    echo "ERROR: Invalid commit message format in subject line."
    echo "Format: <type>(<scope>): <subject>"
    echo ""
    echo "Valid types: ${types}"
    echo "Valid scopes: ${scopes}"
    echo ""
    echo "Examples:"
    echo "feat(nvim): add new plugin configuration"
    echo "fix(tmux): resolve session restore issue"
    echo "conf(zsh): update plugin settings"
    exit 1
fi

# Only check the length of the first line
if [ ${#first_line} -gt 72 ]; then
    echo "ERROR: Subject line too long (max 72 characters)"
    exit 1
fi
