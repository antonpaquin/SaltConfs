#! /bin/bash

echo -n "project name: " &&
while true; do
  read projname &&
  if [[ `python /home/hacker/directory.py exists $projname` -eq "0" ]]; then
    echo "project exists!"
    exit 0
  else
    echo "no project with that name"
    echo -n "try again: "
  fi
done
