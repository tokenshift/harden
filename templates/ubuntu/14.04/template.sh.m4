include(partials/apt_upgrade_software.sh.partial)

include(partials/apt_upgrade_kernel.sh.partial)

define(APT_INSTALL_LIST, iptables)dnl
include(partials/apt_install.sh.partial)
include(partials/iptables_setup.sh.partial)
