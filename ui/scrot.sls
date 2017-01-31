{% set scrot = {
  'Gentoo': 'media-gfx/scrot'
}.get(grains.os_family) }

scrot:
  pkg.installed:
    - name: {{ scrot }}
