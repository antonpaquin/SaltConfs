{% set valgrind = {
  'Gentoo': 'dev-util/valgrind'
}.get(grains.os_family) %}

{% set valkyrie = {
  'Gentoo': 'dev-util/valkyrie'
}.get(grains.os_family) %}

valgrind:
  pkg.installed:
    - name: {{ valgrind }}

valkyrie:
  pkg.installed:
    - name: {{ valkyrie }}
