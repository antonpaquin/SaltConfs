include:

  # The standard pi user
  - user.pi

  # SSH keys
  - ssh.slave

  # Apache, distribute connections on this end as opposed to BR
  - prog.apache
  - prog.apache.apache-utils

  # Some thialf-specific apache conf
  - _host.thialf.apache

  # Git is necessary
  - dev.git

  # Something nice for login message
  - utils.motd
