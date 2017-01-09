# RIP my compile time...

{% set libreoffice = {
  'Arch': 'libreoffice-fresh',
  'Gentoo': 'app-office/libreoffice',
}.get(grains.os_family) %}

libreoffice:
  pkg.installed:
    - name: {{ libreoffice }}
