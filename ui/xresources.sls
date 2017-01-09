# The idea here is to use file.managed to put whatever conf files in
# ~/.Xresources.d, and use file.line to add various #include commands in
# .Xdefaults

#TODO should xdefaults be made ~/.Xresources  ? I think it's a legacy / new
#thing, but it seems to work fine for now

xdefaults:
  file.managed:
    - name: {{ pillar.get('data_dir') }}/.Xdefaults
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 644
    - require:
      - test: built_home

xresources.d:
  file.directory:
    - name: {{ pillar.get('data_dir') }}/.Xresources.d
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 755
    - require:
      - test: built_home
