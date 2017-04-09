{% set wine = {
  'Gentoo': 'app-emulation/wine'
}.get(grains.os_family) %}

wine:
  pkg.installed:
    - name: {{ wine }}
