{% set filezilla = {
  'Gentoo': 'net-ftp/filezilla'
}.get(grains.os_family) %}

filezilla:
  pkg.installed:
    - name: {{ filezilla }}
