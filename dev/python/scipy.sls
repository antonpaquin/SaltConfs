{% set scipy = {
  'Gentoo': 'sci-libs/scipy'
}.get(grains.os_family) %}

{% set lapack = {
  'Gentoo': 'sci-libs/lapack-reference'
}.get(grains.os_family) %}

scipy:
  pkg.installed:
    - name: {{ scipy }}

lapack:
  pkg.installed:
    - name: {{ lapack }}
