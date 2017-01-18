{% set oraclejava = {
  'Gentoo': 'dev-java/oracle-jdk-bin'
}.get(grains.os_family) %}

oraclejava:
  pkg.installed:
    - name: {{ oraclejava }}
    
