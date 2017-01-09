# I dunno, maybe zsh would be better? I'm mostly with urxvt out of habit

{% set urxvt = {
  'Arch': 'rxvt-unicode',
  'Gentoo': 'x11-terms/rxvt-unicode',
}.get(grains.os_family) %}

rxvt-unicode:
  pkg.installed:
    - name: {{ urxvt }}

{{ pillar.get('data_dir') }}/.Xdefaults:
  file.managed:
    - source: salt://ui/urxvt/Xdefaults
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 644
    - require:
      - file: {{ pillar.get('data_dir') }}
