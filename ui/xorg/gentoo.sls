# Setting up xorg on gentoo, what could be better?
# Thank past me for giving you salt for this

x11-base/xorg-server:
  pkg.installed:
    - name: "x11-base/xorg-server"
    - require_in:
      - test: built_xorg
    - require:
      - test: make.conf

xinput:
  pkg.installed:
    - name: x11-apps/xinput
