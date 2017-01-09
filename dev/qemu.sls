{% set qemu = {
  'Arch': 'qemu',
  'Gentoo': 'app-emulation/qemu',
}.get(grains.os_family) %}

qemu:
  pkg.installed:
    - name: {{ qemu }}
