#!/bin/bash
## 
# Install software
##

if command -v apt >/dev/null 2>&1; then
    echo "Installing software"
# apt install i3 terminator python-keybinder chromium-browser

# not sure this will work
# apt install sublime-text
else
    echo "Not installing software"
fi
