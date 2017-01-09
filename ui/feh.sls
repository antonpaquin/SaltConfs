# Feh does image displays, but more interestingly does backgrounds.

{% set feh = {
  'Arch': 'feh',
  'Gentoo': 'media-gfx/feh',
}.get(grains.os_family) %}

feh:
  pkg.installed:
    - name: {{ feh }}

#Todo: put the background file somewhere useful, turn it on with fehbg
