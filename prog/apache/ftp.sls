# With apache, places a link that makes the ftp dir accessible. This is common
# enough in my systems, but Vega (which has many such links) might be improved
# by manually creating a vega_links sls

/var/www/html/ftp:
  file.symlink:
    - target: {{pillar.get('ftp_dir')}}
    - makedirs: True
    - require:
      - pkg: apache2
