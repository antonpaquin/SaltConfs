# Install git, and configure it to have my username and email. Prevents the standard git complaining on first use

{% set git = {
  'Arch': 'git',
  'Debian': 'git',
  'Gentoo': 'dev-vcs/git',
}.get(grains.os_family) %}

git:
  pkg.installed:
    - name: {{ git }}

# For some reason, git is very upset that $HOME is not set
HOME:
  environ.setenv:
    - value: /home/{{ pillar.get('primary_user') }}

git_conf_username:
  git.config_set:
    - name: user.name
    - value: Anton Paquin
    - global: True
    - user: {{ pillar.get('primary_user') }}
    - require:
      - user: {{ pillar.get('primary_user') }}
      - environ: HOME

git_conf_email:
  git.config_set:
    - name: user.email
    - value: antonpaquin@gmail.com
    - global: True
    - user: {{ pillar.get('primary_user') }}
    - require:
      - user: {{ pillar.get('primary_user') }}
      - environ: HOME
