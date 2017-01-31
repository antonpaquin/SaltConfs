{% set valgrind = {
  'Gentoo': 'dev-util/valgrind'
}.get(grains.os_family) %}
