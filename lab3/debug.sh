#!/bin/bash

# Read input from user for folder name
read -p "Enter folder name: " folder_name

# Change to the input folder
cd "$folder_name"

read -p "Enter program name: " program_name

# Assemble myProg.s to create myProg.o
as -o "$program_name".o "$program_name".s

# Link myProg.o to create Program
ld -o "$program_name" "$program_name".o

# Debug the resulting executable
gdb --args ./"$program_name"

# Change back to the original directory
cd ..