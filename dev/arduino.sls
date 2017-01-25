{% if grains.os_family == 'Gentoo' %}

sys-devel/crossdev:
  pkg.installed: []

{% endif %}

{% set arduino = {
  'Gentoo': 'dev-embedded/arduino'
}.get(grains.os_family) %}

arduino:
  pkg.installed:
    - name: {{ arduino }}
