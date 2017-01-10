{% set arc = {
  'Arch':'arc-gtk-theme',
  'Gentoo':'x11-themes/arc-theme'
}.get(grains.os_family) %}

arc-theme:
  pkg.installed:
    - name: {{ arc }}
    
