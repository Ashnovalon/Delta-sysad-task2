#!/bin/bash

# Directory containing alias files
alias_dir="~/Documents/sysad"

if [ ! -d "$alias_dir" ]; then
    echo "Alias directory does not exist."
    exit 1
fi

alias_files=$(ls "$alias_dir"/*.sh)


for file in $alias_files; do
    if [ -f "$file" ]; then
    	chmod +x "$file"    
        cat "alias ${file%.*}='bash $alias_dir/$file'" >> ~/.bash_aliases
    else
        echo "$file is not a valid file."
    fi
done

cat "if [ -f ~/.bash_aliases ]; then" >> ~/.bashrc
cat "    .~/.bash_aliases ]; then" >> ~/.bashrc
cat "fi" >> ~/.bashrc

source ~/.bashrc

echo "Alias files added to .bashrc."
