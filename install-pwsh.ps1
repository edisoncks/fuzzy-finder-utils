#!/usr/bin/env pwsh

# Install fuzzy-finder-utils to $HOME/fuzzy-finder-utils
echo "Installing fuzzy-finder-utils to $HOME/fuzzy-finder-utils"
mkdir -p $HOME/fuzzy-finder-utils
cp ./pwsh/fuzzy-finder-utils.ps1 $HOME/fuzzy-finder-utils/fuzzy-finder-utils.ps1

# Add fuzzy-finder-utils bootstrap code to $PROFILE
if (-not (Test-Path $PROFILE -PathType Leaf)) {
    # If $PROFILE does not exist, create it
    New-Item -ItemType File -Path $PROFILE -Force
}
$tmp = (Select-String -Raw -Path $PROFILE -Pattern "# fuzzy-finder-utils")
if (-not ($tmp)) {
    echo "Adding fuzzy-finder-utils to $PROFILE"
    echo "" >> $PROFILE
    echo "# fuzzy-finder-utils" >> $PROFILE
    echo ". $HOME/fuzzy-finder-utils/fuzzy-finder-utils.ps1" >> $PROFILE
    echo "" >> $PROFILE
}
