# alsa stuff to (hopefully) make things work out the gate

{% set alsa_utils = {
  'Arch': 'alsa-utils',
  'Gentoo': 'media-sound/alsa-utils',
}.get(grains.os_family) %}

# Primarily alsamixer, I assume there's other stuff too
alsa-utils:
  pkg.installed:
    - name: {{ alsa_utils }}

# Sets the sound card in kernel? In alsa for lack of a better place
/etc/modprobe.d/modprobe.conf:
  file.managed:
    - source: salt://utils/alsa/modprobe.conf
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 644

# Make sure we're actually using that sound card
/etc/asound.conf:
  file.managed:
    - source: salt://utils/alsa/asound.conf
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 644
