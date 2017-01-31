{% set avrdude = {
  'Debian': 'avrdude'
}.get(grains.os_family) %}

avrdude:
  pkg.installed:
    - name: {{ avrdude }}
