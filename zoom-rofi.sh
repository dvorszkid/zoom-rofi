#!/bin/sh

cd $(dirname $(realpath $0))

LINE_NR=`cat ./config | cut -d ' ' -f 2- | rofi -dmenu -i -format d`
ZOOM_URL=`sed "${LINE_NR}q;d" ./config | cut -d ' ' -f 1`
echo "Zoom URL: " $ZOOM_URL

ZOOM_CUSTOM_URI=`echo $ZOOM_URL | sed -E "s|https://.*zoom.us/j/([0-9]*)\??([^?]*)|zoommtg://zoom.us/join?action=join\&confno=\1\&\2|"`
echo "Zoom Custom URI: " $ZOOM_CUSTOM_URI

xdg-open "$ZOOM_CUSTOM_URI"
