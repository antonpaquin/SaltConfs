hacker:
  user.present:
    - shell: /home/hacker/projectRedirect.sh

/home/hacker/projectRedirect.sh:
  file.managed:
    - source: salt://_host/thialf/login/projectRedirect.sh
    - user: hacker
    - group: hacker
    - mode: 777
    - require:
      - user: hacker
