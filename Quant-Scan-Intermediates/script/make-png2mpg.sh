#!/bin/bash


#ffmpeg -r 12 -y -i "image_%010d.png" output.mpg
ffmpeg -y -i "$1.%03d.png" $1.mpg
