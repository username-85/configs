#!/bin/sh
set -e

#rm -f /tmp/*.text_scratchpad
#tmp_file=$(mktemp -u).text_scratchpad
tmp_file="/tmp/vim.txt"

st -c "__text_scratchpad" -e "$SHELL" -lc "sleep 0.1 && vim -c startinsert -c 'Spell' ${tmp_file}" && xclip -selection clipboard < "$tmp_file"
