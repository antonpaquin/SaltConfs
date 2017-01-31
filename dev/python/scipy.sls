{% set scipy = {
  'Gentoo': 'sci-libs/scipy'
}.get(grains.os_family) %}

scipy:
  pkg.installed:
    - name: {{ scipy }}
