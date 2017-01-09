# This is mainly required for netctl, but it's separate enough, and possibly
# required by other tools, to be a separate sls

{% set dialog = {
  'Arch': 'dialog',
  'Gentoo': 'dev-util/dialog',
}.get(grains.os_family) %}

dialog:
  pkg.installed:
    - name: {{ dialog }}
