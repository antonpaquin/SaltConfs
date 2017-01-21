#I'll be quite surprised if I can actually run rails with just this setup, but a
#good start

{% set ruby = {
  'Arch': 'ruby',
  'Debian': 'ruby',
  'Gentoo': 'dev-lang/ruby'
}.get(grains.os_family) %}

{% set rails = {
  'Arch': 'rails',
  'Debian': 'rails',
  'Gentoo': 'dev-ruby/rails',
}.get(grains.os_family) %}

{% set passenger = {
  'Arch': 'ruby-passenger',
  'Debian': 'ruby-passenger',
  'Gentoo': 'www-apache/passenger',
}.get(grains.os_family) %}

ruby:
  pkg.installed:
    - name: {{ ruby }}

rails:
  pkg.installed:
    - name: {{ rails }}
    - require:
      - pkg: ruby

# This might not behave as expected on a gentoo system -- installs the apache specific version?
ruby-passenger:
  pkg.installed:
    - name: {{ passenger }}
    - require:
      - pkg: rails
