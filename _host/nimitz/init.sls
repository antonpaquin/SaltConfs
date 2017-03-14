# Nimitz build conf

include:

  # OS basics
  - os.gentoo

  # Setup basic files
  - _host.nimitz.storage

  # Connect to the fleet
  - _host.nimitz.fleet

  # General programs
  - _host.nimitz.programs

  # Accessibility
  - _host.nimitz.desktop
  - _host.nimitz.scripts

  # Add users
  - user.anton
  - user.root
