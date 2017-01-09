# Mupdf is pretty minimal. Maybe a more featured pdf viewer would be nice?

{% set mupdf = {
  'Arch': 'mupdf',
  'Gentoo': 'app-text/mupdf',
}.get(grains.os_family) %}

mupdf:
  pkg.installed:
    - name: {{ mupdf }}
