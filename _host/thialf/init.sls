include:

# Standard anton-pi stuff

# The standard pi user
  - user.pi
# SSH keys
  - ssh.slave
# Something nice for login message
  - utils.motd

# Built to be used by others

# Apache, distribute connections on this end as opposed to BR
  - prog.apache
  - prog.apache.apache-utils
  - _host.thialf.apache
# Git is necessary
  - dev.git
# Partially depends on python
  - dev.python
# User target for ssh
  - _host.thialf.login
# Locally host important packages
  - _host.thialf.repository
# Docker container is the target machine
  - _host.thialf.docker
