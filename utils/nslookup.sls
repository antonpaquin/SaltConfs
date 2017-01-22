{% set nslookup = {
  'Gentoo': 'net-dns/bind-tools'
}.get(grains.os_family) %}

nslookup:
  pkg.installed:
    - name: {{ nslookup }}
