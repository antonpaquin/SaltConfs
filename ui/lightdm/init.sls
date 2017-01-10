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

# Include the gtk theme I want
include:
  - ui.theme.arc

lightdm:
  pkg.installed:
    - name: {{ lightdm }}

lightdm-conf:
  file.managed:
    - name: /etc/lightdm/lightdm.conf
    - source: salt://ui/lightdm/lightdm.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: lightdm

lightdm-gtk-greeter:
  pkg.installed:
    - name: {{ lightdm_gtk }}
    - require:
      - pkg: lightdm

lightdm-greeter-conf:
  file.managed:
    - name: /etc/lightdm/lightdm-gtk-greeter.conf
    - source: salt://ui/lightdm/lightdm-gtk-greeter.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: lightdm-gtk-greeter
