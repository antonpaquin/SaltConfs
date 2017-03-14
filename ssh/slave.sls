# If I've installed salt-minion, ssh is probably default, but can't hurt to make
# sure. This will also add Nimitz's public key so ssh gets easy

{% set ssh = {
  'Arch': 'openssh',
  'Debian': 'ssh',
  'Gentoo': 'net-misc/openssh'
}.get(grains.os_family) %}

openssh:
  pkg.installed:
    - name: {{ ssh }}

# The authorized_keys file has Nimitz's public key. Should be good to spread
# around my machines. Bonus side effect, this will also keep other keys out,
# which is good, I guess?

#TODO since Nimitz swapped to gentoo, I might have to regen this anyway
/home/pi/.ssh/authorized_keys:
  file.managed:
    - source: salt://ssh/authorized_keys
    - user: pi
    - group: pi
    - mode: 644
    - makedirs: True
    - require:
      - pkg: ssh
      - user: pi
