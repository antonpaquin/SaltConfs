# As far as I know, the best general purpose text editor.
# TODO: get the fuck away from node.js kill it with fire

{% set atom = {
  'Arch': 'atom',
  'Gentoo': 'app-editors/atom',
}.get(grains.os_family) %}

atom:
  pkg.installed:
    - name: {{ atom }}
