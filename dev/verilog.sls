{% set verilog = {
  'Gentoo': 'sci-electronics/iverilog'
}.get(grains.os_family) %}

{% set gtkwave = {
  'Gentoo': 'sci-electronics/gtkwave'
}.get(grains.os_family) %}

verilog:
  pkg.installed:
    - name: {{ verilog }}

gtkwave:
  pkg.installed:
    - name: {{ gtkwave }}
