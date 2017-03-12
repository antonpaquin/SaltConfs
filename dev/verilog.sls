{% set verilog = {
  'Gentoo': 'sci-electronics/iverilog'
}.get(grains.os_family) %}

verilog:
  pkg.installed:
    - name: {{ verilog }}
