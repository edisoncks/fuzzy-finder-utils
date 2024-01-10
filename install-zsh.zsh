#!/usr/bin/env zsh

# Install fuzzy-finder-utils to $HOME/fuzzy-finder-utils
echo "Installing fuzzy-finder-utils to $HOME/fuzzy-finder-utils"
mkdir -p $HOME/fuzzy-finder-utils
cp ./sh/fuzzy-finder-utils.sh $HOME/fuzzy-finder-utils/fuzzy-finder-utils.sh

# Add fuzzy-finder-utils bootstrap code to $HOME/.zshrc
tmp=$(grep $HOME/.zshrc -e "fuzzy-finder-utils")
if [ -z "$tmp" ]; then
    echo "Adding fuzzy-finder-utils to $HOME/.zshrc"
    echo "" >> $HOME/.zshrc
    echo "# fuzzy-finder-utils" >> $HOME/.zshrc
    echo "source \$HOME/fuzzy-finder-utils/fuzzy-finder-utils.sh" >> $HOME/.zshrc
    echo "" >> $HOME/.zshrc
fi
