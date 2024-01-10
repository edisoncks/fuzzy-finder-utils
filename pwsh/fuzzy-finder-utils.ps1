#!/usr/bin/env pwsh

function ff {
    # Verifies if fzf executable is available
    if (-not (Get-Command fzf -ErrorAction SilentlyContinue)) {
        Write-Error "fzf executable not found. Please install fzf and try again."
        exit 1
    }
    $selectedFile = (Get-ChildItem -Name -Force | fzf --reverse --border)
    return $selectedFile
}

function cdff {
    # Verifies if fzf executable is available
    if (-not (Get-Command fzf -ErrorAction SilentlyContinue)) {
        Write-Error "fzf executable not found. Please install fzf and try again."
        exit 1
    }
    # Interactively change directory using fzf
    $selectedDirectory = (Get-ChildItem -Name -Directory -Force | fzf --reverse --border --prompt='Change Directory: ')
    if (-not [string]::IsNullOrWhiteSpace($selectedDirectory)) {
        cd $selectedDirectory
    }
}

function rmff {
    # Verifies if fzf executable is available
    if (-not (Get-Command fzf -ErrorAction SilentlyContinue)) {
        Write-Error "fzf executable not found. Please install fzf and try again."
        exit 1
    }
    # Interactively remove files using fzf
    $selectedFiles = (Get-ChildItem -Name -Force | fzf --multi --reverse --border --prompt='[Press TAB to Multi-Select] Remove Files: ')
    if (-not [string]::IsNullOrWhiteSpace($selectedFiles)) {
        Remove-Item -Force -Confirm $selectedFiles
    }
}
