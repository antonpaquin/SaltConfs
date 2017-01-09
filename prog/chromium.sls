# I wonder if there's a way to salt in extensions? That would be nice

{% set chromium = {
  'Arch': 'chromium',
  'Gentoo': 'www-client/chromium',
}.get(grains.os_family) %}

chromium:
  pkg.installed:
    - name: {{ chromium }}

#TODO from custom aur repo: pepper flash
# Wait was this deprecated? I don't even know
