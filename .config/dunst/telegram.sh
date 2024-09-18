#!/bin/sh

if [ "$HOSTNAME" = "work" ]; then
    date_str=$(date +"%F %R" -d @$DUNST_TIMESTAMP)
    echo "$date_str - $DUNST_SUMMARY" > "$HOME/data/Mail/telegram/new/last"
fi
