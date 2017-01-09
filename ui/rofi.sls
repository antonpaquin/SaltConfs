{% set rofi = {
  'Arch':'rofi',
  'Gentoo':'x11-misc/rofi',
}.get(grains.os_family) %}

rofi:
  pkg.installed:
    - name: {{ rofi }}
