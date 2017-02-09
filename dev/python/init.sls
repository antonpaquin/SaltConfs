# What kind of weirdo wants python2 or python without pip?
# TODO: install some typical pip packages (e.g. bs4)

{% set python = {
  'Arch': 'python',
  'Debian': 'python',
  'Gentoo': 'dev-lang/python',
}.get(grains.os_family) %}

{% set pip = {
  'Arch': 'python-pip',
  'Debian': 'python-pip',
  'Gentoo': 'dev-python/pip',
}.get(grains.os_family) %}

include:
  - dev.python.pip.piplibs

python:
  pkg.installed:
    - name: {{ python }}

pip:
  pkg.installed:
    - name: {{ pip }}
    - require:
      - pkg: python
