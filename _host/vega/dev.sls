# Stuff I need for programming, at least on vega. Might be worth thinking a
# little harder about what things I want _everywhere_, and making this a top
# level .sls
include:
  - dev.python
  - dev.rails
  - ssh.slave
  - dev.git

build-essential:
  pkg.installed
