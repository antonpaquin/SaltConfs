# Primarily, this sets what packages are allowed to use the ~amd64 testing lib

{% set use_testing = [
  'app-admin/salt-2016.11.0',
  'x11-misc/sxhkd-0.5.7',
  'app-eselect/eselect-electron-1.0.0',
  'app-editors/atom-1.12.2',
  'dev-util/electron-1.3.6',
  'x11-wm/bspwm-0.9.2',
  'x11-libs/xcb-util-xrm-1.2',
  'x11-misc/rofi-1.3.0',
  'x11-themes/arc-theme-20161119',
  'dev-util/clion-2016.2.1',
  'dev-util/pycharm-community-2016.3.2'
] %}

{% for package in use_testing %}
accept-keywords/{{package}}:
  file.append:
    - name: /etc/portage/package.accept_keywords
    - text: ={{package}} ~amd64
{% endfor %}
