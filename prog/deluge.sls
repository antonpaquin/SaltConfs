# Everything I need for a headless deluge.

{% set deluge = {
  'Arch': 'deluge',
  'Debian': 'deluge',
  'Gentoo': 'net-p2p/deluge',
}.get(grains.os_family) %}

deluge:
  pkg.installed:
    - name: {{ deluge }}

# deluged:
#   service.running:
#     - enable: True
#     - watch:
#       - pkg: deluge
#     - onfail:
#       - cmd: deluge_restart
#
# deluge_restart:
#   cmd.run:
#     - name: systemctl restart deluged
