# Ensure everything is always up to salt spec

{% set machines = [
  'Argo',
  'BlueRidge',
  'Nimitz',
  'Vega'
] %}

/home/pi/SaltRun:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 755

# There's a templated shell script that runs the salt command, and a state to
# stick that script in the crontab
{% for machine in machines %}
/home/pi/SaltRun/{{ machine.lower() }}.sh:
  file.managed:
    - source: salt://_host/blueridge/synchronize/sync.sh
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 755
    - template: jinja
    - context:
        machine: "{{ machine }}"
    - require:
      - file: /home/pi/SaltRun

  cron.present:
    - minute: '*/15'
    - require:
      - file: /home/pi/SaltRun/{{ machine.lower() }}.sh

{{ pillar.get('data_dir') }}/SaltLogs/{{ machine }}:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 755

{% endfor %}
