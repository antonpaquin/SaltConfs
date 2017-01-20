# Ensure everything is always up to salt spec

{% set machines = [
  'Argo',
  'BlueRidge',
  'Nimitz',
  'Vega'
] %}

{% for machine in machines %}
salt '{{machine}}' state.apply {{ machine.lower() }}:
  cron.present:
    - minute: '*/15'
{% endfor %}
