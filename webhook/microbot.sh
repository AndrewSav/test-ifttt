#!/bin/bash

shopt -s nocasematch

case "$1" in
 "start" ) touch /control/success;;
 "stop" ) rm /control/success;;
 *) echo "unknown parameter $1. expected either start or stop";;
esac
