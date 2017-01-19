# This is so ubiquitous and small that I don't feel the need to separate the two

{% set unzip = {
  'Arch': 'unzip',
  'Gentoo': 'app-arch/unzip',
}.get(grains.os_family) %}

{% set p7zip = {
  'Arch': 'p7zip',
  'Gentoo': 'app-arch/p7zip',
}.get(grains.os_family) %}

{% set unrar = {
  'Gentoo': 'app-arch/unrar'
}.get(grains.os_family) %}

unzip:
  pkg.installed:
    - name: {{ unzip }}

p7zip:
  pkg.installed:
    - name: {{ p7zip }}

unrar:
  pkg.installed:
    - name: {{ unrar }}
