# Hopefully, by the time this is configured, I have a working x server

{% set x_pkgs = [
    'xorg-server',
    'xorg-xinit',
    'xorg-xinput',
    'xorg-xhost',
    'xf86-input-libinput',
    'xf86-video-intel',
    'xorg-utils' ]
%}

{% for pkg in x_pkgs %}
{{ pkg }}:
  pkg.installed:
    - require_in:
      - test: built_xorg
{% endfor %}
