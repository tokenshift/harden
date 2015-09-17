include(partials/apt_upgrade_software.sh)

include(partials/apt_upgrade_kernel.sh)

define(APT_INSTALL_LIST, iptables)dnl
include(partials/apt_install.sh)
include(partials/iptables_setup.sh)
