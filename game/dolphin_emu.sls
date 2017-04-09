# Pray it all works out

{% set dolphin = {
  'Arch': 'dolphin-emu',
  'Gentoo': 'games-emulation/dolphin',
}.get(grains.os_family) %}

dolphin:
  pkg.installed:
    - name: {{ dolphin }}
