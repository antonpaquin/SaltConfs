# This is usually useful

{% set nmap = {
  'Arch': 'nmap',
  'Gentoo': 'net-analyzer/nmap',
}.get(grains.os_family) %}

nmap:
  pkg.installed:
    - name: {{ nmap }}
