{% set docker = {
  'Arch': 'docker',
  'Gentoo': 'app-emulation/docker'
}.get(grains.os_family) %}

docker:
  pkg.installed:
    - name: {{ docker }}
