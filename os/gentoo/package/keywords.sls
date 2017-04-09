# Primarily, this sets what packages are allowed to use the ~amd64 testing lib

{% set use_testing = [
  'app-admin/salt-2016.11.0',
  'x11-misc/sxhkd-0.5.7',
  'app-eselect/eselect-electron-1.0.0',
  'app-editors/atom-1.12.2',
  'dev-util/electron-1.3.13-r1',
  'x11-wm/bspwm-0.9.2',
  'x11-libs/xcb-util-xrm-1.2',
  'x11-misc/rofi-1.3.0',
  'x11-themes/arc-theme-20161119',
  'dev-util/clion-2016.2.1',
  'dev-util/pycharm-community-2016.3.2',
  'cross-avr/binutils-2.27',
  'sys-libs/binutils-libs-2.27',
  'dev-python/backports-shutil_get_terminal_size-1.0.0-r1',
  'dev-python/ipywidgets-5.2.2',
  'dev-python/nbconvert-4.3.0',
  'dev-python/entrypoints-0.2.1',
  'dev-python/prompt_toolkit-1.0.3',
  'dev-python/ipyparallel-5.2.0',
  'dev-python/nbformat-4.2.0',
  'dev-python/jupyter_console-5.0.0',
  'dev-python/ipykernel-4.5.2',
  'dev-python/qtconsole-4.2.1',
  'dev-libs/mathjax-2.7.0',
  'dev-python/widgetsnbextension-1.2.6',
  'dev-python/jupyter-1.0.0-r1',
  'dev-python/notebook-4.3.0',
  'dev-python/jupyter_core-4.2.1',
  'dev-python/jupyter_client-4.4.0',
  'dev-python/ipython-5.1.0',
] %}

{% for package in use_testing %}
accept-keywords/{{package}}:
  file.append:
    - name: /etc/portage/package.accept_keywords
    - text: ={{package}} ~amd64
{% endfor %}
