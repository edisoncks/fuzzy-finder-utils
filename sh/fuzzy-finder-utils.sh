#!/bin/sh
exists() {
	type "$1" >/dev/null 2>/dev/null
}

ff() {
	fd . -d 1 -HI | fzf --reverse --border --preview 'if [ -d {} ]; then ls -lah --color=always {}; else bat --style=numbers --theme=Dracula --color=always {}; fi'
}

cdff() {
	# Verifies if fzf executable is available
	if ! exists fzf; then
		echo "fzf executable not found"
		return 1
	fi
	# Interactively change directory using fzf
	tmp=$(fd . -t d -d 1 -HI | fzf --reverse --border --prompt='Change Directory: ' --preview 'if [ -d {} ]; then ls -lah --color=always {}; else bat --style=numbers --theme=Dracula --color=always {}; fi')
	[ -n "$tmp" ] && cd "$tmp" || return
}

rmff() {
	# Verifies if fzf executable is available
	if ! exists fzf; then
		echo "fzf executable not found"
		return 1
	fi
	# Interactively remove files using fzf
	fd . -d 1 -HI | fzf --reverse --border --prompt='[Press TAB to Multi-Select] Remove Files: ' --preview 'if [ -d {} ]; then ls -lah --color=always {}; else bat --style=numbers --theme=Dracula --color=always {}; fi' --multi --print0 | xargs -0 rm -rf
}
