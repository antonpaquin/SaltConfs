# Module should just install apache2, which works for (at least) debian systems.
# I eventually plan to add a var somewhere which will specify the apache_conf
# location, but for now it's hardwired to vega.conf (which should possibly be
# stuck in the vega directory).

# TODO currently this is set up for either Arch or Gentoo, of which Vega is
# neither, but it only has Vega's conf. Broken...

{% set apache = {
  'Arch': 'apache2',
  'Debian': 'apache2',
  'Gentoo': 'www-servers/apache',
}.get(grains.os_family) %}

apache2:
  pkg.installed:
    - name: {{ apache }}
  service.running:
    - watch:
      - pkg: apache2
      - file: /etc/apache2/apache2.conf

# Place the config file
/etc/apache2/apache2.conf:
  file.managed:
    - source: salt://prog/apache/vega.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: apache2
