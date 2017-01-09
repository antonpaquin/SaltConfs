# Hopefully all works well.
#TODO: get some kind of spice

{% set kicad = {
  'Arch': 'kicad',
  'Gentoo': 'sci-electronics/kicad',
}.get(grains.os_family) %}

kicad:
  pkg.installed:
    - name: {{ kicad }}
