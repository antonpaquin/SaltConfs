# Install git, and configure it to have my username and email. Prevents the standard git complaining on first use

{% set git = {
  'Arch': 'git',
  'Gentoo': 'dev-vcs/git',
}.get(grains.os_family) %}

git:
  pkg.installed:
    - name: {{ git }}

git_conf_username:
  git.config_set:
    - name: user.name
    - value: Anton Paquin
    - global: True
    - user: anton
    - require:
      - user: anton

git_conf_email:
  git.config_set:
    - name: user.email
    - value: antonpaquin@gmail.com
    - global: True
    - user: anton
    - require:
      - user: anton
