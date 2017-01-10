# Nimitz build conf

include:

  # OS basics
  - os.gentoo

  # Setup basic files
  - nimitz.storage

  # Connect to the fleet
  # - nimitz.fleet

  # General programs
  - nimitz.programs

  # Accessibility
  - nimitz.desktop
  - nimitz.scripts

  # Add users
  - user.anton
  - user.root
