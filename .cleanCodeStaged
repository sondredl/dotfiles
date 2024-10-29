#!/bin/sh

#runs clang-tidy script on staged c++ files
# .git/hooks/analyse-changes.sh

# Run clang-format on staged files
files_to_format=$(git diff --name-only --cached --diff-filter=ACMR | grep -E '\.(c|h|cpp|hpp)$')

if [ -n "$files_to_format" ]; then
    # Run clang-format only if there are relevant files
    echo "Tidying code with clang-tidy..."
    echo "$files_to_format" | xargs clang-tidy --fix-errors --style=file
    git add $files_to_format
    echo "Formatting code with clang-format..."
    echo "$files_to_format" | xargs clang-format -i --style=file
    git add $files_to_format
    echo "Code formatted successfully."
else
    echo "No relevant files to format. Skipping clang-format."
fi

files_to_format=$(git diff --name-only --cached --diff-filter=ACMR | grep -E '\.(py|gd)$')

if [ -n "$files_to_format" ]; then
    # Run clang-format only if there are relevant files
    echo "Formatting code with autopep8..."
    echo "$files_to_format" | xargs autopep8 --in-place --aggressive --aggressive 
    git add $files_to_format
    echo "Code formatted successfully."
else
    echo "No relevant files to format. Skipping clang-format."
fi

# Run cmake-format on staged CMakeLists.txt files
if [ "$cmake_format_available" = true ]; then
    files_to_format=$(git diff --name-only --cached --diff-filter=ACMR | grep -E 'CMakeLists\.txt$')
    if [ -n "$files_to_format" ]; then
        echo "Formatting code with cmake-format..."
        echo "$files_to_format" | xargs cmake-format -i 
        git add $files_to_format
        echo "Code formatted successfully."
    else
        echo "No relevant CMake files to format. Skipping cmake-format."
    fi
fi
# exit $?

