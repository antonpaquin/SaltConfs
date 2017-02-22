{% set jupyter = {
  'Gentoo': 'dev-python/jupyter'
}.get(grains.os_family) %}

jupyter:
  pkg.installed:
    - name: {{ jupyter }}
