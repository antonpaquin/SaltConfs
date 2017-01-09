# Lightdm starts wm's
# todo configure lightdm to find bspwm?
# also rice but that comes later

{% set lightdm = {
  'Arch': 'lightdm',
  'Gentoo': 'x11-misc/lightdm',
}.get(grains.os_family) %}

{% set lightdm_gtk = {
  'Arch': 'lightdm-gtk-greeter',
  'Gentoo': 'x11-misc/lightdm-gtk-greeter',
}.get(grains.os_family) %}

lightdm:
  pkg.installed:
    - name: {{ lightdm }}

lightdm-gtk-greeter:
  pkg.installed:
    - name: {{ lightdm_gtk }}
    - require:
      - pkg: lightdm
