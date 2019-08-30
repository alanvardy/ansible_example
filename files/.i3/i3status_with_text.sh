#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
   read line
   echo "F1: Code | F2: Terminals | F3: Overview | F4: Email | F5: Slack/Spotify |  $line" || exit 1
done