# Wifi setup

# Dialog is required for the GUI
include:
  - utils.dialog

{% set netctl = {
  'Arch': 'netctl',
  'Gentoo': 'net-misc/netctl',
}.get(grains.os_family) %}

# Connects to networks, includes wifi-menu
netctl:
  pkg.installed:
    - name: {{ netctl }}

{% for network in ['BUWifi', 'Kattegat', 'pnpwifi', 'ps50'] %}
/etc/netctl/{{ network }}:
  file.managed:
    - source: salt://utils/netctl/{{ network }}
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: netctl
{% endfor %}
