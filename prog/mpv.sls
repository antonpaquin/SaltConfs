# Going over to the mpv camp. Why is this a war?

{% set mpv = {
  'Arch': 'mpv',
  'Gentoo': 'media-video/mpv',
}.get(grains.os_family) %}

mpv:
  pkg.installed:
    - name: {{ mpv }}
