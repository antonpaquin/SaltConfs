# GNU multi-precision

{% set gmp = {
  'Gentoo': 'dev-libs/gmp'
}.get(grains.os_family) %}

gmp:
  pkg.installed:
    - name: {{ gmp }}
