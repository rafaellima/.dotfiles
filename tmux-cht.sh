#!/usr/bin/env bash

languages=$(echo "bash c c++ clojure golang javascript json lua markdown ruby sql typescript vim" | tr ' ' '\n')
utils=$(echo "find xargs fzf tmux basename tr sed awk" | tr ' ' '\n')
selected=$(echo -e "$languages\n$utils" | fzf)

read -p "Enter a command: " cmd

if echo $languages | grep -qs $selected; then
  tmux split-window -h bash -c "curl cht.sh/$selected/$(echo $cmd | tr ' ' '+') | less"
else
  tmux split-window -h bash -c "curl cht.sh/$selected~$cmd | less"
fi


