#!/bin/bash

# Clears the screen
clear

# Compiles code and copies executable to the test suite directory
# Remember to provide full path to the test suite directory
gcc *.c -o exec && cp ./exec ~/sf-0119_shell_test_suite/simple_shell

# Runs the script
# Remember to provide full path to the test suite directory
~/sf-0119_shell_test_suite/check_simple_shell.bash

# Clean up
rm exec
