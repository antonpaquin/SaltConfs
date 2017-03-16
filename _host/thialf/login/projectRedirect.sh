#! /bin/bash

echo -n "Project name: " &&
while true; do
  read projname &&
  if [[ `python /home/hacker/directory.py exists $projname` -eq "0" ]]; then
    sudo /home/hacker/login.sh $projname
    exit 0
  else
    echo "No project with that name. Try again?"
    echo -n "Project name: "
  fi
done
