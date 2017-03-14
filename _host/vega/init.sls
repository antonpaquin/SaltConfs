# Master conf for Vega. Should track the various tools I've got running.

include:
  # Add the typical raspi user I expect
  - user.pi

  # Vegarails, mainly, see weebstack/init.sls
  - _host.vega.weebstack

  # Music support stuff, see music/init.sls
  - _host.vega.music

  # Typical programming stuff, check it's file
  - _host.vega.dev

  # Message of the day
  - utils.motd

# Mount the storage stuff. Yes, drive is sda2 and 2drive is sda1. Might
# eventually need changing if I mess with / reformat / revolume that thing.
/home/pi/drive:
  mount.mounted:
    - device: /dev/sda2
    - fstype: fuse
    - mkmnt: True
    - require:
      - user: pi

/home/pi/2drive:
  mount.mounted:
    - device: /dev/sda1
    - fstype: fuse
    - mkmnt: True
    - require:
      - user: pi
