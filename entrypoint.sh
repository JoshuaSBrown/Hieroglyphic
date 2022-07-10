#!/bin/bash

# Check if the docs folder exist in the repository, assumes that the action
# is running from the repository root
[ ! -d "./docs" ] && echo "Directory /path/to/dir DOES NOT exists."; mkdir docs
