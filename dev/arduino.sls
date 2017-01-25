{% set arduino = {
  'Gentoo': 'dev-embedded/arduino'
}.get(grains.os_family) %}

arduino:
  pkg.installed:
    - name: {{ arduino }}

{% if grains.os_family == 'Gentoo' %}

sys-devel/crossdev:
  pkg.installed: []

#TODO
# Gentoo requires a bit of extra setup to get crossdev working.
# First: set up a local portage overlay
# Then: run
#   sudo USE="-openmp -hardened -sanitize -vtv" crossdev -s4 -S --target avr
# Eventually I'd like to have salt do this, but it will be a bit tricky to set up

{% endif %}
