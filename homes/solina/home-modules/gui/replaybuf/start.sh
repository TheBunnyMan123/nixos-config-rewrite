#!/usr/bin/env bash

mkdir -p ~/Videos/Replays
exec gpu-screen-recorder -r 300 -w portal -o ~/Videos/Replays -c mp4 -a "default_output|default_input"

