# Adds the pi user with the standard password.
# Will go away (I actually hashed it this time!)

pi:
  user.present:
    - optional_groups: docker
    - password: $1$xyz$.APXLzfnDfeg/Qdr4HFdp0
    - shell: /bin/bash

# TODO put this guy in sudoers
