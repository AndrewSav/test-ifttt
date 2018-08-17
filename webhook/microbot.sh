#!/bin/bash

shopt -s nocasematch

case "$1" in
 "restart" ) docker restart testifttt_microbot_1;;
 "start" ) docker start testifttt_microbot_1;;
 "stop" ) docker stop testifttt_microbot_1;;
 *) echo "unknown parameter $1. expected either start or stop";;
esac
