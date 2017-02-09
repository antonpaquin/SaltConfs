{% set gummi = {
  'Gentoo': 'app-editors/gummi'
}.get(grains.os_family) %}

gummi:
  pkg.installed:
    - name: {{ gummi }}
