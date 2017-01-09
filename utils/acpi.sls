# Power / battery management stuff

{% set acpi = {
  'Arch': 'acpi',
  'Gentoo': 'sys-power/acpi',
}.get(grains.os_family) %}

acpi:
  pkg.installed:
    - name: {{ acpi }}
