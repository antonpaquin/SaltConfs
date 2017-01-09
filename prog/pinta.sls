# For lack of a better paint program. There are some nice open source ones on
# OSX (one is installed on Carpathia, might want to check it out) that might
# work better

{% set pinta = {
  'Arch': 'pinta',
  'Gentoo': 'media-gfx/pinta',
}.get(grains.os_family) %}

pinta:
  pkg.installed:
    - name: {{ pinta }}
