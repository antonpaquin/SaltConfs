# Xorg is weird enough that I'd rather just have a separate file for each distro

# Make sure to require_in all the pkg.install's -- they won't be activated
# unless the file is included

# Also please don't directly include ui.xorg.---
# Go through this file instead

{% set target = {
  'Arch': 'arch',
  'Gentoo': 'gentoo',
}.get(grains.os_family) %}

include:
  - ui.xorg.{{ target }}

built_xorg:
  test.nop: []
