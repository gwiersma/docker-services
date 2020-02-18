#!/bin/sh

mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

#. /etc/profile

# See https://openvpn.net/index.php/open-source/documentation/manuals/65-openvpn-20x-manpage.html (--up cmd)

if [ ! -e "/dev/random" ]; then
  # Avoid "Fatal: no entropy gathering module detected" error
  echo "INFO: /dev/random not found - symlink to /dev/urandom"
  ln -s /dev/urandom /dev/random
fi

echo "STARTING SABNZBD with USER ${USER_NAME}"

# ENV Variables missing - fix needed
exec sudo -u abc /usr/bin/sabnzbdplus --config-file /config --server 0.0.0.0:8080 &

echo "Startup script SABnzbd completed."
