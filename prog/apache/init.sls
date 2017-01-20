# Module should install apache2, which works for (at least) debian systems.

{% set apache = {
  'Arch': 'apache2',
  'Debian': 'apache2',
  'Gentoo': 'www-servers/apache',
}.get(grains.os_family) %}

{% set conf = {
  'BlueRidge': 'blueridge.conf',
  'Vega': 'vega.conf'
}.get(pillar.get('machine')) %}

apache2:
  pkg.installed:
    - name: {{ apache }}
  service.running:
    - watch:
      - pkg: apache2
      - test: apache2-configured

apache2-configured:
  test.nop: []

# Place the config file
/etc/apache2/apache2.conf:
  file.managed:
    - source: salt://prog/apache/{{ conf }}
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: apache2
    - require_in:
      - test: apache2-configured

# I make liberal use of mod_proxy in my setups, and apparently it doesn't come
# enabled by default
/etc/apache2/mods-enabled/proxy_http.load:
  file.symlink:
    - target: /etc/apache2/mods-available/proxy_http.load
    - require_in:
      - test: apache2-configured

/etc/apache2/mods-enabled/proxy.load:
  file.symlink:
    - target: /etc/apache2/mods-available/proxy.load
    - require_in:
      - test: apache2-configured
