aptitude clean
{% for pkg in pkgs %}
apt-get download $(apt-rdepends {{ pkg }} |grep -v "^ ")
{% endfor %}
cp /var/cache/apt/archives/*.deb /usr/local/deb/
dpkg-scanpackages /usr/local/deb | gzip > /usr/local/deb/Packages.gz
