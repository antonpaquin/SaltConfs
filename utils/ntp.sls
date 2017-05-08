{% set ntp = {
  'Gentoo': 'net-misc/ntp'
}.get(grains.os_family) %}

ntp:
  pkg.installed:
    - name: {{ ntp }}
