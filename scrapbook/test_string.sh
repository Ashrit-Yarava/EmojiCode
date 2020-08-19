#!/bin/bash
message=$(python3 encrypt.py "$1" | xargs python3 decrypt.py)
if [ "$message" != "$1" ]
then
    echo "$1 does not work..."
else
    echo "Works!"
fi