include:

  # The standard pi user
  - user.pi

  # SSH keys
  - ssh.slave

  # Apache for "load balancing"
  - prog.apache

  # Salt everything, in the crontab
  - blueridge.synchronize

  # Git so I can sync things better
  - dev.git

  # Something nice for login message
  - blueridge.motd
