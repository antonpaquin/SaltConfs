{% set use = {
  'app-crypt/pinentry': 'gnome-keyring',

  'dev-db/postgresql': 'kerberos',

  'dev-libs/libgit2': 'ssh',
  'dev-libs/openssl': '-bindist',

  'media-video/ffmpeg': 'vpx opus vorbis',

  'media-libs/libvpx': 'svc',
  'media-libs/mesa': 'gles2',

  'net-misc/iputils': '-caps -filecaps',
  'net-misc/openssh': '-bindist',

  'net-nds/openldap': 'sasl',

  'sys-apps/busybox': '-static',

  'sys-libs/libseccomp': 'static-libs',
  'sys-libs/zlib': 'minizip',

  'x11-libs/cairo': 'xcb',
  'x11-libs/libxcb': 'xkb'
  } %}

{% for package, flags in use.iteritems() %}
package.use/{{ package }}:
  file.append:
    - name: /etc/portage/package.use
    - text: {{package}} {{flags}}
{% endfor %}
