ff() {
  find . -mindepth 1 -maxdepth 1 | fzf --reverse --border
}

cdff() {
  # Verifies if fzf executable is available
  if ! command -v fzf &> /dev/null; then
    echo "fzf executable not found"
    return 1
  fi
  # Interactively change directory using fzf
  tmp=$(find . -type d -mindepth 1 -maxdepth 1 | fzf --reverse --border --prompt='Change Directory: ')
  [ -n "$tmp" ] && cd "$tmp"
}

rmff() {
  # Verifies if fzf executable is available
  if ! command -v fzf &> /dev/null; then
    echo "fzf executable not found"
    return 1
  fi
  # Interactively remove files using fzf
  tmp=$(find . -mindepth 1 -maxdepth 1 | fzf --reverse --border --prompt='[Press TAB to Multi-Select] Remove Files: ' --multi)
  [ -n "$tmp" ] && rm -Ir $(echo "$tmp" | tr '\n' ' ')
}
