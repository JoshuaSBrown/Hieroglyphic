#!/bin/bash

set -euf -o pipefail
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=joshuasbrown
# image name
IMAGE=hieroglyphic
docker build -t $USERNAME/$IMAGE:latest .

