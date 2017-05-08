{% set use = {
  'app-crypt/pinentry': 'gnome-keyring',

  'app-text/poppler': 'cairo',
  'app-text/xmlto': 'text',

  'dev-db/postgresql': 'kerberos',

  'dev-libs/libgit2': 'ssh',
  'dev-libs/openssl': '-bindist',

  'dev-python/numpy' : 'lapack',

  'media-libs/libvpx': 'svc postproc',
  'media-libs/mesa': 'gles2',

  'media-video/ffmpeg': 'vpx opus vorbis',
  'media-video/mpv': 'lua',

  'net-misc/iputils': '-caps -filecaps',
  'net-misc/openssh': '-bindist',

  'net-nds/openldap': 'sasl',

  'sys-apps/busybox': '-static',

  'sys-libs/libseccomp': 'static-libs',
  'sys-libs/zlib': 'minizip',

  'x11-libs/cairo': 'xcb',
  'x11-libs/libxcb': 'xkb',
  'x11-misc/tint2': 'tint2conf'
  } %}

/etc/portage/package.use:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755


{% for package, flags in use.iteritems() %}
package.use/{{ package }}:
  file.append:
    - name: /etc/portage/package.use/main.conf
    - text: {{package}} {{flags}}
    - require:
      - file: /etc/portage/package.use
{% endfor %}
