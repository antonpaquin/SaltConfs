{% set screenfetch = {
  'Gentoo': 'app-misc/screenfetch'
}.get(grains.os_family) %}

screenfetch:
  pkg.installed:
    - name: {{ screenfetch }}
