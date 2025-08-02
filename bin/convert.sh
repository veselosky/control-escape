#!/bin/bash

# Create the content directory if it doesn't exist
mkdir -p content/linux

# Find all .rst files in the source directory
for file in source/linux/*.rst
do
    # Get the base name of the file (without the .rst extension)
    base_name=$(basename "$file" .rst)

    # Convert the .rst file to Markdown using pandoc
    pandoc "$file" -f rst -t markdown -o "content/linux/$base_name.md"
done