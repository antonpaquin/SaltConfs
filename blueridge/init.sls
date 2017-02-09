include:

  # The standard pi user
  - user.pi

  # SSH keys
  - ssh.slave

  # Apache for "load balancing"
  - prog.apache
  - prog.apache.apache-utils

  # Salt everything, in the crontab
  - blueridge.synchronize

  # Git so I can sync things better
  - dev.git

  # Something nice for login message
  - utils.motd

  # For now, blueridge should be able to flash arduino
  - dev.embedded.avrdude
