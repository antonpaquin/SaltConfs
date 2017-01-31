{% set usbutils = {
  'Gentoo': 'sys-apps/usbutils'
}.get(grains.os_family) %}

usbutils:
  pkg.installed:
    - name: {{ usbutils }}
