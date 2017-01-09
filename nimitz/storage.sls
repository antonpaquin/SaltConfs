# As defined in the pillar, this will create and populate the top level home
# directory things

# Make ~, and make everything in ~ owned by anton, and files are accessible by
# anton group
{{ pillar.get('data_dir') }}:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 770
    - makedirs: True
    - recurse:
      - user
      - group
    - require:
      - user: {{ pillar.get('primary_user') }}

# Build TLD home files
{% for tld in pillar.get('top_level_dirs') %}
{{ pillar.get('data_dir') + '/' +  tld }}:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 770
    - makedirs: True
    - require:
      - file: {{ pillar.get('data_dir') }}
    - require_in:
      - test: built_home
{% endfor %}

# No-op that depends on home being built
built_home:
  test.nop:
    - do: nothing

# Extras in ~/whatever
{% for dir in ['Documents/etc', 'Documents/Projects', 'Documents/School', 'Documents/Work', 'Scripts/.rice'] %}
{{ pillar.get('data_dir') + '/' + dir }}:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 770
    - makedirs: True
    - recurse:
      - user
      - group
    - require:
      - test: built_home
{% endfor %}
