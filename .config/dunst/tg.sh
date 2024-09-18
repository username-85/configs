#!/bin/sh

date_str=$(date +"%F %R" -d @$DUNST_TIMESTAMP)

echo "$date_str - $DUNST_SUMMARY" > "$HOME/data/Mail/tg/new/last"
