# Set up the make.conf dir to have all the standard stuff in it
# Including use flags! Woo gentoo!

# By default this is a file, but apparently as a dir it will include everything
# inside it
# I'm not sure if salt will overwrite the file with a dir if it's there already

/etc/portage/make.conf:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 644
    - makedirs: True

#TODO copy the rest of this from Nimitz
{% for cfile in [
  '001_pkgdirs',
  '002_chost',
  '100_mirrors',
  '200_CFLAGS',
  '300_makeopts',
  '400_cpu_flags',
  '500_vcards',
  '600_input'
  '999_use'
  ] %}
/etc/portage/make.conf/{{ cfile }}.conf:
  file.managed:
    - source: salt://os/gentoo/make/{{ cfile }}.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /etc/portage/make.conf
    - require_in:
      - test: make.conf
{% endfor %}

make.conf:
  test.nop: []
