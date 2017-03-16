#!/bin/bash

if [[ $1 -eq "new" ]]; then
  if [[ `python directory.py exists $2` -eq "0" ]]; then
    echo "Already exists, exiting"
    exit 1
  else
    # Create a new project / docker thing
    newPort=`python directory.py new $2`
    docker run -d -p $newPort:80 --name $2 --hostname $2 basic
    exit 0
  fi
fi

if [[ $1 -eq "useradd" ]]; then
  if [[ `python directory.py exists $1` -eq "1" ]]; then
    echo "No project \"$1\" found"
    exit 1
  else
    # Add a user via some docker exec bullshit
    exit 0
  fi
fi
