{% set piplibs = [
  'pandas',
  'seaborn',
  'pandas-datareader',
  'gmpy2'
] %}

{% for lib in piplibs %}
{{ lib }}:
  pip.installed:
    - require:
      - pkg: pip
      
{% endfor %}
