{{ pillar.get('data_dir') + '/Downloads/sendToVega.sh'}}:
  file.managed:
    - source: salt://nimitz/scripts/sendToVega.sh
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 777
    - require:
      - test: built_home

{% for script in ['trackballscroll', 'moviemode', 'unmoviemode'] %}
{{ pillar.get('data_dir') + '/Scripts/' + script }}:
  file.managed:
    - source: salt://nimitz/scripts/{{script}}
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 777
    - require:
      - test: built_home
{% endfor %}
