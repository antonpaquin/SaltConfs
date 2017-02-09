{% set apacheutils = {
  'Debian': 'apache2-utils'
}.get(grains.os_family) %}

apache2-utils:
  pkg.installed:
    - name: {{ apacheutils }}
