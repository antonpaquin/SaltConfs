# Fonts are useful enough to not be fragmented, for now I think

{% set fontconfig = {
  'Arch': 'fontconfig',
  'Gentoo': 'media-libs/fontconfig',
}.get(grains.os_family) %}

{% set unifont = {
  'Arch': 'ttf-unifont',
  'Gentoo': 'media-fonts/unifont',
}.get(grains.os_family) %}

{% set fontawesome = {
  'Arch': 'font-awesome',
  'Gentoo': 'media-fonts/fontawesome',
}.get(grains.os_family) %}

{% set terminus = {
  'Arch': 'terminus-font',
  'Gentoo': 'media-fonts/terminus-font',
}.get(grains.os_family) %}


fontconfig:
  pkg.installed:
    - name: {{ fontconfig }}

unifont:
  pkg.installed:
    - name: {{ unifont }}

fontawesome:
  pkg.installed:
    - name: {{ fontawesome }}

terminus:
  pkg.installed:
    - name: {{ terminus }}
