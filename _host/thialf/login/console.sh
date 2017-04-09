#!/bin/bash

if [[ "$1" == "new" ]]; then
  # Usage: console.sh new ProjectName
  if [[ `python directory.py exists $2` -eq "0" ]]; then
    echo "Already exists, exiting"
    exit 1
  else
    # Create a new project / docker thing
    newPort=`python directory.py new $2`
    docker run -d -p $newPort:80 --name $2 --hostname $2 basic
    python /home/hacker/apache/apacheconf.py new $2 $newPort
    systemctl restart apache2
    exit 0
  fi
fi

if [[ "$1" == "useradd" ]]; then
  # Usage: console.sh useradd ProjectName Username Password
  if [[ `python directory.py exists $2` -eq "1" ]]; then
    echo "No project \"$2\" found"
    exit 1
  else
    # Add a user with docker exec
    docker exec $2 useradd -m -s /bin/bash $3
    # Experimentally derived password set
    docker exec $2 bash -c "yes $4 | passwd $3"
    exit 0
  fi
fi

echo "command \"$1\" not supported"
