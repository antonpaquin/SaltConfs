cozy-repo:
  pkgrepo.managed:
    - name: deb https://debian.cozycloud.cc/debian jessie cozy
    - key_url: https://debian.cozycloud.cc/cozy.gpg.key

python-cozy-management:
  pkg.installed:
    - require:
      - pkgrepo: cozy-repo
