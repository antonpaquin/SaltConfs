# I dunno, maybe zsh would be better? I'm mostly with urxvt out of habit

include:
  - ui.xresources

{% set urxvt = {
  'Arch': 'rxvt-unicode',
  'Gentoo': 'x11-terms/rxvt-unicode',
}.get(grains.os_family) %}

rxvt-unicode:
  pkg.installed:
    - name: {{ urxvt }}

urxvt-xresources:
  file.managed:
    - name: {{ pillar.get('data_dir') }}/.Xresources.d/urxvt
    - source: salt://ui/urxvt/xresources
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 644
    - require:
      - file: xresources.d

urxvt-xdefaults:
  file.append:
    - name: {{ pillar.get('data_dir') }}/.Xdefaults
    - text: "#include \"{{ pillar.get('data_dir') }}/.Xresources.d/urxvt\""
    - require:
      - file: xdefaults
