#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"




file_name="$SCRIPT_DIR/initialized.txt"

virtualenv $SCRIPT_DIR/venv

source $SCRIPT_DIR/venv/bin/activate



if [ -e "$file_name" ]; then

    echo "All deps met, initializing..."


else
    echo "Installing required deps..."


# Check if Python 3 is installed.
    if ! command -v python3 &> /dev/null; then
        echo "Python 3 is not installed. Installing..."
        sudo apt update
        sudo apt install python3
    else
        echo "Python 3 is already installed."
    fi

    # Check if virtualenv is installed
    if ! command -v virtualenv &> /dev/null; then
        echo "virtualenv is not installed. Installing..."
        sudo apt install virtualenv
    else
        echo "virtualenv is already installed."
    fi


    pip install urwid
    pip install keyboard

    touch "$file_name"
fi






# Start Video Logger
python $SCRIPT_DIR/main.py


# Deactivate the virtual environment
deactivate
