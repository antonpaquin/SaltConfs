# Primarily, this sets what packages are allowed to use the ~amd64 testing lib

{% set use_testing = [
  'app-admin/salt',

  'app-editors/atom',

  'app-emulation/wine',

  'app-eselect/eselect-electron',

  'cross-avr/binutils',

  'dev-libs/mathjax',

  'dev-python/backports-shutil_get_terminal_size',
  'dev-python/entrypoints'
  'dev-python/ipykernel',
  'dev-python/ipyparallel',
  'dev-python/ipython',
  'dev-python/ipywidgets',
  'dev-python/jupyter',
  'dev-python/jupyter_client',
  'dev-python/jupyter_console',
  'dev-python/jupyter_core',
  'dev-python/nbconvert',
  'dev-python/nbformat',
  'dev-python/notebook',
  'dev-python/prompt_toolkit',
  'dev-python/qtconsole',
  'dev-python/widgetsnbextension',

  'dev-util/clion',
  'dev-util/electron',
  'dev-util/pycharm-community',

  'sys-libs/binutils-libs',

  'x11-libs/xcb-util-xrm',

  'x11-misc/rofi',
  'x11-misc/sxhkd',

  'x11-themes/arc-theme',

  'x11-wm/bspwm'
] %}

{% for package in use_testing %}
accept-keywords/{{package}}:
  file.append:
    - name: /etc/portage/package.accept_keywords
    - text: {{package}} ~amd64
{% endfor %}
