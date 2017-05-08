{% set netcat = {
  'Gentoo': 'net-analyzer/netcat'
}.get(grains.os_family) %}


netcat:
  pkg.installed:
    - name: {{ netcat }}
