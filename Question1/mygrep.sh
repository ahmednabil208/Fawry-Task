#!/bin/bash

# ./mygrep.sh hello testfile.txt
# ./mygrep.sh -n hello testfile.txt
# ./mygrep.sh -vn hello testfile.txt
# ./mygrep.sh -v testfile.txt

option=""
pattern=""
files=""

# Command-Line Options:
if [ "$#" -eq 3 ]; then
    option=$1
    pattern=$2
    files=$3 

# Basic Functionality
elif [ "$#" -eq 2 ]; then
    if [ "$1" == -* -a -f "$2" ]; then
        echo "Warning: missing search string" 
        exit 1
    elif [ "$1" == -* ]; then
        option=$1
        pattern=$2
        read file
        files=$file 
    else
        option=0
        pattern=$1
        files=$2 
    fi
fi

if [ ! -f "$files" ]; then
    echo "Error: File '$file' not found!"
    exit 1
fi


if [ "$option" == 0 ]; then
    grep "$pattern" "$files"
elif [ "$option" == "-n" ]; then
    grep -n "$pattern" "$files"
elif [ "$option" == "-v" ]; then
    grep -v "$pattern" "$files"
elif [ "$option" == "-nv" -o "$option" == "-vn" ]; then
    grep -nv "$pattern" "$files"
fi
