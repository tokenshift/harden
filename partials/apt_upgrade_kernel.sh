echo "Upgrading the linux kernel"
apt-get upgrade -y linux-generic linux-headers-generic linux-image-generic
apt-get autoremove -y